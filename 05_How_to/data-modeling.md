---
title: Data modeling
layout: function
isPage: true
category: howto
---




## Classname and labels

All data in Warp 10 is stored as [Geo-Time Series (GTS)](http://www.warp10.io/introduction/platform/#geo-time-seriessupsup). GTS are streams of datapoints, each datapoint defined by a timestamp, a position (optional) and a value. Every GTS is uniquely identified by its *classname* and its *labels*.

The *classname* of a GTS defines the metric, the measured feature (e.g. temperature, pressure, load...), and the *labels* are *key-value* pairs that allow to identify an instance of this metric (e.g. sensor id, owner...). Any changes on labels (changing any label value, adding or removing a label...) create a new GTS.

In this doc we will use a compact notation to describe a GTS classname and labels, `<classname>{<label key>=<label value>, ...}`.

### Examples

#### Weather sensors

Let's say we want have some connected weather sensors and we want to store their data into Warp 10. For this example, each weather sensor produces two different metrics: temperature and atmospheric pressure, and we know its owner and an identifiant (like a serial number).

There are two measurable features, temperature and pressure, so we define two classnames: `temperature` and `pressure`, and two label keys: `owner` and `sensor_id`.  

Then every sensor will generate two GTS:

```
temperature{sensorId=XXXX,owner=YYYY}
pressure{sensorId=XXXX,owner=YYYY}
```

where `XXXX` is the sensor id and `YYYY` the owner for that sensor.


#### API monitoring

Let's say now you're monitoring a REST API and you want to know the number of requests and the response time for each one of your API function and HTTP methods.

There are two measured features,  number of requests and response time, so we define two classnames: `api.requests.total` and `api.request.duration.milliseconds`.
We want to measure these features for the different functions of our API, for each function we need to differentiate the measures according to the HTTP method used in the requests.
We define then two labels: `function` and `http_method`.

Let's say that our API has two functions: `/list` (with accepts only GET requests) and `/item` (accepting the classic REST verbs). We would get the following GTS:

```
api.requests.total{function=list,method=GET}
api.requests.total{function=item,method=GET}
api.requests.total{function=item,method=POST}
api.requests.total{function=item,method=PUT}
api.requests.total{function=item,method=DELETE}

api.request.duration.milliseconds{function=list,method=GET}
api.request.duration.milliseconds{function=item,method=GET}
api.request.duration.milliseconds{function=item,method=POST}
api.request.duration.milliseconds{function=item,method=PUT}
api.request.duration.milliseconds{function=item,method=DELETE}
```
