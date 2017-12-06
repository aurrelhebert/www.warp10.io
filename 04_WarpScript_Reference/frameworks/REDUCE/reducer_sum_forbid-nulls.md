---
title: "reducer.sum.forbid-nulls"
layout: "function"
isPage: "true"
link: "/warpscript/framework-reduce"
desc: "Return the sum of the values excluding nulls"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","301-framework-reduce","330-reducer_sum_forbid-nulls.html.md"]
category: "reference"
---
 

The `reducer.sum` function computes at each tick the sum of the values of Geo Time Series<sup>TM</sup> which are in the same equivalence class.

It operates on *LONG* and *DOUBLE*.

The location and elevation returned are the first one encountered, which may vary depending on the order of the parameters.

The standard version of this reducer, `reducer.sum`, will exclude all null values when computing the sum.
The *forbid null* version, `reducer.sum.forbid-nulls`, will return `null` for any tick where one or more GTS have `null`values


## Example ##

Stack:

    TOP:  [{"c":"GTS1","l":{"label0":"1"},"a":{},"v":[[10,10],[20,-15]]},{"c":"GTS2","l":{"label0":"2"},"a":{},"v":[[10,20],[20,3]]}, {"c":"GTS3","l":{"label0":"2"},"a":{},"v":[[10,13],[20,-30]]},{"c":"GTS4","l":{"label0":"1"},"a":{},"v":[[10,-1]]}]

WarpScript commands:

    [] // list of labels to define the equivalence classes. For example : 'label0' 1 ->LIST
    reducer.sum.forbid-nulls
    3 ->LIST
    REDUCE

Stack: 

    TOP:  [{"c":"","l":{},"a":{},"v":[[10,42]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "GTS1" RENAME 
{ 'label0' '1' } RELABEL
10 NaN NaN NaN 10 ADDVALUE
20 NaN NaN NaN -15 ADDVALUE
NEWGTS "GTS2" RENAME 
{ 'label0' '2' } RELABEL
10 NaN NaN NaN 20 ADDVALUE
20 NaN NaN NaN 3 ADDVALUE
NEWGTS "GTS3" RENAME 
{ 'label0' '2' } RELABEL
10 NaN NaN NaN 13 ADDVALUE
20 NaN NaN NaN -30 ADDVALUE
NEWGTS "GTS4" RENAME 
{ 'label0' '1' } RELABEL
10 NaN NaN NaN -1 ADDVALUE
4 ->LIST
[]
reducer.sum.forbid-nulls
3 ->LIST
REDUCE
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "GTS1" RENAME 
{ 'label0' '1' } RELABEL
10 NaN NaN NaN 1 ADDVALUE
20 NaN NaN NaN 5 ADDVALUE
NEWGTS "GTS2" RENAME 
{ 'label0' '2' } RELABEL
10 NaN NaN NaN 4 ADDVALUE
20 NaN NaN NaN 3 ADDVALUE
NEWGTS "GTS3" RENAME 
{ 'label0' '2' } RELABEL
10 NaN NaN NaN 3 ADDVALUE
20 NaN NaN NaN 8 ADDVALUE
NEWGTS "GTS4" RENAME 
{ 'label0' '1' } RELABEL
10 NaN NaN NaN 3 ADDVALUE
20 NaN NaN NaN 2 ADDVALUE
4 ->LIST
[]
reducer.sum.forbid-nulls
3 ->LIST
REDUCE
LIST-> DROP   // expand the result list to extract the result GTS
VALUES LIST-> 
2 == ASSERT   // values list size
18 == ASSERT
11 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        


