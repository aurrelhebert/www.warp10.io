---
title: "STL"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Apply Seasonal Trend decomposition based on Loess procedure"
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `STL` function applies a Seasonal Trend decomposition on a GTS or a LIST of GTS, which is based on multiple calls of [RLOWESS]({{ site.baseurl }}/reference/functions/function_RLOWESS).

A LIST of two GTS (or a LIST of LIST of two GTS) is pushed onto the stack. These GTS are the seasonal part and the trend part of the input GTS. Their classnames are suffixed with "_seasonal" and "_trend".

This function can only be applied to bucketized GTS of numeric type.

## Syntax ##

```
[GTS] {"PERIOD":p, ... } STL
```

`STL` consumes two objects on the top of the stack:

`[GTS]` a GTS or a LIST of GTS onto which to apply STL

`{"PERIOD":p, ... }` a map of parameter containing at least the field `"PERIOD"`

`p` the number of buckets (a LONG) that compose a period

`...` optional parameters

## Example ##

WarpScript commands:

    // generate periodic GTS of mean 0
    [ NEWGTS 1 20 <% NaN NaN NaN 4 PICK 10 % 4.5 - ADDVALUE %> FOR

    // generate trend GTS (linear raise y=x)
    NEWGTS 1 20 <% NaN NaN NaN 4 PICK ADDVALUE %> FOR ]

    // sum up
    [ SWAP [] reducer.sum ] REDUCE 'sum' RENAME

    // bucketize
    [ SWAP bucketizer.first 0 1 20 ] BUCKETIZE 0 GET

    // call STL
    { 'PERIOD' 10 } STL
    
Stack: 

    // a List with the seasonal part and the trend part is on top
    TOP: [{"c":"sum_seasonal","l":{},"a":{},"v":[[1,-3.5000000000000018],[2,-2.5000000000000004],[3,-1.5000000000000004],[4,-0.4999999999999997],[5,0.5000000000000002],[6,1.5000000000000004],[7,2.499999999999999],[8,3.5000000000000004],[9,4.5],[10,-4.499999999999999],[11,-3.5000000000000004],[12,-2.5],[13,-1.5000000000000002],[14,-0.5],[15,0.5],[16,1.5000000000000002],[17,2.5],[18,3.5000000000000004],[19,4.5],[20,-4.500000000000001]]},
    {"c":"sum_trend","l":{},"a":{},"v":[[1,1.0000000000000024],[2,2.0000000000000018],[3,3.000000000000001],[4,4],[5,5],[6,6],[7,7.000000000000001],[8,8],[9,9],[10,10],[11,11],[12,12],[13,13],[14,14],[15,15],[16,16],[17,17],[18,18],[19,19],[20,20]]}]


## Let's play with it ##

<warp10-warpscript-widget>// generate periodic GTS of mean 0
[ NEWGTS 1 20 <% NaN NaN NaN 4 PICK 10 % 4.5 - ADDVALUE %> FOR

// generate trend GTS (linear raise y=x)
NEWGTS 1 20 <% NaN NaN NaN 4 PICK ADDVALUE %> FOR ]

// sum up
[ SWAP [] reducer.sum ] REDUCE 'sum' RENAME

// bucketize
[ SWAP bucketizer.first 0 1 20 ] BUCKETIZE 0 GET

// call STL
{ 'PERIOD' 10 } STL
</warp10-warpscript-widget>

## Optional parameters

#### Global

field `"ROBUST"` if TRUE, set defaults of number of inner and outer loops to 1 and 15 instead of 2 and 0. Default is FALSE

field `"PRECISION"` number of inner loops (a LONG). Default is 2 or 1

field `"ROBUSTNESS"` number of outer loops (a LONG). Default is 0 or 15

#### Seasonal extract

field `"BANDWIDTH_S"` the bandwidth (a LONG) of the local regression. Default is 7

field `"DEGREE_S"` the degree (a LONG) of the polynomial fit. Default is 2

field `"SPEED_S"` the number of values interpolated instead of estimated. Default is BANDWIDTH_S/10

#### Low frequency filtering

field `"BANDWIDTH_L"` the bandwidth (a LONG) of the local regression. Default is nextOdd(PERIOD)

field `"DEGREE_L"` the degree (a LONG) of the polynomial fit. Default is 1

field `"SPEED_L"` the number of values interpolated instead of estimated. Default is BANDWIDTH_L/10

#### Trend extract

field `"BANDWIDTH_T"` the bandwidth (a LONG) of the local regression. Default is nextOdd(ceiling(1.5*PERIOD/(1-(1.5/BANDWIDTH_S))))

field `"DEGREE_T"` the degree (a LONG) of the polynomial fit. Default is 1

field `"SPEED_T"` the number of values interpolated instead of estimated. Default is BANDWIDTH_T/10

#### Post seasonal smoothing

field `"BANDWIDTH_P"` the bandwidth (a LONG) of the local regression. Default is 0 (i.e. no post smoothing)

field `"DEGREE_P"` the degree (a LONG) of the polynomial fit. Default is 2

field `"SPEED_P"` the number of values interpolated instead of estimated. Default is BANDWIDTH_P/10

#### Additional fields

field `"BANDWIDTH"` value of all BANDWIDTH_X fields that are not set

field `"DEGREE"` value of all DEGREE_X fields that are not set

field `"SPEED"` value of all SPEED_X fields that are not set

## References ##

Cleveland, Robert B., et al. "STL: A seasonal-trend decomposition procedure based on loess." Journal of Official Statistics 6.1 (1990): 3-73.
