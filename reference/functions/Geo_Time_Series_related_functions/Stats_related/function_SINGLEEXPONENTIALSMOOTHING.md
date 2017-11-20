---
title: "SINGLEEXPONENTIALSMOOTHING"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Smooth a Geo Time Series with the given smoothing factor alpha"
categoryTree: ["reference","functions"]
category: "reference"
--- 

The `SINGLEEXPONENTIALSMOOTHING` function takes a GTS and smooths it with the [Single Exponential Smoothing](https://en.wikipedia.org/wiki/Exponential_smoothing) formula. 

It consumes two parameters from the top of the stack: smoothing factor alpha (a numeric parameter between 0 < alpha < 1) and the GTS to integrate.
The resulting integrated GTS is pushes onto the stack.


## Example ##

WarpScript commands:

    NEWGTS "GTS1" RENAME 
    'label0' '42' 2 ->MAP RELABEL
    10 NaN NaN NaN  5.0 ADDVALUE
    20 NaN NaN NaN  4.0 ADDVALUE 
    30 NaN NaN NaN  8.0 ADDVALUE
    40 NaN NaN NaN  7.0 ADDVALUE
    50 NaN NaN NaN 12.0 ADDVALUE
    60 NaN NaN NaN  9.0 ADDVALUE
    70 NaN NaN NaN 13.0 ADDVALUE 
    0.8 // alpha (smoothing factor)
    SINGLEEXPONENTIALSMOOTHING

Stack: 

    {"c":"GTS1","l":{"label0":"42"},"a":{},"v":[[10,5],[20,4.2],[30,7.24],[40,7.048],[50,11.0096],[60,9.40192],[70,12.280384]]}


<warp10-warpscript-widget>NEWGTS "GTS1" RENAME 
'label0' '42' 2 ->MAP RELABEL
10 NaN NaN NaN  5.0 ADDVALUE
20 NaN NaN NaN  4.0 ADDVALUE 
30 NaN NaN NaN  8.0 ADDVALUE
40 NaN NaN NaN  7.0 ADDVALUE
50 NaN NaN NaN 12.0 ADDVALUE
60 NaN NaN NaN  9.0 ADDVALUE
70 NaN NaN NaN 13.0 ADDVALUE 
0.8 // alpha (smoothing factor)
SINGLEEXPONENTIALSMOOTHING
</warp10-warpscript-widget>    
    
