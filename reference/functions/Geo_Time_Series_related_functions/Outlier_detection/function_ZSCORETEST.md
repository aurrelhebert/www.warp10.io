---
title: "ZSCORETEST"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Detect outliers using a Zscore test"
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `ZSCORETEST` function detects outliers in a GTS (or a LIST of GTS) by comparing the [Z-score](https://en.wikipedia.org/wiki/Standard_score) of its values with a given threshold.

The Z-score of a value represents the number of standard deviations (or median absolute deviations) it is away from the mean (or the median). If this value is greater than the given threshold, it is flagged as an outlier.

A LIST of ticks (or a LIST of LIST of ticks), corresponding to the outliers, is pushed back onto the stack.

This function only applies to GTS of type DOUBLE.

## Syntax ##

```
[GTS] mad (t) ZSCORETEST
```

`ZSCORETEST` consumes at least two parameters on the top of the stack:

`[GTS]` a GTS or a LIST of GTS onto which to apply ZSCORETEST

`mad` a flag (a BOOLEAN) indicating whether to use the mean (False), or the median (True) to calculate the Z-score

`(t)` an optional treshold (a DOUBLE). Default value is 3.5

## Example ##

WarpScript commands:

    // we create a GTS with uniformly randomized values between 0 and 1
    NEWGTS 1 100 <% NaN NaN NaN RAND ADDVALUE %> FOR
    
    // we add outliers
    1234 NaN NaN NaN 3.9 ADDVALUE
    368 NaN NaN NaN -11.8 ADDVALUE
    422 NaN NaN NaN 453634483.0 ADDVALUE
    456 NaN NaN NaN 99.8 ADDVALUE
    643 NaN NaN NaN -2.9 ADDVALUE
    DEDUP

    // we call ZSCORETEST
    T ZSCORETEST
    
Stack: 

    TOP: [1234,368,422,456,643]


<warp10-warpscript-widget>// we create a GTS with uniformly randomized values between 0 and 1
NEWGTS 1 100 <% NaN NaN NaN RAND ADDVALUE %> FOR

// we add outliers
1234 NaN NaN NaN 3.9 ADDVALUE
368 NaN NaN NaN -11.8 ADDVALUE
422 NaN NaN NaN 453634483.0 ADDVALUE
456 NaN NaN NaN 99.8 ADDVALUE
643 NaN NaN NaN -2.9 ADDVALUE
DEDUP

// we call ZSCORETEST
T ZSCORETEST
</warp10-warpscript-widget>

## References ##

Boris Iglewicz and David Hoaglin (1993), "Volume 16: How to Detect and Handle Outliers", The ASQC Basic References in Quality Control: Statistical Techniques, Edward F. Mykytka, Ph.D., Editor. 
