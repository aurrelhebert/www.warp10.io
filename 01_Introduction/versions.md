---
title: Versions
layout: function
isPage: true
category: introduction
---

The Warp 10 platform comes in two versions, *standalone* and *distributed*. Both versions provide the same level of functionality minus some minor differences, the complete WarpScript language is available in both versions.

The standalone version is designed to be deployed on a single server whose size can range from a Raspberry Pi to a multi CPU box. It uses <a href="https://github.com/google/leveldb">LevelDB</a> as its storage layer.

The distributed version uses <a href="http://hbase.apache.org/">HBase</a> for data persistence and also relies on <a href="http://kafka.apache.org/">Kafka</a> and <a href="http://zookeeper.apache.org/">ZooKeeper</a> thus making it a little more delicate to deploy.

The standalone version has been tested with several tens of billions of datapoints and several million Geo Time Series. The distributed version has been used with over 100M Geo Time Series and several trillion datapoints in a rather modest setup.

In terms of performance, the standalone version will enable you to ingest data up to several 100s of thousands of datapoints per second on a standard server, and even north of 1000 on a Raspberry Pi. The performance of the distributed version is scalable and will grow as you add components. On a set of 10 machines you can expect to attain more than one million datapoints per second.

The speed of the Warp 10 platform is obtained by adopting what we call a *no lookup* approach, meaning that we do not look up IDs in external directories when recording data. The identifiers we use for Geo Time Series are computed from their class and labels using cryptographic hash functions, this gives us speed but comes with a non zero probability of collision. The version we released as Open Source uses 64 bits hashes for both class and labels, meaning that, given the <a href="https://en.wikipedia.org/wiki/Birthday_attack">Birthday Paradox</a>, the more classes or sets of labels you have, the higher the risk of collision. A collision in class ids is only problematic if the colliding classes are used with a common set of labels, and similarly, a collision in labels ids is problematic only if the two colliding sets are used in the same class. To greatly reduce the risk of collision (which we have not yet experienced, even with several millions Geo Time Series), we will release a version giving you an option to use 128 bits hashes for both classes and labels making the probability of collision highly unlikely, or at least less likely than errors in data stored in hard drives.

Do not hesitate to use the <a href="https://groups.google.com/forum/#!forum/warp10-users">Warp 10 Users</a> group to help you chose between the standalone and distributed versions.
