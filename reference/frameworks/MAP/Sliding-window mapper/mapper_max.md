---
title: "mapper.max"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","201-framework-map","231-mapper_max.html.md"]
category: "reference"
---
 

This *mapper* function returns the max of all the values found in each sliding window. The associated location and elevation are those of the selected value. If the max value is encountered several times, the selected one is the one that appears first chronologically. 

The `mapper.max` function can be applied to values of any type, when applied to **BOOLEAN** types, the value **false** is considered less than **true**.

## Example ##

Stack:

    TOP:  [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,42],[20,123],[30,211],[40,132]]}]

WarpScript commands:

    mapper.max
    0
    2
    0
    5 ->LIST
    MAP

Stack: 

    TOP:  [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,211],[20,211],[30,211],[40,132]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN  42.0 ADDVALUE
20 NaN NaN NaN 123.0 ADDVALUE
30 NaN NaN NaN 211.0 ADDVALUE
40 NaN NaN NaN 132.0 ADDVALUE
1 ->LIST
mapper.max
0
2
0
5 ->LIST
MAP
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN  42.0 ADDVALUE
20 NaN NaN NaN 123.0 ADDVALUE
30 NaN NaN NaN 211.0 ADDVALUE
40 NaN NaN NaN 132.0 ADDVALUE
1 ->LIST
mapper.max
0
2
0
5 ->LIST
MAP
VALUES LIST-> 
1 == ASSERT   // values list size
LIST-> DROP
132 == ASSERT
211 == ASSERT
211 == ASSERT
211 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        