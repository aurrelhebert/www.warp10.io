---
title: "Warp 10 for KairosDB users"
layout: "function"
isPage: "true"
category: "howto"
---

## Use application to separate unralated data

The concept of database doesn't exist in Warp 10. However, in Warp10, [multiple application can be managed and created]({{ site.baseurl }}/getting-started/setup). This concept is to use mainly to separate different data with differents users.

## Data Structure

In KairosDB, data have the following structure

```
put <metric name> <time stamp> <value> <tag> <tag>... \n
```

In Warp 10, data have the following form

```
timestamp/latitude:longitude/elevation name{labels} value
```

Only the value name is required.

  timestamp - A Unix/POSIX Epoch timestamp in the unit time of the platform (by default in <b>microseconds</b>) defined as the number of seconds that have elapsed since January 1st, 1970 at 00:00:00 UTC time.
  latitude:longitude - geographic coordinates of the reading, using [WGS84](http://en.wikipedia.org/wiki/WGS84).
  elevation - elevation of the reading, in millimeters.
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

Pushing data can quickly be done using curl. A curl request must have the following form. An example file containing 10 gts is available [here.]({{ site.baseurl }}/assets/data/drones) This tutorial use those data as an example.

```
    curl -H 'X-Warp10-Token: TOKEN_WRITE' -H 'Transfer-Encoding:chunked' --data-binary @METRICS_FILE 'https://API_ENDPOINT/api/v0/update'
```

Replace TOKEN_WRITE by the token saw on the credential page, METRICS_FILE by the URL of the file saved on previous page, or by an url of your own file containing data and replace API_ENDPOINT by the one available on your application page. For more information, refers to the documentation pages [Pushing data]({{ site.baseurl }}/howto/pushing-data) and [Pushing data using the WebSocket interface]({{ site.baseurl }}//howto/websocket-push).

## How to run a WarpScript

With a curl request, write your WarpScript code inside a file.mc2 and then run the following curl request. If everything is OK, you should receive a HTTP 200 OK with your datapoint in JSON format.
```
curl -H 'Transfer-Encoding:chunked' --data-binary @file.mc2 'https://API_ENDPOINT/api/v0/exec'
```

The following part will be using quantum to execute Warp script. A read token is necessary, and have to be stored like this :

```
'AREADTOKEN'
'TOKEN' STORE
```
In your file.mc2 replace AREADTOKEN, by your application read token, and start your file with those two lines.

## Querying data

In KairosDB, data came with relatives or absolute date

```
{
  "start_absolute":1,
  "metrics": [
    {
      "name": "archive.file.tracked"
    }
  ]
}
{
  "start_relative":{"value":20,"unit":"weeks"},
  "metrics": [
    {
      "name": "archive.file.tracked"
    }
  ]
}
```

Translation in Warp script

```
[ $token '~example.drone.*' {} NOW NOW ] FETCH
```

Explanation : token is the identifiant allowing reading of your application. What does this function ? It will load all the data contained in GTS containing in their name the string "gts". It will load only data having a timestamp that belong in the following time interval : now, and now minus now wich equals to 0.  If you have timestamp in the futur, instead of NOW, it's possible to use MAXLONG, or to define a new variable storing your max value :

```
7763850937000000 'maxvalue' STORE
[ $token '~example.drone.*' {} $maxvalue $maxvalue ] FETCH
```

To get more information about fetch, refers to the [Fetch API.]({{ site.baseurl }}/reference/functions/function_FETCH)

To get data from gts containing specific labels

```
[ $token '~example.drone.*' { 'type' 'captor.time' } NOW -1000 ] FETCH  FETCH
```

Explanation : to search specific data, the way to do it is to filter GTS name inside an application with regular expression : '~xxx.\*', and you can also look to specific labels : { 'label0' '~myLab.\*' }. In Fetch, intsead of looking for an interval, it's also possible to load the last X data. Instead of using a positive number use a negative one.

To get data in a specific time range, execute the following fetch.

```
[ $token '~example.drone.captor.gts4' { 'type' 'captor.time' } 1449222483312000 'P1d2h30m30s' DURATION ] FETCH
```

Explanation : The previous request will get all data of the last day plus 2 hours, 30 minutes and 30 seconds before the last timestamp of the example gts. DURATION translate an ISO Norm in unit time of the plat-form. Month and year may give a wrong analysis as the doesn't have a regular time.

In WarpScript, a better use of time is the use of [`BUCKETIZE` framework]({{ site.baseurl }}/reference/frameworks/framework-bucketize). Fetch all the data, and the keep for all sensors, minutes by minutes, the mean during a minute.

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

## Compute statistics

Lot of statics can easily be done using WarpScript. See the page [reference]({{ site.baseurl }}/reference) for more information. A small example is given below, this sample will first load all the data of the drone file using fetch. Then it will divide the GTS in small bucket of 1 minute keeping for each GTS the max value recorded during this minute. A [`REDUCE`]({{ site.baseurl }}/reference/frameworks/framework-reduce) is then apply to those GTS. This function will group all GTS having the same label "type". Then it will *reduce* them computing the average for each bucket. As a result, for each type (here 2), we got one GTS containing the average value of all gts minute by minute. For the last analysis, only the first resulting GTS is kept, and a [`MAP`]({{ site.baseurl }}/reference/frameworks/framework-map) is applied on it. This `MAP` function will simply compute a moving average using a sliding window. This window need 2 values before and 5 after the current value of the current bucket. Finally the data will be stored on the platform. To store the data, you have to rename the GTS, after an operation like a `MAP` (That's why a `LMAP` is executed to rename all elements of the list). To write data on Warp 10, a write token is necessary.

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

-----------------------------------

Access [here]({{ site.baseurl }}/howto/intro-bucketize) to the *`BUCKETIZE` tutorial*, it will give you more explanation about this important framework in the GTS analysis.
