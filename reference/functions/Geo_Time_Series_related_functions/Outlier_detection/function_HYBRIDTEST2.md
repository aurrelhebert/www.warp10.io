---
title: "HYBRIDTEST2"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Detect outliers using Seasonal Entropy Hybrid ESD test"
categoryTree: ["reference","functions"]
category: "reference"
---


The `HYBRIDTEST2` function detects outliers in a GTS (or a LIST of GTS) which has a seasonal part.

`HYBRIDTEST2` is almost the same procedure than [`HYBRIDTEST`]({{ site.baseurl }}/reference/functions/function_HYBRIDTEST) except that it does not use [`STL`]({{ site.baseurl }}/reference/functions/function_STL) decomposition for the seasonal extract.

The seasonal part is approximated by pondering each value with the [entropy](https://en.wikipedia.org/wiki/Entropy_%28information_theory%29) of the [modified Z-score](http://www.itl.nist.gov/div898/handbook/eda/section3/eda35h.htm) of its seasonal subseries (series with only the values of the same season).

This test is usually preferred when it is meaningful to think in term of entropy, for example when the GTS represents counters of events. Also as it does not use STL decomposition, it is not prone to border effects, but at the cost of not detecting slight outliers.

A LIST of ticks (or a LIST of LIST of ticks), corresponding to the outliers, is pushed back onto the stack.

This function only applies to bucketized GTS of type DOUBLE.

## Syntax ##

```
[GTS] period piece k (alpha) HYBRIDTEST2
```

`HYBRIDTEST2` consumes at least four parameters on the top of the stack:

`[GTS]` a GTS or a LIST of GTS onto which to apply HYBRIDTEST2

`period` the number of buckets (a LONG) that compose a period

`piece` the number of periods (a LONG) that compose a piece

`k` an upperbound (a LONG) of the number of outliers to detect per piece

`(alpha)` a optional significance level (a DOUBLE) for the statistical test. Default value is 0.05

## Example ##

WarpScript commands:

    // Macro used to generate an approximately normal distribution (using central limit theorem)
    <% RAND RAND RAND RAND RAND RAND + + + + + 3.0 - %> 'normal' STORE

    // we generate a GTS with an approximately normal distribution
    [ NEWGTS 1 100 <% NaN NaN NaN @normal ADDVALUE %> FOR

    // we add outliers
    25 NaN NaN NaN -17 ADDVALUE
    36 NaN NaN NaN 18 ADDVALUE
    71 NaN NaN NaN 23 ADDVALUE
    82 NaN NaN NaN -12 ADDVALUE
    DEDUP

    // we generate a periodic GTS of mean 0
    NEWGTS 1 100 <% NaN NaN NaN 4 PICK 10 % 4.5 - ADDVALUE %> FOR

    // we generate a trend GTS (piecewise raise)
    NEWGTS 1 100 <% NaN NaN NaN 4 PICK 50 / 5 + ADDVALUE %> FOR ]

    // we sum up the 3 components: remainder, seasonal and trend
    [ SWAP [] reducer.sum ] REDUCE 'sum' RENAME

    // bucketize
    [ SWAP bucketizer.first 0 1 100 ] BUCKETIZE 0 GET
    
    // we call HYBRIDTEST2
    10 5 2 HYBRIDTEST2
    
Stack: 

    // Outliers have been detected
    TOP: [36,25,71,82]

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Macro used to generate an approximately normal distribution (using central limit theorem)
<% RAND RAND RAND RAND RAND RAND + + + + + 3.0 - %> 'normal' STORE

// we generate a GTS with an approximately normal distribution
[ NEWGTS 1 100 <% NaN NaN NaN @normal ADDVALUE %> FOR

// we add outliers
25 NaN NaN NaN -17 ADDVALUE
36 NaN NaN NaN 18 ADDVALUE
71 NaN NaN NaN 23 ADDVALUE
82 NaN NaN NaN -12 ADDVALUE
DEDUP

// we generate a periodic GTS of mean 0
NEWGTS 1 100 <% NaN NaN NaN 4 PICK 10 % 4.5 - ADDVALUE %> FOR

// we generate a trend GTS (piecewise raise)
NEWGTS 1 100 <% NaN NaN NaN 4 PICK 50 / 5 + ADDVALUE %> FOR ]

// we sum up the 3 components: remainder, seasonal and trend
[ SWAP [] reducer.sum ] REDUCE 'sum' RENAME

// bucketize
[ SWAP bucketizer.first 0 1 100 ] BUCKETIZE 0 GET

// we call HYBRIDTEST2
10 5 2 HYBRIDTEST2
</warp10-warpscript-widget>
{% endraw %}
