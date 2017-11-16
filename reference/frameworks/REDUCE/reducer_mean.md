---
title: "reducer.mean"
layout: "function"
isPage: "true"
link: "/warpscript/framework-reduce"
desc: "Return the mean of the values"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","301-framework-reduce","320-reducer_mean.html.md"]
category: "reference"
---


The `reducer.mean` function outputs for each tick the mean of the values of Geo Time Series<sup>TM</sup> which are in the same equivalence class.

It operates on *LONG* and *DOUBLE*.

The location returned is the centroid of all the locations, the elevation is the average elevation.

## Example ##

Stack:

    TOP:  [{"c":"GTS1","l":{"label0":"1"},"a":{},"v":[[10,1],[20,1],[30,1],[40,1],[50,1],[60,1]]},{"c":"GTS2","l":{"label0":"1"},"a":{},"v":[[10,5],[20,5],[30,5]]},{"c":"GTS3","l":{"label0":"1"},"a":{},"v":[[10,10],[20,10],[30,10]]}]

WarpScript commands:

    [] // list of labels to define the equivalence classes. For example : 'label0' 1 ->LIST
    reducer.mean
    3 ->LIST
    REDUCE

Stack:

    TOP:  [{"c":"","l":{"label0":"1"},"a":{},"v":[[10,5.333333333333333],[20,5.333333333333333],[30,5.333333333333333]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "GTS1" RENAME
{ 'label0' '1' } RELABEL
10 NaN NaN NaN  1 ADDVALUE
20 NaN NaN NaN  1 ADDVALUE
30 NaN NaN NaN  1 ADDVALUE
40 NaN NaN NaN  1 ADDVALUE
50 NaN NaN NaN  1 ADDVALUE
60 NaN NaN NaN  1 ADDVALUE
NEWGTS "GTS2" RENAME
{ 'label0' '1' } RELABEL
10 NaN NaN NaN  5 ADDVALUE
20 NaN NaN NaN  5 ADDVALUE
30 NaN NaN NaN  5 ADDVALUE
NEWGTS "GTS3" RENAME
{ 'label0' '1' } RELABEL
10 NaN NaN NaN 10 ADDVALUE
20 NaN NaN NaN 10 ADDVALUE
30 NaN NaN NaN 10 ADDVALUE
3 ->LIST
[] // list of labels to define the equivalence classes. For example : 'label0' 1 ->LIST
reducer.mean
3 ->LIST
REDUCE
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "GTS1" RENAME
{ 'label0' '1' } RELABEL
10 NaN NaN NaN  1 ADDVALUE
20 NaN NaN NaN  1 ADDVALUE
30 NaN NaN NaN  1 ADDVALUE
40 NaN NaN NaN  1 ADDVALUE
50 NaN NaN NaN  1 ADDVALUE
60 NaN NaN NaN  1 ADDVALUE
NEWGTS "GTS2" RENAME
{ 'label0' '1' } RELABEL
10 NaN NaN NaN  5 ADDVALUE
20 NaN NaN NaN  5 ADDVALUE
30 NaN NaN NaN  5 ADDVALUE
NEWGTS "GTS3" RENAME
{ 'label0' '1' } RELABEL
10 NaN NaN NaN 10 ADDVALUE
20 NaN NaN NaN 10 ADDVALUE
30 NaN NaN NaN 10 ADDVALUE
3 ->LIST
[] // list of labels to define the equivalence classes. For example : 'label0' 1 ->LIST
reducer.mean
3 ->LIST
REDUCE
LIST-> DROP   // expand the result list to extract the result GTS
VALUES LIST->
3 == ASSERT   // values list size
5.333333333333333 1e-3 ~= ASSERT
5.333333333333333 1e-3 ~= ASSERT
5.333333333333333 1e-3 ~= ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
