---
title: "ZSCORE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Normalize by the mean or median, using Z-score"
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `ZSCORE` function consumes a flag (a BOOLEAN) from the top of the stack, then normalizes a GTS or a LIST of GTS that are below by replacing their values by their [Z-score](https://en.wikipedia.org/wiki/Standard_score).

The flag indicates whether to use the mean (False), or the median (True) to calculate the Z-score.

The Z-score of a value represents the number of standard deviations (or median absolute deviations) it is away from the mean (or the median).

If the GTS isn't of type Double or if the deviation equals 0, an exception is raised.

## Example ##

Initial stack:

    TOP: {"c":"","l":{},"a":{},"v":[[100,10.0],[200,9.0],[300,8.0],[400,7.0],[500,6.0]]}


WarpScript commands:

    T ZSCORE

Stack: 

    TOP: {"c":"","l":{},"a":{},"v":[[100,1.349],[200,0.6745],[300,0],[400,-0.6745],[500,-1.349]]}

<warp10-warpscript-widget>NEWGTS
100  NaN NaN NaN 10.0 ADDVALUE
200  NaN NaN NaN  9.0 ADDVALUE
300  NaN NaN NaN  8.0 ADDVALUE
400  NaN NaN NaN  7.0 ADDVALUE
500  NaN NaN NaN  6.0 ADDVALUE
T ZSCORE
</warp10-warpscript-widget>    
