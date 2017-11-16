---
title: "STLESDTEST"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Detect outliers using seasonal extract and an generalized extreme studentized deviate test"
categoryTree: ["reference","functions"]
category: "reference"
---


The `STLESDTEST` function detects outliers in a GTS (or a LIST of GTS) which has a seasonal part.

The seasonal part and the trend part of the GTS are extracted using [STL decomposition]({{ site.baseurl }}/reference/functions/function_STL), then an [ESDTEST]({{ site.baseurl }}/reference/functions/function_ESDTEST) is performed on the remainder.

A LIST of ticks (or a LIST of LIST of ticks), corresponding to the outliers, is pushed back onto the stack.

This function only applies to bucketized GTS of type DOUBLE.

## Syntax ##

```
[GTS] p k (alpha) ({...}) STLESDTEST
```

`STLESDTEST` consumes at least three parameters on the top of the stack:

`[GTS]` a GTS or a LIST of GTS onto which to apply STLESDTEST

`p` the number of buckets (a LONG) that compose a period

`k` an upperbound (a LONG) of the number of outliers to detect

`(alpha)` a optional significance level (a DOUBLE) for the statistical test. Default value is 0.05

`({...})` optional parameters (a MAP) of the [STL]({{ site.baseurl }}/reference/functions/function_STL) call

## Example ##

WarpScript commands:

    // Macro used to generate an approximately normal distribution (using central limit theorem)
    <% RAND RAND RAND RAND RAND RAND + + + + + 3.0 - %> 'normal' STORE

    // we generate a GTS with an approximately normal distribution
    [ NEWGTS 1 50 <% NaN NaN NaN @normal ADDVALUE %> FOR

    // we add outliers (> 3.0 in absolute value)
    // Note that we do this before adding seasonal and trend components
    25 NaN NaN NaN -3.9 ADDVALUE
    36 NaN NaN NaN 3.8 ADDVALUE
    DEDUP

    // we generate a periodic GTS of mean 0
    NEWGTS 1 50 <% NaN NaN NaN 4 PICK 10 % 4.5 - ADDVALUE %> FOR

    // we generate a trend GTS (linear raise y=x)
    NEWGTS 1 50 <% NaN NaN NaN 4 PICK ADDVALUE %> FOR ]

    // we sum up the 3 components: remainder, seasonal and trend
    [ SWAP [] reducer.sum ] REDUCE 'sum' RENAME

    // bucketize
    [ SWAP bucketizer.first 0 1 50 ] BUCKETIZE 0 GET
    
    // we call STLESDTEST
    10 2 STLESDTEST
    
Stack: 

    // The outliers have been correctly detected
    TOP: [25,36]


<warp10-warpscript-widget>// Macro used to generate an approximately normal distribution (using central limit theorem)
<% RAND RAND RAND RAND RAND RAND + + + + + 3.0 - %> 'normal' STORE

// we generate a GTS with an approximately normal distribution
[ NEWGTS 1 50 <% NaN NaN NaN @normal ADDVALUE %> FOR

// we add outliers (> 3.0 in absolute value)
// Note that we do this before adding seasonal and trend components
25 NaN NaN NaN -3.9 ADDVALUE
36 NaN NaN NaN 3.8 ADDVALUE
DEDUP

// we generate a periodic GTS of mean 0
NEWGTS 1 50 <% NaN NaN NaN 4 PICK 10 % 4.5 - ADDVALUE %> FOR

// we generate a trend GTS (linear raise y=x)
NEWGTS 1 50 <% NaN NaN NaN 4 PICK ADDVALUE %> FOR ]

// we sum up the 3 components: remainder, seasonal and trend
[ SWAP [] reducer.sum ] REDUCE 'sum' RENAME

// bucketize
[ SWAP bucketizer.first 0 1 50 ] BUCKETIZE 0 GET

// we call STLESDTEST
10 2 STLESDTEST
</warp10-warpscript-widget>

## References ##

Cleveland, Robert B., et al. "STL: A seasonal-trend decomposition procedure based on loess." Journal of Official Statistics 6.1 (1990): 3-73.

Rosner, Bernard (May 1983), "Percentage Points for a Generalized ESD Many-Outlier Procedure",Technometrics, 25(2), pp. 165-172.
