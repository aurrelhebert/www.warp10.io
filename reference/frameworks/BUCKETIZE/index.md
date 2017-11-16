---
title: "BUCKETIZE"
layout: "function"
isPage: "true"
link: "/warpscript/frameworks"
desc: "Bucketize a Geo Time Series applying a bucketizer function"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","101-framework-bucketize","100-framework-bucketize.html.md.eco"]
category: "reference"
---



The geo time series kept in the Warp10 platform grow over time as more measurements are added. Some series have very regular measurements, others more sporadic ones. But when it comes to manipulating the data, it might be handy to be able to impose some kind of regularity to measurements. This is exactly what the `BUCKETIZE` framework does, it provides the tooling for putting the data of a geo time serie into regularly spaced *buckets*.

A *bucket* is a time interval which spans a certain number of microseconds called the *bucketspan*, ending at a tick called the *bucketend*.

As an example, the *bucket* spanning 10 microseconds and ending at microsecond 20 will contain all measurements taken at the following times:

20, 19, 18, 17, 16, 15, 14, 13, 12, 11

the previous *bucket* with the same *bucketspan* ends at 10 and covers ticks 10 down to 1. The next *bucket* ends at 30 and covers ticks 21 to 30.

A *bucketized* geo time serie is characterized by its *bucketspan*, its *bucketcount* and the *bucketend* of the most recent *bucket*, called *lastbucket*. A *bucketized* geo time serie has at most one measurement per *bucket*, there might be buckets with no measurements.

The `BUCKETIZE` framework is used to convert a non bucketized geo time serie into a bucketized one. The *bucketization* process collects the measurements of the original geo time serie which fall in each bucket and apply a *bucketizer* function on those data, thus leading to at most a single measurement for each bucket.

The `BUCKETIZE` framework comes with a number of *bucketizer* which implement very common aggregation functions such as SUM, MIN, MAX, MEAN, *etc*.

## Syntax ##


```
[ [GTS] ... [GTS] bucketizer lastbucket bucketspan bucketcount ] BUCKETIZE
```

`BUCKETIZE` takes as input a single parameter which is a list of the following:

`[GTS]` one or several lists of geo time series. The result of the call to `BUCKETIZE` will be a single list containing bucketized versions of all geo time series present in the input lists.

`lastbucket` specifies the timestamp in microseconds since the Unix Epoch of the end of the most recent bucket. If you set this value to 0, this timestamp will be computed automatically so it covers the most recent value of the geo time serie and falls on a *bucketspan* boundary.

`bucketspan` width in microseconds of each bucket. If `bucketspan` is 0 but `bucketcount` is set, WarpScript will compute bucketspan so `bucketcount` buckets
cover the complete set of values from firsttick to lasttick

`bucketcount` number of buckets of the bucketized geo time series. If this value is set to 0, the number of buckets will be computed so the first value of the geo time serie is within the first bucket.

See also [the list of available bucketizers]({{ site.baseurl }}/reference/reference#framework-bucketizers)
