---
title: "GRUBBSTEST"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Detect outliers using a Grubbs' test"
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `GRUBBSTEST` function detects an outlier in a GTS (or a LIST of GTS), by applying a [Grubbs' test](http://www.itl.nist.gov/div898/handbook/eda/section3/eda35h1.htm).

This test is done under the assumption that the GTS follows an approximately normal distribution.

It tests whether there is exactly a single outlier in a GTS or not. For an iterative version which can detect multiple outliers, use instead [ESDTEST]({{ site.baseurl }}/reference/functions/function_ESDTEST).

A LIST of ticks (or a LIST of LIST of ticks), corresponding to the outliers, is pushed back onto the stack.

This function only applies to GTS of type DOUBLE.

## Syntax ##

```
[GTS] mad (alpha) GRUBBSTEST
```

`GRUBBSTEST` consumes at least two parameters on the top of the stack:

`[GTS]` a GTS or a LIST of GTS onto which to apply GRUBBSTEST

`mad` a flag (a BOOLEAN) indicating whether to use the mean (False), or the median (True) to calculate the Z-score

`(alpha)` a optional significance level (a DOUBLE) for the statistical test. Default value is 0.05

## Example ##

WarpScript commands:

    // Macro used to generate an approximately normal distribution using central limit theorem
    <% RAND RAND RAND RAND RAND RAND + + + + + 3.0 - %> 'normal' STORE

    // we create a GTS with an approximately normal distribution
    NEWGTS 1 100 <% NaN NaN NaN @normal ADDVALUE %> FOR
    
    // we add an outlier (> 3.0)
    12 NaN NaN NaN 3.001 ADDVALUE
    DEDUP

    // we call GRUBBSTEST
    F GRUBBSTEST
    
Stack: 

    TOP: [12]

<warp10-warpscript-widget>// Macro used to generate an approximately normal distribution using central limit theorem
<% RAND RAND RAND RAND RAND RAND + + + + + 3.0 - %> 'normal' STORE

// we create a GTS with an approximately normal distribution
NEWGTS 1 100 <% NaN NaN NaN @normal ADDVALUE %> FOR

// we add an outlier (> 3.0)
12 NaN NaN NaN 3.001 ADDVALUE
DEDUP

// we call GRUBBSTEST
F GRUBBSTEST
</warp10-warpscript-widget>

## References ##

Grubbs, Frank (February 1969). "Procedures for Detecting Outlying Observations in Samples". Technometrics (Technometrics, Vol. 11, No. 1).
