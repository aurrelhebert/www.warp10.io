---
title: "LOWESS"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Smooths a Geo Time Series using local regression"
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `LOWESS` function consumes a bandwidth (a LONG) from the top of the stack, then smooths a GTS or a LIST of GTS that are below by using [local regression](https://en.wikipedia.org/wiki/Local_regression).

The bandwitdth parameter is the number of nearest neighbours to consider when applying the local regression.

To obtain a good smoothing, it is advised to choose an odd number of at least 5 as the bandwidth parameter.

## Example ##


WarpScript commands:

Initial stack:

    // Linear time series with a small bias at 5th tick
    TOP: {"c":"","l":{},"a":{},"v":[[1,10.0],[2,9.0],[3,8.0],[4,7.0],[5,6.1],[6,5.0],[7,4.0],[8,3.0],[9,2.0]]}


WarpScript commands:

    5 LOWESS

Stack: 

    TOP: {"c":"","l":{},"a":{},"v":[[100,10],[200,9.000000000000002],[300,8],[400,7.028631051752921],[500,6.042737896494156],[600,5.028631051752921],[700,4],[800,2.9999999999999973],[900,2]]}


<warp10-warpscript-widget>// Create a GTS with a small bias at 500us
NEWGTS 100 NaN NaN NaN 10.0 ADDVALUE
200 NaN NaN NaN 9.0 ADDVALUE
300 NaN NaN NaN 8.0 ADDVALUE
400 NaN NaN NaN 7.0 ADDVALUE
500 NaN NaN NaN 6.1 ADDVALUE
600 NaN NaN NaN 5.0 ADDVALUE
700 NaN NaN NaN 4.0 ADDVALUE
800 NaN NaN NaN 3.0 ADDVALUE
900 NaN NaN NaN 2.0 ADDVALUE
5 LOWESS
</warp10-warpscript-widget>    
