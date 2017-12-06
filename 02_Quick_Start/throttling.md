---
title: "Understanding the throttling mechanisms of Warp 10"
layout: "function"
isPage: "true"
link: "/throttling"
categoryTree: ["getting-started"]
category: "getting-started"
---

In order to prevent uncontrolled data ingestion, Warp 10 comes with a throttling mechanism designed to limit both the number of Geo Time Series and the number of datapoints that an individual user can create.

These limits are by default set to 0 meaning that ni

# Geo Time Series limits

The limit in the number of Geo Time Series (GTS) that a user can create is enforced on a monthly basis via a quota called `MADS` for Monthly Active Data Streams. Every Geo Time Series which receives at least one update during the one month period counts towards the `MADS` quota. If a user attemps to update a GTS over its quota, an informational error message will be returned stating that a particular GTS would exceed the defined quota for that user.

In a distributed Warp 10 deployment, the set of active data streams is synchronized between the hosts using a dedicated Kafka topic.

# Datapoints limits

The limit in datapoints is a daily one, conveniently called `DDP` for Daily Data Points. But instead of enforcing a strict limit on the number of datapoints uploaded daily, Warp 10 defines a rate of ingestion that each user cannot exceed. If the amount of time to wait before a user can push data to stay within its defined rate goes above a certain limit, an informational message will be returned to the calling user.

The use of a rate limit instead of a strict datapoint number limit was chosen to enable a user who has exceeded its `DDP` quota to still push datapoints but at a reduced rate. The caveat of this approach is that the rate should be changed dynamically according to rules applying to the current daily amount of datapoints ingested. Fortunately the configuration of the throttling mechanism allows that.

# Configuring throttling

The configuration of throttling is done via the following configuration parameters:

## Distributed Warp 10

```
ingress.kafka.throttling.brokerlist
ingress.kafka.throttling.producer.clientid
ingress.kafka.throttling.request.timeout.ms
ingress.kafka.throttling.topic
ingress.kafka.throttling.zkconnect
ingress.kafka.throttling.consumer.clientid
ingress.kafka.throttling.groupid
ingress.kafka.throttling.consumer.auto.offset.reset

throttling.manager.dir
throttling.manager.period

throttling.manager.rampup
throttling.manager.estimator.cache.size
throttling.manager.rate.default
throttling.manager.mads.default
throttling.manager.maxwait.default
```

## Standalone Warp 10

```
throttling.manager.dir
throttling.manager.period
throttling.manager.rampup
throttling.manager.rate.default
throttling.manager.mads.default
```

## Throttling file

The `throttling.manager.dir` directory can receive so called throttling files which, if they end in `.throttle` and have not yet been read will be interpreted by the throttling manager to set custom limits for specific users (producers) or applications.

This file is a simple text file whose lines contain the following fields

```
PRODUCER_UUID:MADS:RATE::#
+APPLICATION_NAME:MADS:RATE::#
```

The per application limits cannot exceed the per producer limits.
