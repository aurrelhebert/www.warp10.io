---
title: "Getting Started with the Distributed Version of Warp 10"
layout: "function"
isPage: "true"
link: "/distributed"
categoryTree: ["getting-started"]
category: "getting-started"
---

This page details how to deploy the distributed version of the Warp 10 platform.

# Planning your deployment

The distributed version of Warp 10 relies on the following components which you should deploy in the specified versions:

* [ZooKeeper](http://zookeeper.apache.org/) 3.4.x
* [Kafka](http://kafka.apache.org/) 0.8.2.2
* [Hadoop](http://hadoop.apache.org/) 2.6.0
* [HBase](http://hbase.apache.org/) 1.1.x

# Introducing the Warp 10 components

The distributed version of the Warp 10 platform is a set of components (or *daemons*) working together to provide the service. All components can be deployed multiple times to address scalability and high availability.

Any combination of components can be launched in a single JVM. Some components can be omitted if you do not wish to provide the associated functionnality. The core components you should run are `ingress`, `directory`, `store` and `egress`, all others can be considered optional.

Below is a brief description of each of the components.

## ingress

The `ingress` component is responsible for ingesting and deleting data and for modifying the Geo Time Series metadata. It pushes the data and metadata in dedicated Kafka topics. It also consumes the Kafka *metadata* topic in order to keep track of known GTS.

## directory

The `directory` component is responsible for tracking all known Geo Time Series, it maintains their list in memory and responds to requests initiated by `egress`, `plasma frontend` and `geodir`.

The metadata are consumed off of the *metadata* Kafka topic and stored in HBase. Upon startup `directory` also reads all metadata stored in HBase.

Multiple instances of `directory` can be launched and each instance can be sharded (running as a set of multiple `directory` daemons each responsible for a subset of metadata).

## store

The `store` daemon is in charge of persisting datapoints in HBase. It consumes the Kafka *data* topic and writes the data in HBase.

Multiple `store` can be launched, each consuming some partitions of the Kafka topic.

## egress

The `egress` component is where the data analytics happen, it is the WarpScript execution engine. It talks to `directory` and fetches the datapoints from HBase. The `egress` component also knows how to talk to `ingress` to support the `UPDATE`, `META` and `DELETE` functions. It also pushes messages onto the Kafka *webcall* topic via the `WEBCALL` function.

## plasma backend (plasmaBE)

Plasma is the publish/subscribe subsystem of the Warp 10 platform. The `plasmaBE` component consumes the Kafka *data* topic and pushes the needed data to the topics associated with the various `plasmaFE` instances.

## plasma frontend (plasmaFE)

The `plasmaFE` component is in charge of the WebSocket endpoint where clients can subscribe to Geo Time Series. It talks to `directory`, stores subscriptions in ZooKeeper and consumes datapoints off of a dedicated Kafka topic.

## webcall

The `webcall` component consumes `WEBCALL` requests from the *webcall* Kafka topic and issues outgoing HTTP requests.

## runner

The `runner` component is in charge of scheduling and/or running WarpScript code at various periods. Each instance can be configured in `standalone` mode where it schedules and runs scripts from the same JVM or in one or both of `scheduler` or `worker` modes where the `scheduler` role schedules scripts by pushing them onto a dedicated Kafka topic and the `worker` role consumes the scripts to run from this same topic and triggers their execution.

## geodir

The `geodir` component allows you to defined Geo Directory which index Geo Time Series according to time and space with various resolutions. This component is the most complex of all, it talks to `directory` but also to ZooKeeper and Kafka. This component will be phased out in future releases of Warp 10.

## fetcher

The `fetcher` component can be used by batch jobs (in Pig, Flink, Spark or MapReduce) to load data using the `Warp10InputFormat`. It is meant to be launched on each RegionServer to benefit from data locality.

# Infrastructure components

## ZooKeeper

ZooKeeper is needed by Kafka, Hadoop (when enabling HA) and HBase. The Warp 10 platform also uses ZooKeeper to coordinate and discover services and to persist some data across runs.

The following Warp 10 configuration parameters are related to ZooKeeper, please refer to the [template configuration](https://github.com/cityzendata/warp10-platform/blob/master/etc/conf-distributed.template) file for the detail of each one:

```
directory.hbase.metadata.zkconnect
directory.hbase.metadata.znode
directory.kafka.metadata.zkconnect
directory.zk.quorum
directory.zk.znode

egress.hbase.data.zkconnect
egress.hbase.data.znode
egress.zk.quorum

geodir.kafka.data.zkconnect
geodir.kafka.subs.zkconnect
geodir.zk.directory.quorum
geodir.zk.directory.znode
geodir.zk.plasma.maxznodesize
geodir.zk.plasma.quorum
geodir.zk.plasma.znode
geodir.zk.service.quorum
geodir.zk.service.znode
geodir.zk.subs.aes
geodir.zk.subs.maxznodesize
geodir.zk.subs.quorum
geodir.zk.subs.znode

ingress.kafka.archive.zkconnect
ingress.kafka.data.zkconnect
ingress.kafka.metadata.zkconnect
ingress.zk.quorum

plasma.backend.kafka.in.zkconnect
plasma.backend.kafka.out.zkconnect
plasma.backend.subscriptions.zkconnect
plasma.backend.subscriptions.znode
plasma.frontend.kafka.zkconnect
plasma.frontend.zkconnect
plasma.frontend.znode

runner.kafka.zkconnect
runner.zk.quorum
runner.zk.znode

store.hbase.data.zkconnect
store.hbase.data.znode
store.kafka.data.zkconnect
store.zk.quorum

webcall.kafka.zkconnect
```

## Kafka

Kafka is central to Warp 10, it acts as the data hub of the platform and a great shock absorber which makes all components loosely coupled and enables them to scale and be updated without interrupting the overall service.

The follwing Kafka topics are needed by Warp 10:

* *metadata*
* *data*
* *throttling*
* *webcall*
* *plasmabe*
* *plasmafe* (one per instance)
* *warpscript*

The following configuration parameters are related to Kafka, please review their description in the [configuration template](https://github.com/cityzendata/warp10-platform/blob/master/etc/conf-distributed.template):

```
directory.kafka.metadata.aes
directory.kafka.metadata.commitperiod
directory.kafka.metadata.consumer.clientid=
directory.kafka.metadata.groupid
directory.kafka.metadata.mac
directory.kafka.metadata.topic
directory.kafka.metadata.zkconnect
directory.kafka.nthreads

geodir.kafka.data.aes
geodir.kafka.data.brokerlist
geodir.kafka.data.commitperiod
geodir.kafka.data.consumer.clientid=
geodir.kafka.data.groupid
geodir.kafka.data.mac
geodir.kafka.data.maxsize
geodir.kafka.data.nthreads
geodir.kafka.data.producer.clientid=
geodir.kafka.data.topic
geodir.kafka.data.zkconnect
geodir.kafka.subs.aes
geodir.kafka.subs.brokerlist
geodir.kafka.subs.commitperiod
geodir.kafka.subs.consumer.clientid=
geodir.kafka.subs.groupid
geodir.kafka.subs.mac
geodir.kafka.subs.nthreads
geodir.kafka.subs.producer.clientid=
geodir.kafka.subs.topic
geodir.kafka.subs.zkconnect

ingress.kafka.archive.aes
ingress.kafka.archive.brokerlist
ingress.kafka.archive.mac
ingress.kafka.archive.producer.clientid=
ingress.kafka.archive.topic
ingress.kafka.archive.zkconnect
ingress.kafka.data.aes
ingress.kafka.data.brokerlist
ingress.kafka.data.mac
ingress.kafka.data.maxsize
ingress.kafka.data.poolsize
ingress.kafka.data.producer.clientid=
ingress.kafka.data.topic
ingress.kafka.data.zkconnect
ingress.kafka.metadata.aes
ingress.kafka.metadata.brokerlist
ingress.kafka.metadata.commitperiod
ingress.kafka.metadata.consumer.clientid=
ingress.kafka.metadata.groupid
ingress.kafka.metadata.mac
ingress.kafka.metadata.maxsize
ingress.kafka.metadata.nthreads
ingress.kafka.metadata.poolsize
ingress.kafka.metadata.producer.clientid=
ingress.kafka.metadata.topic
ingress.kafka.metadata.zkconnect

plasma.backend.kafka.in.aes
plasma.backend.kafka.in.commitperiod
plasma.backend.kafka.in.consumer.clientid=
plasma.backend.kafka.in.groupid
plasma.backend.kafka.in.mac
plasma.backend.kafka.in.nthreads
plasma.backend.kafka.in.topic
plasma.backend.kafka.in.zkconnect
plasma.backend.kafka.out.aes
plasma.backend.kafka.out.brokerlist
plasma.backend.kafka.out.mac
plasma.backend.kafka.out.maxsize
plasma.backend.kafka.out.producer.clientid=
plasma.backend.kafka.out.topic
plasma.backend.kafka.out.zkconnect

plasma.frontend.kafka.aes
plasma.frontend.kafka.commitperiod
plasma.frontend.kafka.consumer.clientid=
plasma.frontend.kafka.groupid
plasma.frontend.kafka.mac
plasma.frontend.kafka.nthreads
plasma.frontend.kafka.topic
plasma.frontend.kafka.zkconnect

runner.kafka.aes
runner.kafka.brokerlist
runner.kafka.commitperiod
runner.kafka.consumer.clientid=
runner.kafka.groupid
runner.kafka.mac
runner.kafka.nthreads
runner.kafka.poolsize
runner.kafka.producer.clientid=
runner.kafka.topic
runner.kafka.zkconnect

store.kafka.data.aes
store.kafka.data.brokerlist
store.kafka.data.commitperiod
store.kafka.data.consumer.clientid=
store.kafka.data.groupid
store.kafka.data.intercommits.maxtime
store.kafka.data.mac
store.kafka.data.producer.clientid=
store.kafka.data.topic
store.kafka.data.zkconnect

webcall.kafka.aes
webcall.kafka.brokerlist
webcall.kafka.commitperiod
webcall.kafka.consumer.clientid
webcall.kafka.groupid
webcall.kafka.mac
webcall.kafka.producer.clientid
webcall.kafka.topic
webcall.kafka.zkconnect
```

## Hadoop

Hadoop is not needed directly by Warp 10 but used as the underlying storage by HBase. Beyond this storage role, Hadoop, and YARN specifically, can be leveraged to process massive amounts of Geo Time Series stored either in Warp 10 itself (in HBase) or in any other form using WarpScript on Pig, Flink or Spark.

Hadoop (HDFS) can also be used to perform backups of data stored in HBase.

## HBase

HBase is used as the main datastore of Warp 10. The data is organized in a single table containing two column families, one for the metadata and another one for the datapoints. Row keys for both types of data start with different prefixes. The creation command is available on [GitHub](https://github.com/cityzendata/warp10-platform/blob/master/etc/continuum.hbase).

For improved datapoints retrieval, a Warp 10 custom filter ([`org.apache.hadoop.hbase.filter.SlicedRowFilter`](https://github.com/cityzendata/warp10-platform/blob/master/warp10/src/main/java/org/apache/hadoop/hbase/filter/SlicedRowFilter.java))should be deployed on HBase. The jar file containing this filter is built using a dedicated [gradle task](https://github.com/cityzendata/warp10-platform/blob/master/build.gradle).

In order to support datapoints deletion, HBase must be configured with the [`BulkDeleteEndpoint`](https://hbase.apache.org/devapidocs/org/apache/hadoop/hbase/coprocessor/example/BulkDeleteEndpoint.html).

# Putting it all together

Once you've set up ZooKeeper, Kafka, Hadoop and HBase and with your Warp 10 configuration files  on hand, launching Warp 10 is simply a matter of executing

```
java -cp warp10-x.y.z.jar io.warp10.WarpDist path/to/configuration.file
```

on each machine where you want to run Warp 10 daemons.

Please follow those [detailed instructions]({{ site.baseurl }}/getting-started/distributed-setup) on how to set up the various Warp 10 components.

## HaProxy

In order to provide high-availability and load-balancing for `ingress`, `egress`, `plasmaFE` and `geodir`, we recommend you run [`haproxy`](http://www.haproxy.org/) in front of those Warp 10 daemons.

# Getting more help

Should you need help in setting up the distributed version of Warp 10, please start a conversation in the Warp 10 [Google Group](https://groups.google.com/forum/#!forum/warp10-users).
