---
title: "THRESHOLDTEST"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Detect outliers using a threshold test"
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `THRESHOLDTEST` function detects outliers in a GTS (or a LIST of GTS) by comparing its values with a given threshold.

If a value is greater than the given threshold, it is flagged as an outlier.

A LIST of ticks (or a LIST of LIST of ticks), corresponding to the outliers, is pushed back onto the stack.

This function only applies to GTS of type DOUBLE.

## Syntax ##

```
[GTS] t THRESHOLDTEST
```

`THRESHOLDTEST` consumes two parameters on the top of the stack:

`[GTS]` a GTS or a LIST of GTS onto which to apply THRESHOLDTEST

`t` the threshold (a DOUBLE)

## Example ##

WarpScript commands:

    // we create a GTS with uniformly randomized values between 0 and 1
    NEWGTS 1 50 <% NaN NaN NaN RAND ADDVALUE %> FOR
    
    // we add outliers
    12 NaN NaN NaN 1.001 ADDVALUE
    24 NaN NaN NaN 100.0 ADDVALUE
    35 NaN NaN NaN 500.0 ADDVALUE
    DEDUP

    // we call THRESHOLDTEST
    1.0 THRESHOLDTEST
    
Stack: 

    TOP: [12,24,35]


<warp10-warpscript-widget>// we create a GTS with uniformly randomized values between 0 and 1
NEWGTS 1 50 <% NaN NaN NaN RAND ADDVALUE %> FOR

// we add outliers
12 NaN NaN NaN 1.001 ADDVALUE
24 NaN NaN NaN 100.0 ADDVALUE
35 NaN NaN NaN 500.0 ADDVALUE
DEDUP

// we call THRESHOLDTEST
1.0 THRESHOLDTEST
</warp10-warpscript-widget>
