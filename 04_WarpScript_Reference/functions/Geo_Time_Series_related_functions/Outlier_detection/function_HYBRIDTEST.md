---
title: "HYBRIDTEST"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Detect outliers using Seasonal Hybrid ESD test"
categoryTree: ["reference","functions"]
category: "reference"
---


The `HYBRIDTEST` function detects outliers in a GTS (or a LIST of GTS) which has a seasonal part.

Like [`STLESDTEST`]({{ site.baseurl }}/reference/functions/function_STLESDTEST), `HYBRIDTEST` performs an [`ESDTEST`]({{ site.baseurl }}/reference/functions/function_ESDTEST) onto a GTS that have been relieved of its seasonal and trend part. But unlike the mentioned test, [`STL`]({{ site.baseurl }}/reference/functions/function_STL) and [`ESDTEST`]({{ site.baseurl }}/reference/functions/function_ESDTEST) are performed piecewise. Plus, the trend is approximated with the piecewise median instead of the trend part of the [`STL`]({{ site.baseurl }}/reference/functions/function_STL) decomposition.

A LIST of ticks (or a LIST of LIST of ticks), corresponding to the outliers, is pushed back onto the stack.

This technique was first developped at [Twitter](https://blog.twitter.com/2015/introducing-practical-and-robust-anomaly-detection-in-a-time-series).

This function only applies to bucketized GTS of type DOUBLE.

## Syntax ##

```
[GTS] period piece k (alpha) ({...}) HYBRIDTEST
```

`HYBRIDTEST` consumes at least four parameters on the top of the stack:

`[GTS]` a GTS or a LIST of GTS onto which to apply HYBRIDTEST

`period` the number of buckets (a LONG) that compose a period

`piece` the number of periods (a LONG) that compose a piece

`k` an upperbound (a LONG) of the number of outliers to detect per piece

`(alpha)` a optional significance level (a DOUBLE) for the statistical test. Default value is 0.05

`({...})` optional parameters (a MAP) of the [STL]({{ site.baseurl }}/reference/functions/function_STL) call

## Example ##

WarpScript commands:

    // Macro used to generate an approximately normal distribution (using central limit theorem)
    <% RAND RAND RAND RAND RAND RAND + + + + + 3.0 - %> 'normal' STORE

    // we generate a GTS with an approximately normal distribution
    [ NEWGTS 1 100 <% NaN NaN NaN @normal ADDVALUE %> FOR

    // we add outliers (> 3.0 in absolute value)
    // Note that we do this before adding seasonal and trend components
    25 NaN NaN NaN -3.9 ADDVALUE
    36 NaN NaN NaN 3.8 ADDVALUE
    71 NaN NaN NaN 4.01 ADDVALUE
    82 NaN NaN NaN -3.21 ADDVALUE
    DEDUP

    // we generate a periodic GTS of mean 0
    NEWGTS 1 100 <% NaN NaN NaN 4 PICK 10 % 4.5 - ADDVALUE %> FOR

    // we generate a trend GTS (piecewise raise)
    NEWGTS 1 100 <% NaN NaN NaN 4 PICK 50 / 1 + ADDVALUE %> FOR ]

    // we sum up the 3 components: remainder, seasonal and trend
    [ SWAP [] reducer.sum ] REDUCE 'sum' RENAME

    // bucketize
    [ SWAP bucketizer.first 0 1 100 ] BUCKETIZE 0 GET
    
    // we call HYBRIDTEST
    10 5 2 HYBRIDTEST
    
Stack: 

    // Outliers have been detected
    TOP: [25,36,71,82]

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Macro used to generate an approximately normal distribution (using central limit theorem)
<% RAND RAND RAND RAND RAND RAND + + + + + 3.0 - %> 'normal' STORE

// we generate a GTS with an approximately normal distribution
[ NEWGTS 1 100 <% NaN NaN NaN @normal ADDVALUE %> FOR

// we add outliers (> 3.0 in absolute value)
// Note that we do this before adding seasonal and trend components
25 NaN NaN NaN -3.9 ADDVALUE
36 NaN NaN NaN 3.8 ADDVALUE
71 NaN NaN NaN 4.01 ADDVALUE
82 NaN NaN NaN -3.21 ADDVALUE
DEDUP

// we generate a periodic GTS of mean 0
NEWGTS 1 100 <% NaN NaN NaN 4 PICK 10 % 4.5 - ADDVALUE %> FOR

// we generate a trend GTS (piecewise raise)
NEWGTS 1 100 <% NaN NaN NaN 4 PICK 50 / 1 + ADDVALUE %> FOR ]

// we sum up the 3 components: remainder, seasonal and trend
[ SWAP [] reducer.sum ] REDUCE 'sum' RENAME

// bucketize
[ SWAP bucketizer.first 0 1 100 ] BUCKETIZE 0 GET

// we call HYBRIDTEST
10 5 2 HYBRIDTEST
</warp10-warpscript-widget>
{% endraw %}

## References ##

Owen Vallis, Jordan Hochenbaum, Arun Kejariwal. "A Novel Technique for Long-Term Anomaly Detection in the Cloud", Twitter Inc (2014).

Cleveland, Robert B., et al. "STL: A seasonal-trend decomposition procedure based on loess." Journal of Official Statistics 6.1 (1990): 3-73.

Rosner, Bernard (May 1983), "Percentage Points for a Generalized ESD Many-Outlier Procedure",Technometrics, 25(2), pp. 165-172.
