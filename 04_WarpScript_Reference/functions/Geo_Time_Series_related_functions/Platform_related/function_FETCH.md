---
title: "FETCH"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Fetch data from Warp10's datastore"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","100-function_FETCH.html.md"]
category: "reference"
---


The `FETCH` function retrieves data from the Continuum data store.

It expects on the top of the stack a list containing 5 parameters: a Warp10 token, a classname selector, a map of label selectors, a start timestamp, and an end timestamp.

The classname selector is a string which represents an exact match if it starts with an '=', or a regular expression if it starts with '~'.

The label selectors are packed in a map whose keys are the label names and the values the associated selector. Those selectors can also be exact matches if they start with '=' or a regular expression if they start with '~'.

In the case of exact matching, the '=' can be omitted.

The start and end timestamps are expected in [ISO8601](http://en.wikipedia.org/wiki/ISO_8601) format, *i.e.* **YYYY-MM-DDTHH:MM:SS.SSSSSSZ**. Only those readings whose timestamps lie between those two timestamps (most recent inclusive, oldest exclusive) will be retained.


## Use ##

The function pushes onto the stack the LIST of retrieved Geo Time Series.

## Example ##

WarpScript commands:


    [
      'TOKEN'
      'com.cityzendata.tutorial.sensors.temperature'
      { 'label0' '=value0'
      'label1' '~val.' }
      NOW 60000000

Stack:

    TOP: 60000000
    1:   1380528623000000
    2:   {'label0':'=value0','label1':'~val.'}
    3:   'com.cityzendata.tutorial.sensors.temperature'
    4:   'TOKEN'
    5:   [ 

WarpScript commands (suite):

    ]
    FETCH

Stack:

    TOP: [ GTS1, GTS2... ]    



## Options ##

Instead of the basic interval search, with the start and end timestamps in ISO8601 format, you can use two alternative formats for the interval parameters:

1. If you want to fetch readings whose timestamps lie in a specific timespan before a timestamp (for example all the readings in the last minute) you can use the end timestamp (in microseconds since the Unix epoch) as first parameter and the timespan (in microseconds) as the second one.

  For our example of the readings in the last minute, you would use [`NOW`]({{ site.baseurl }}/warpscript/function_NOW) and `60000000` as interval parameters.

  Example: if you want to get all the readings for the 10 minutes interval before midnight on January 5<sup>th</sup> 2014 (epoch timestamp: 1388880000000000 microseconds) you would do:  

~~~
[
  'TOKEN'
  'com.cityzendata.tutorial.sensors.temperature' {}
  1388880000000000 600000000
]
FETCH
~~~

1. If you want to recover the last `n` readings before a given instant, you can use the instant timestamp (in microseconds since the Unix epoch) as first parameter and `-n` as the second.

  For example, to recover the last two ticks you would use [`NOW`]({{ site.baseurl }}/warpscript/function_NOW) and `-2` as interval parameters:

~~~
[
  'TOKEN'
  'com.cityzendata.tutorial.sensors.temperature' {}
  NOW -2
]
FETCH
~~~
