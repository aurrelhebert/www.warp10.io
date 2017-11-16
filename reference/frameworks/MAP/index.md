---
title: "MAP"
layout: "function"
isPage: "true"
link: "/warpscript/frameworks"
desc: "Apply a function on values of a Geo Time Series that fall into a sliding window"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","201-framework-map","200-framework-map.html.md"]
category: "reference"
---


The `MAP` framework allows you to apply a function on values of a Geo Time Series<sup>TM</sup> that fall into a sliding window.

## Syntax ##

```
[ [GTS] ... [GTS] mapper pre post occurrences ] MAP
```

`MAP` takes as input a single parameter which is a list of the following:

`[GTS]` one or several lists of geo time series. The call to `MAP` produces a list of geo time series, one for each input, whose values are the results of the function application on each sliding window. If the input serie is *bucketized*, the result serie will be too.

`mapper` function to apply on the sliding window.

`pre` width of the sliding window *before* the current tick. This parameter is interpreted as a number of ticks if its value is positive, and as a number of microseconds if its value is negative. A value of 0 means the sliding window does not cover the *past*. Use the special values **max.tick.sliding.window** or **max.time.sliding.window** to expand the window the farthest into the past.

`post` width of the sliding window *after* the current tick. Values have the same semantics as for the `pre` parameter. A value of 0 means the sliding window does not cover the *future*. Use the special values **max.tick.sliding.window** or **max.time.sliding.window** to expand the window the farthest into the future.

`occurrences` limit the number of computations to that number. If the value is 0, compute a value for each tick of the input geo time serie. If number is negative, compute that many values starting with the most recent tick. If value is positive, do that many computations starting with the oldest tick. This is useful when you are interested in a single result, like the max or sum of all values.

See also [the list of available mappers]({{ site.baseurl }}/reference/reference#framework-mappers)
