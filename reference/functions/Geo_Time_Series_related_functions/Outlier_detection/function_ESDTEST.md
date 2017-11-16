---
title: "ESDTEST"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Detect outliers using an generalized extreme studentized deviate test"
categoryTree: ["reference","functions"]
category: "reference"
---


The `ESDTEST` function detects outliers in a GTS (or a LIST of GTS), by applying a [generalized extreme studentized deviate test](http://www.itl.nist.gov/div898/handbook/eda/section3/eda35h3.htm).

This test is done under the assumption that the GTS follows an approximately normal distribution.

A [Grubbs' test]({{ site.baseurl }}/reference/functions/function_GRUBBSTEST) is done for one candidate at a time. Then, the candidate is removed from the set and another [Grubbs' test]({{ site.baseurl }}/reference/functions/function_GRUBBSTEST) is performed. This process is iterated a given number of times. The detected outliers are the removed values and the current candidate of the last successful test.

A LIST of ticks (or a LIST of LIST of ticks), corresponding to the outliers, is pushed back onto the stack.

This function only applies to GTS of type DOUBLE.

## Syntax ##

```
[GTS] k mad (alpha) ESDTEST
```

`ESDTEST` consumes at least three parameters on the top of the stack:

`[GTS]` a GTS or a LIST of GTS onto which to apply ESDTEST

`k` an upperbound (a LONG) of the number of outliers to detect

`mad` a flag (a BOOLEAN) indicating whether to use the mean (False), or the median (True) to calculate the Z-score

`(alpha)` a optional significance level (a DOUBLE) for the statistical test. Default value is 0.05

## Example ##

WarpScript commands:

    // Macro used to generate an approximately normal distribution using central limit theorem
    <% RAND RAND RAND RAND RAND RAND + + + + + 3.0 - %> 'normal' STORE

    // we create a GTS with an approximately normal distribution
    NEWGTS 1 1000 <% NaN NaN NaN @normal ADDVALUE %> FOR
    
    // we add outliers (> 3.0 in absolute value)
    368 NaN NaN NaN -3.1 ADDVALUE
    422 NaN NaN NaN 3.0001 ADDVALUE
    456 NaN NaN NaN 9.8 ADDVALUE
    643 NaN NaN NaN -200.9 ADDVALUE
    DEDUP

    // we call ESDTEST
    4 F ESDTEST
    
Stack: 

    TOP: [643,456,368,422]

<warp10-warpscript-widget>/// Macro used to generate an approximately normal distribution using central limit theorem
<% RAND RAND RAND RAND RAND RAND + + + + + 3.0 - %> 'normal' STORE

// we create a GTS with an approximately normal distribution
NEWGTS 1 1000 <% NaN NaN NaN @normal ADDVALUE %> FOR

// we add outliers (> 3.0 in absolute value)
368 NaN NaN NaN -3.1 ADDVALUE
422 NaN NaN NaN 3.0001 ADDVALUE
456 NaN NaN NaN 9.8 ADDVALUE
643 NaN NaN NaN -200.9 ADDVALUE
DEDUP

// we call ESDTEST
4 F ESDTEST
</warp10-warpscript-widget>

## References ##

Rosner, Bernard (May 1983), "Percentage Points for a Generalized ESD Many-Outlier Procedure",Technometrics, 25(2), pp. 165-172.
