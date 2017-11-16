---
title: "reducer.argmin"
layout: "function"
isPage: "true"
link: "/warpscript/framework-reduce"
desc: ""
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","301-framework-reduce","360-reducer_argmin.html.md"]
category: "reference"
---
 

The `reducer.argmin` function outputs for each tick, the tick and the concatenation separated by ',' with the values of the labels for which the value is the minimum of Geo Time Series<sup>TM</sup> which are in the same equivalence class.

It operates on *LONG* and *DOUBLE*.

There is no location and elevation returned.

This reducer takes an additional *LONG* parameter to choose the minimum to report (use 0 to report them all), and a *String* parameter to choose on which label it operates.

## Example ##

Stack:

    TOP:  [{"c":"GTS1","l":{"label0":"1"},"a":{},"v":[[10,1],[20,5]]},{"c":"GTS2","l":{"label0":"2"},"a":{},"v":[[10,4],[20,3]]}, {"c":"GTS3","l":{"label0":"2"},"a":{},"v":[[10,3],[20,8]]},{"c":"GTS4","l":{"label0":"1"},"a":{},"v":[[10,3],[20,3]]}]

WarpScript commands:

    []        // list of labels to define the equivalence classes. For example : 'label0' 1 ->LIST
    'label0'  // label on which it operates
	0         // min to report, here report them all
    reducer.argmin
    3 ->LIST
    REDUCE

Stack: 

    TOP:  [{"c":"","l":{},"a":{},"v":[[10,"1"],[20,"1"]]}]

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
30 NaN NaN NaN 1 ADDVALUE
NEWGTS "GTS4" RENAME 
{ 'label0' '1' } RELABEL
10 NaN NaN NaN 3 ADDVALUE
20 NaN NaN NaN 2 ADDVALUE
4 ->LIST
[]
'label0'
0
reducer.argmin
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
'label0'
0
reducer.argmin
3 ->LIST
REDUCE
LIST-> DROP   // expand the result list to extract the result GTS
VALUES LIST-> 
2 == ASSERT   // values list size
'1' == ASSERT
'1' == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        