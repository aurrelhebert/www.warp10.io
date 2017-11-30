---
title: "Setting up a Distributed Version of Warp 10"
layout: "function"
isPage: "true"
link: "/distributed-setup"
categoryTree: ["getting-started"]
category: "getting-started"
---

By carefully following the instructions on this page you should have a working Warp 10 distributed platform in no time.

A Warp 10 distributed platform is called a _cell_, throughout this guide we will consider that your cell is named `prod`.

# Configuring ZooKeeper

We highly recommend you use a single ZooKeeper ensemble for Kafka, Hadoop, HBase and Warp 10, this makes the ops side of things simpler.

Our best practice is also to isolate the various znodes hierarchies under dedicated root znodes.

Here are the `znodes` you should create in your ZooKeeper:

```
/zk

/zk/kafka
/zk/kafka/prod

/zk/warp
/zk/warp/prod
/zk/warp/prod/services
/zk/warp/prod/plasma

/zk/hbase
/zk/hbase/prod
```

We add a `/zk` prefix to all znodes so we recognize a znode path when we see one.

We assume no authentication is performed by Warp 10, HBase or Kafka when connecting to ZooKeeper, so everyone should be able to write to the above znodes.

# Configuring Kafka

Warp 10 relies on several Kafka topics to exchange messages between its various components.

Remember that the parallelism unit when consuming Kafka topics is the partition so adjust the number of partitions of the various topics so you achieve the expected parallelism (based on thread count configured) in your consumers.

The Kafka producers ensure that messages for a given Geo Time Series are always sent to the same partition.

A Kafka topic is created using the `kafka-topics.sh` tool provided by Kafka.

## `metadata` topic

This topic is populated by `ingress` whenever new Geo Time Series are encountered, when their attributes are modified or when a complete GTS is deleted. It is consumed by `directory` to update the GTS register and by `ingress` to update their GTS cache.

This topic must be consumed using a dedicated `groupid` per `ingress` and per `directory`.

## `data` topic

This topic is populated by `ingress` when new data is pushed for a Geo Time Series or when a deletion request is made. This serialization of updates and deletes in the same topic (and same partition for a given GTS) is there to ensure the order of those operations.

The `data` topic is consumed by `store` which persists the updates in HBase and performs calls to the `BulkDeleteEndpoint` for deletes. The data is also consumed by `plasmaBE`.

The `groupid` used to consume this topic is common to all `store` instances. The `plasmaBE` instances also share a common `groupid`.

## `throttling` topic

This topic is populated and consumed by `ingress`, it conveys estimators of updated Geo Time Series so the throttling mechanism on all `ingress` sees a converged view of the active data streams. This topic is consumed using a dedicated `groupid` per `ingress`.

## `webcall` topic

This topic is used by `egress` whenever the `WEBCALL` function is called to push a request which will be handled by an instance of `webcall`. It must be consumed using a single `groupid` among all `webcall` instances.

## `runner` topic

This topic is used by `runner` instances to push script execution requests. It is consumed by `worker` instances which should all use an identical `groupid`.

## `plasmafeXX` topics

There is one such topic defined per `plasmaFE` instance. These topics are used by `plasmaBE` instances to push the data to which clients subscribed. Each topic is consumed by a single `plasmaFE` instance.

# Configuring HBase

A Warp 10 instance uses a single table for storing both metadata and datapoints. This table is created using the HBase shell command in file [continuum.hbase](https://github.com/cityzendata/warp10-platform/blob/master/etc/continuum.hbase).

# Deploying Warp 10

Warp 10 is configured using a single configuration file which defines properties. The [template config file](https://github.com/cityzendata/warp10-platform/blob/master/etc/conf-distributed.template) is extensively commented and we invite you to carefully read all those comments when configuring a given component.

Warp 10 makes a heavy use of cryptographic hash functions and encryption and relies on a set of keys being defined in the configuration, these keys are mandatory and cannot be changed once they have been used. Treat those keys as you would your most precious secrets.

Once your keys are set you can generate write and read tokens using the [Worf]({{ site.baseurl }}/tools/worf) tool. Generate a pair of such tokens now as you will need them to test the Warp 10 components later.

The components should be deployed in the order specified below. Note that `plasma` is optional, only deploy it if you want to support the streaming (WebSocket) endpoints.

An instance of Warp 10 can run multiple components, refer to the resources each component requires when selecting which ones to run together.

As a best practice, `egress`, `directory`, `store` and `ingress` should be run in their own JVM. `webcall` and `runner` can be colocated with `egress`.

A Warp 10 instance is started using

```
java ${JAVA_OPTS} -cp warp10-x.y.z.jar io.warp10.WarpDist path/to/warp.config
```

## Deploying ingress

`ingress` is CPU and network bound and in a lesser way also memory bound (depending on the size of the cache you have configured).

Once `ingress` is deployed and started it will listen on port *8882*. You can push test data to `ingress` using:

```
curl -H 'X-Warp10-Token: WRITE_TOKEN' --data-binary '// test{} T' http://host:8882/api/v0/update
```

By checking the `metadata` and `data` topics in Kafka, you should see that one message arrived in each of those topics. If this is the case, then your `ingress` deployment is a success.

## Deploying directory

`directory` is memory bound.

When `directory` is started, it should read metadatas in HBase and populate its Geo Time Series registry, then it will consume the `metadata` topic and update its registry accordingly.

If you check Kafka, you should see that the message you identified above has been consumed using the `groupid` of your `directory`. You can also scan the table in HBase for the `m` column family, it should have an entry.

## Deploying store

`store` is CPU and network bound.

Once started, `store` will consume the `data` topic and populate HBase or proceed with deletions. Check Kafka and confirm that the `data` topic is being consumed. You can also scan the `v` column family in the HBase table to confirm there is an entry.

## Deploying egress

`egress` is memory and network bound.

Once started, `egress` will listen on port *8881* for incoming requests. You can check that your `egress` instance is working by running the following command:

```
curl --data-binary "[ 'READ_TOKEN' 'test' {} NOW -1 ] FETCH" http://host:8881/api/v0/exec
```

which should return a Geo Time Series object with a single datapoint.

Congratulations, you now have a working Warp 10 distributed platform!

## Deploying webcall

`webcall` does not consume any particular resources, it must have access to the sites allowed in `WEBCALL` calls.

Check that the `webcall` topic is indeed consumed after issueing a [WEBCALL](http://www.warp10.io/reference/functions/function_WEBCALL) call to `egress`.

## Deploying Plasma

`plasmaBE` is network bound as it consumes the whole `data` topic. `plasmaFE` may become network bound if many subscriptions are done.

`PlasmaFE` listens on port *8884*.

You can test `plasma` by using this [Python script](https://github.com/cityzendata/warp10-platform/blob/master/warp10/src/main/python/plasma-pull.py) and pushing data to `ingress`.

## Deploying runner

The `runner` component can be configured to assume one of several roles. In the `standalone` role, the `runner` instance will schedule the scripts and will submit them to the configured `egress` endpoint. In the `scheduler` role, `runner` will schedule the scripts and push execution requests into the `runner` Kafka topic. And last, in the `worker` role, `runner` consumes the `runner` Kafka topic and executes the requests on the configured `egress`.

To test `runner`, deploy a script in a subdirectory of the configured script directory in a sub-sub directory with the expected script periodicity, _i.e._

```
testing/60000/foo.mc2
```

for a script which should be executed every 60s.

## Deploying fetcher

`fetcher` is network bound.

Testing `fetcher` is out of scope of this guide, please refer to the warp10-pig tutorial for more infos.
