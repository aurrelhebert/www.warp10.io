---
title: "reducer.min.forbid-nulls"
layout: "function"
isPage: "true"
link: "/warpscript/framework-reduce"
desc: "Return the minimum of the values excluding nulls"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","301-framework-reduce","310-reducer_min_forbid-nulls.html.md"]
category: "reference"
---
 

The `reducer.min.forbid-nulls` function outputs for each tick the minimum value of Geo Time Series<sup>TM</sup> which are in the same equivalence class.

It operates on any type.

The location and elevation returned are those of the first minimum value encountered.

The standard version of this reducer, `reducer.min`, will exclude all null values when computing the minimum.
The *forbid null* version, `reducer.min.forbid-nulls`, will return `null` for any tick where one or more GTS have `null`values.

## Example ##

Stack:

    TOP:  [{"c":"GTS1","l":{"label0":"1"},"a":{},"v":[[10,1],[20,5]]},{"c":"GTS2","l":{"label0":"2"},"a":{},"v":[[10,4],[20,3]]}, {"c":"GTS3","l":{"label0":"2"},"a":{},"v":[[10,3],[20,8]]},{"c":"GTS4","l":{"label0":"1"},"a":{},"v":[[10,-42]]}]

WarpScript commands:

    [] // list of labels to define the equivalence classes. For example : 'label0' 1 ->LIST
    reducer.min.forbid-nulls
    3 ->LIST
    REDUCE

Stack: 

    TOP:  [{"c":"","l":{},"a":{},"v":[[10,-42]]}]

## Let's play with it ##

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
10 NaN NaN NaN -42 ADDVALUE
4 ->LIST
[]
reducer.min.forbid-nulls
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
reducer.min.forbid-nulls
3 ->LIST
REDUCE
LIST-> DROP   // expand the result list to extract the result GTS
VALUES LIST-> 
2 == ASSERT   // values list size
2 == ASSERT
1 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        

