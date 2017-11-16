---
title: "reducer.mean.exclude-nulls"
layout: "function"
isPage: "true"
link: "/warpscript/framework-reduce"
desc: "Return the mean of the values"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","301-framework-reduce","320-reducer_mean_exclude-nulls.html.md"]
category: "reference"
---


The `reducer.mean.exclude-nulls` function outputs for each tick the mean of the values of Geo Time Series<sup>TM</sup> which are in the same equivalence class, excluding nulls from the computation.

It operates on *LONG* and *DOUBLE*.

The location returned is the centroid of all the locations, the elevation is the average elevation.

## Example ##

Stack:

    TOP: [{"c":"GTS1","l":{"label0":"1"},"a":{},"v":[[10,1],[20,1],[30,1],[40,1],[50,1],[60,1]]},{"c":"GTS2","l":{"label0":"1"},"a":{},"v":[[10,5],[20,5]]},{"c":"GTS3","l":{"label0":"1"},"a":{},"v":[[30,10],[40,10]]},{"c":"GTS4","l":{"label0":"1"},"a":{},"v":[[60,20]]}]

WarpScript commands:

    [] // list of labels to define the equivalence classes. For example : 'label0' 1 ->LIST
    reducer.mean
    3 ->LIST
    REDUCE

Stack:

    TOP:  [{"c":"","l":{"label0":"1"},"a":{},"v":[[10,3],[20,3],[30,5.5],[40,5.5],[50,1],[60,10.5]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget backend-url="https://warp.cityzendata.net/dist">NEWGTS "GTS1" RENAME
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
NEWGTS "GTS3" RENAME
{ 'label0' '1' } RELABEL
30 NaN NaN NaN 10 ADDVALUE
40 NaN NaN NaN 10 ADDVALUE
NEWGTS "GTS4" RENAME
{ 'label0' '1' } RELABEL
60 NaN NaN NaN 20 ADDVALUE
4 ->LIST
[] // list of labels to define the equivalence classes. For example : 'label0' 1 ->LIST
reducer.mean.exclude-nulls
3 ->LIST
REDUCE
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend-url="https://warp.cityzendata.net/dist">NEWGTS "GTS1" RENAME
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
NEWGTS "GTS3" RENAME
{ 'label0' '1' } RELABEL
30 NaN NaN NaN 10 ADDVALUE
40 NaN NaN NaN 10 ADDVALUE
NEWGTS "GTS4" RENAME
{ 'label0' '1' } RELABEL
60 NaN NaN NaN 20 ADDVALUE
4 ->LIST
[] // list of labels to define the equivalence classes. For example : 'label0' 1 ->LIST
reducer.mean.exclude-nulls
3 ->LIST
REDUCE
LIST-> DROP     // expand the result list to extract the result GTS
VALUES LIST->
 6   == ASSERT  // values list size
10.5 == ASSERT   
 1.0 == ASSERT
 5.5 == ASSERT
 5.5 == ASSERT
 3.0 == ASSERT
 3.0 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
