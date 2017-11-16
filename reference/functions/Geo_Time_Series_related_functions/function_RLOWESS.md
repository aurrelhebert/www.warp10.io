---
title: "RLOWESS"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Robust and iterative smoothing of a Geo Time Series"
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `RLOWESS` function applies an iterative smoothing program on a GTS or a LIST of GTS, which is done via locally weighted regression, and is robust to outliers.

## Syntax ##

```
[GTS] q r d p RLOWESS
```

`RLOWESS` expects five parameters on the top of the stack:

`[GTS]` a GTS or a LIST of GTS onto which to apply RLOWESS

`q` the bandwidth (a LONG) of the local regression

`r` the number of robustifying iterations (a LONG)

`d` the delta radius (a LONG given in time units) whithin which the local regression is computed only once (other points are interpolated)

`p` the degree (a LONG) for the polynomial fit of the regression

## Notes ##

`q 0 0 1 RLOWESS` is equivalent to `q LOWESS`.

To obtain a good smoothing, it is advised to choose an odd number of at least 5 for `q`.

The higher the value of `r`, the better the program is robust to outliers.

For very large datasets, it can be wise to set `d` > 0 to speed up the computations.

## Example ##

WarpScript commands:

    // we create a linear GTS
    NEWGTS 1 50 <% NaN NaN NaN 4 PICK TODOUBLE ADDVALUE %> FOR
    
    // we add outliers
    CLONE
    12 NaN NaN NaN 0 ADDVALUE
    24 NaN NaN NaN 100 ADDVALUE
    35 NaN NaN NaN 500 ADDVALUE
    DEDUP SORT

    // we call RLOWESS
    35 30 0 1 RLOWESS
    
    // we sum cumulative distance to y=x curve
    2 ->LIST [ SWAP [] op.sub ] APPLY
    [ SWAP bucketizer.sum 0 0 1 ] BUCKETIZE
    0 GET VALUES 0 GET
    
Stack: 

    // The smoothing had been robust to the outliers added
    TOP: -0.0009865398811861326


<warp10-warpscript-widget>// we create a linear GTS
    NEWGTS 1 50 <% NaN NaN NaN 4 PICK TODOUBLE ADDVALUE %> FOR
    
    // we add outliers
    CLONE
    12 NaN NaN NaN 0 ADDVALUE
    24 NaN NaN NaN 100 ADDVALUE
    35 NaN NaN NaN 500 ADDVALUE
    DEDUP SORT

    // we call RLOWESS
    35 30 0 1 RLOWESS
    
    // we sum cumulative distance to y=x curve
    2 ->LIST [ SWAP [] op.sub ] APPLY
    [ SWAP bucketizer.sum 0 0 1 ] BUCKETIZE
    0 GET VALUES 0 GET
</warp10-warpscript-widget>

## References ##

Cleveland, W. S. (1979) Robust locally weighted regression and smoothing scatterplots. J. American Statistical Association 74, 829–836.

Cleveland, W. S. (1981) LOWESS: A program for smoothing scatterplots by robust locally weighted regression. The American Statistician 35, 54.
