---
title: "mapper.first"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Return the first value"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","201-framework-map","215-mapper_first.html.md"]
category: "reference"
---
 

This *mapper* function returns the first value of each sliding window with its associated location and elevation.

The `mapper.first` function can be applied to values of any type.

## Example ##

Stack:

    TOP:  [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,42],[20,123],[30,342],[40,423]]}]

WarpScript commands:

    mapper.first
    5
    0
    0
    5 ->LIST

    MAP

Stack: 

    TOP:  [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,42],[20,42],[30,42],[40,42]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN 42.0 ADDVALUE
20 NaN NaN NaN 123.0 ADDVALUE
30 NaN NaN NaN 342.0 ADDVALUE
40 NaN NaN NaN 423.0 ADDVALUE
1 ->LIST
mapper.first
5
0
0
5 ->LIST
MAP
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN 42.0 ADDVALUE
20 NaN NaN NaN 123.0 ADDVALUE
30 NaN NaN NaN 342.0 ADDVALUE
40 NaN NaN NaN 423.0 ADDVALUE
1 ->LIST
mapper.first
5
0
0
5 ->LIST
MAP
VALUES LIST-> 
1 == ASSERT   // values list size
LIST-> DROP
42 == ASSERT
42 == ASSERT
42 == ASSERT
42 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        