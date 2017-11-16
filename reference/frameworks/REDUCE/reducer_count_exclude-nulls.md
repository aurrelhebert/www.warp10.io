---
title: "reducer.count.exclude-nulls"
layout: "function"
isPage: "true"
link: "/warpscript/framework-reduce"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","301-framework-reduce","381-reducer_count_exclude-nulls.html.md"]
category: "reference"
---
 

The `reducer.count.exclude-nulls` function computes at each tick the number of measures of Geo Time Series<sup>TM</sup> which are in the same equivalence class.

It operates on any type.

The location and elevation returned are the first one encountered, which may vary depending on the order of the parameters.

The *include null* version, `reducer.count.include-nulls`, will include `null` values when computing the count.
The *exclude null* version, `reducer.count.exclude-nulls`, will exclude `null` values when computing the count.

## Example ##

Stack:

    TOP:  [{"c":"GTS1","l":{"label0":"1"},"a":{},"v":[[10,1],[20,5]]},{"c":"GTS2","l":{"label0":"2"},"a":{},"v":[[10,4],[20,3]]}, {"c":"GTS3","l":{"label0":"2"},"a":{},"v":[[10,3],[20,8]]},{"c":"GTS4","l":{"label0":"1"},"a":{},"v":[[10,3]]}]

WarpScript commands:

    [] // list of labels to define the equivalence classes. For example : 'label0' 1 ->LIST
    reducer.count.exclude-nulls
    3 ->LIST
    REDUCE

Stack: 

    TOP:  [{"c":"","l":{},"a":{},"v":[[10,4],[20,3]]}]

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
10 NaN NaN NaN 3 ADDVALUE
4 ->LIST
[]
reducer.count.exclude-nulls
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
reducer.count.exclude-nulls
3 ->LIST
REDUCE
LIST-> DROP   // expand the result list to extract the result GTS
VALUES LIST-> 
2 == ASSERT   // values list size
4 == ASSERT
4 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}