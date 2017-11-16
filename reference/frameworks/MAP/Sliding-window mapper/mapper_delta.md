---
title: "mapper.delta"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Return the delta between the last and first values"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","201-framework-map","250-mapper_delta.html.md"]
category: "reference"
---
 

This *mapper* function computes the delta between the last and first values (`delta = last - first`) of each sliding window. The location and elevation returned are those associated with the most recent value in the sliding window.

The `mapper.delta` function can only be applied to values of type **LONG** or **DOUBLE**, when applied to **STRING** or **BOOLEAN** it does not return any value.   

## Example ##

Stack:

    TOP:  [{"c":"GTS1","l":{"label0":"42"},"a":{},"v":[[10,5],[20,120]]},{"c":"GTS2","l":{"label0":"42"},"a":{},"v":[[10,8],[20,42]]}]

WarpScript commands:

    mapper.delta
    5
    0
    0
    5 ->LIST
    MAP

Stack: 

    TOP: [{"c":"GTS1","l":{"label0":"42"},"a":{},"v":[[10,0],[20,115]]},{"c":"GTS2","l":{"label0":"42"},"a":{},"v":[[10,0],[20,34]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "GTS1" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN 5.0 ADDVALUE
20 NaN NaN NaN 120.0 ADDVALUE 
NEWGTS "GTS2" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN 8.0 ADDVALUE
20 NaN NaN NaN 42.0 ADDVALUE 
2 ->LIST 
mapper.delta 
5
0
0
5 ->LIST
MAP
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "GTS1" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN 5.0 ADDVALUE
20 NaN NaN NaN 120.0 ADDVALUE 
NEWGTS "GTS2" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN 8.0 ADDVALUE
20 NaN NaN NaN 42.0 ADDVALUE 
2 ->LIST 
mapper.delta 
5
0
0
5 ->LIST
MAP
VALUES LIST->
2 == ASSERT
LIST-> DROP
34 == ASSERT
0 == ASSERT
LIST-> DROP
115 == ASSERT
0 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}    