---
title: "Warp 10 for InfluxDB users"
layout: "function"
isPage: "true"
category: "howto"
---


## Use applications to separate unrelated data

The concept of database doesn't exist in Warp10. However, in Warp 10, [multiple application can be managed and created]({{ site.baseurl }}/getting-started/setup). This concept is to use mainly to separate data from differents users.

## Data structure

In InfluxDB, data have the following structure

```
'cpu_load_short,host=server01,region=us-west value=0.64 1434055562000000000'
```

In Warp 10, data have the following form

```
timestamp/latitude:longitude/elevation name{labels} value
```

Only the value name is required.

  timestamp - A Unix/POSIX Epoch timestamp in the unit time of the platform (by default in <b>microseconds</b>) defined as the number of seconds that have elapsed since January 1st, 1970 at 00:00:00 UTC time.
  latitude:longitude - optional geographic coordinates of the reading, using [WGS84](http://en.wikipedia.org/wiki/WGS84).
  elevation - optional elevation of the reading, in millimeters.
  value - A value to store at the given timestamp for the time series. This may be a double, a string, a boolean or long value.
  name - A generic name for the time serie
  label(s) - A key/value pair consisting of a key (the key) and a value (the value). A data point may have any tag.

Example of correct data points.

```
  1380475081000000// foo{label0=val0,label1=val1} 123
  /48.0:-4.5/ bar{label0=val0} 3.14
  1380475081123456/45.0:-0.01/10000000 foobar{label1=val1} T
  // foo{label0=val0,label1=val1} true
  // foo{label1=val2} 'any text'
  /49.0:-4.6/ bar{} 42
```

## Pushing data

A post on InfluxDB is done by executing the following curl request

```
curl -i -XPOST 'http://localhost:8086/write?db=mydb' --data-binary 'cpu_load_short,host=server01,region=us-west value=0.64 1434055562000000000'
```

Pushing data on Warp 10 can quickly be done using curl. A curl request must have the following form. An example file containing 10 gts is available [here.]({{ site.baseurl }}/assets/data/drones) This tutorial use those data as an example.

```
    curl -H 'X-Warp10-Token: TOKEN_WRITE' -H 'Transfer-Encoding: chunked' --data-binary @METRICS_FILE 'https://API_ENDPOINT/api/v0/update'
```

Replace TOKEN_WRITE by the token saw on the credential page, METRICS_FILE by the URL of the file saved on previous page, or by an url of your own file containing data and replace API_ENDPOINT by the one available on your application page. For more information, refers to the documentation pages [Pushing data]({{ site.baseurl }}/howto/pushing-data) and [Pushing data using the WebSocket interface]({{ site.baseurl }}//howto/websocket-push).

## How to run a WarpScript

With a curl request, write your WarpScript code inside a file.mc2 and then run the following curl request. If everything is OK, you should receive a HTTP 200 OK with your datapoint in JSON format.
```
curl --data-binary @file.mc2 'https://API_ENDPOINT/api/v0/exec'
```

The following part will be using quantum to execute Warp script. A read token is necessary, and have to be stored like this :

```
'AREADTOKEN'
'TOKEN' STORE
```
In your file.mc2 replace AREADTOKEN, by your application read token, and start your file with those two lines.

## The basic SELECT statement on Influx data

### SELECT ALL

* In InfluxDB

```
 > SELECT * FROM h2o_feet
```

* Translation to WarpScript

```
[ $token '~example.drone.*' {} NOW NOW ] FETCH
```

* Explanation: token is the identifiant allowing reading of your application. What does this function ? It will load all the data contained in GTS containing in their name the string "gts". It will load only data having a timestamp that belong in the following time interval: now, and now minus now wich equals to 0.  If you have timestamp in the futur, instead of NOW, it's possible to use MAXLONG, or to define a new variable storing your max value:

```
7763850937000000 'maxvalue' STORE
[ $token '~example.drone.*' {} $maxvalue $maxvalue ] FETCH
```

* To get more information about fetch, refers to the [Fetch API.]({{ site.baseurl }}/reference/functions/function_FETCH)

### SELECT with tag key or field key

* In InfluxDB

```
> SELECT "level description",location,water_level FROM h2o_feet
```

* Translation to WarpScript

```
[ $token '~example.drone.*' { 'type' 'captor.time' } NOW -1000 ] FETCH  FETCH
```

* Explanation: to search specific data, the way to do it is to filter GTS name inside an application with regular expression: '~xxx.\*', and you can also look to specific labels: { 'label0' '~myLab.\*' }. In Fetch, intsead of looking for an interval, it's also possible to load the last X data. Instead of using a positive number use a negative one.

### Compute arithmetics

* In InfluxDB

```
> SELECT water_level + 2 FROM h2o_feet
```

* Translation to WarpScript

```
[ $token 'example.drone.captor.gts4' { 'type' 'captor.time' } NOW -1000 ] FETCH
[ SWAP 2 mapper.add 0 0 0 ] MAP
```

* Explanation: the function `MAP` will take also GTS in top of stack and add the value 2 at each tick. The `mapper` used is add, check this [page]({{ site.baseurl }}/reference/frameworks/framework-map) for more information about which operation are available. The 3 0 given as parameter are sliding window, the first one correspond to the past, the second to the post, and the last one to the occurence. However, an add can only be compute on one value, meaning that the 2 first values of this sliding window have to be equals to 0. You can change the number of occurence, wich add 2 to the first X number selected (0 add 2 to all). You will get the resulting GTS on top of the stack.


### The WHERE clause

* In InfluxDB

```
> SELECT * FROM h2o_feet WHERE location = 'coyote_creek' AND  water_level > 8
```

* Translation to WarpScript

```
[ $token '~example.drone.captor.gts4' { 'type' 'captor.time' } NOW -1000 ] FETCH
[ SWAP 50 mapper.gt 0 0 0 ] MAP
```

* Explanation: There is no where clause in WarpScript, but you can use regular expressions to select your GTS. Then you can use a *Mapper* like `mapper.gt` to get all GTS having a value greater than 50.

### Time ranges

* In InfluxDB

```
> SELECT * FROM h2o_feet WHERE time > now() - 7d
```

* Translation to WarpScript

```
[ $token '~example.drone.captor.gts4' { 'type' 'captor.time' } 1449222483312000 'P1d2h30m30s' DURATION ] FETCH
```

* Explanation: The previous request will get all data of the last day plus 2 hours, 30 minutes and 30 seconds before the last timestamp of the example gts. DURATION translate an ISO Norm in unit time of the plat-form. Month and year may give a wrong analysis as the doesn't have a regular time.

* In WarpScript, a better use of time is the use of [`BUCKETIZE` framework]({{ site.baseurl }}/howto/intro-bucketize). Fetch all the data, and the keep for all sensors, minutes by minutes, the mean during a minute.

```
[
  [ $token '~example.drone.*' {}
      '2015-09-30T00:00:00.000Z'
      '2016-01-05T23:59:59.999Z'
  ] FETCH
  bucketizer.mean       // bucketizer
  0                     // lastbucket
  60000000            // bucketspan
  0                     // bucketcount
] BUCKETIZE             // BUCKETIZE
```
## The GROUP BY clause

### The basic GROUP BY clause

* In InfluxDB

```
> SELECT MEAN(water_level) FROM h2o_feet GROUP BY location
```

* Translation to WarpScript

```
[ $token '~example.drone.*' {} NOW -1000 ] FETCH
[ SWAP ['type'] reducer.mean ] REDUCE
NONEMPTY
```
* Explanation: This request will compute the mean of all gts of the application starting by example.drone group by the label type. Only the non empty GTS are kept as a result.

### GROUP BY time intervals

* In InfluxDB

```
> SELECT COUNT(water_level) FROM h2o_feet WHERE time >= '2015-08-18T00:00:00Z' AND time <= '2015-09-18T17:00:00Z' AND location='coyote_creek' GROUP BY time(2d)
```

* Translation to WarpScript

```
[ $token '~example.drone.*' {} 1449222483312000 'P0h2m30s' DURATION ] FETCH
[ SWAP [ 'type' ] reducer.count ] REDUCE
NONEMPTY
```

* Explanation: To do a group by time, use the fetch possiblity. Here the last 2 minutes and half of recorded, and then a group by type is used during the `REDUCE`. This will count the number of points at each timestamp.

## The INTO clause

* In InfluxDB

```
> SELECT mean(water_level) INTO average FROM h2o_feet WHERE location = 'santa_monica' AND time >= '2015-08-18T00:00:00Z' AND time <= '2015-08-18T00:30:00Z' GROUP BY time(12m)
```

* Translation to WarpScript

```
[ $token '~example.drone.*' {} 1449222483312000 'P0h2m30s' DURATION ] FETCH
[ SWAP [ 'type' ] reducer.count ] REDUCE
NONEMPTY
1 GET
'result'
RENAME
$writeToken
UPDATE
```

* Explanation: The result of the previous group by is still on stop of the stack, the second GTS is renamed as result. Then update push the gts result on the platform. UPDATE can take 1 gts or a list.

## Sort query returns with ORDER BY time DESC

* In InfluxDB

```
> SELECT water_level FROM h2o_feet WHERE location = 'santa_monica' ORDER BY time DESC LIMIT 5
```

* Translation to WarpScript

```
[ $token '~example.drone.captor.*' {} 1449222483312000 'P0h2m30s' DURATION ] FETCH
RSORT
```

* Explanation: In WarpScript, there is a possiblity to sort series by time using RSORT or SORT. RSORT will sort the series by descending time, when SORT will sort by ascending time.

## Multiple statements in queries

* Multiple statement can easily be done in warp script. A small example is given below, this sample will first load all the data of the drone file using fetch. Then it will divide the GTS in small bucket of 1 minute keeping for each GTS the max value recorded during this minute. A [`REDUCE`]({{ site.baseurl }}/reference/frameworks/framework-reduce) is then apply to those GTS. This function will group all GTS having the same label "type". Then it will *reduce* them computing the average for each bucket. As a result, for each type (here 2), we got one GTS containing the average value of all gts minute by minute. For the last analysis, only the first resulting GTS is kept, and a [`MAP`]({{ site.baseurl }}/reference/frameworks/framework-map) is applied on it. This `MAP` function will simply compute a moving average using a sliding window. This window need 2 values before and 5 after the current value of the current bucket. Finally the data will be stored on the platform. To store the data, you have to rename the GTS, after an operation like a `MAP` (That's why a `LMAP` is executed to rename all elements of the list). To write data on Warp 10, a write token is necessary.

```
[ $token '~example.drone.*' {} NOW -1000 ] FETCH
[ SWAP bucketizer.max 0 60000000 0 ] BUCKETIZE
[ SWAP [ 'type' ] reducer.mean ] REDUCE
NONEMPTY
0 GET
'resultMovingMean'
RENAME
[ SWAP mapper.mean 2 5 0 ] MAP
<%
 DROP
 DUP NAME
 RENAME
%>
LMAP
$writeToken UPDATE
```

See the page [reference]({{ site.baseurl }}/reference) for more information about the implemented function in WarpScript.

-----------------------------------

Access [here]({{ site.baseurl }}/howto/intro-reduce) to the *`BUCKETIZE` tutorial*, it will give you more explanation about this important framework in the GTS analysis.
