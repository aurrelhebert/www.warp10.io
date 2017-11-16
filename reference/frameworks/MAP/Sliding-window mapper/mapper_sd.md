---
title: "mapper.sd"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Return the standard deviation of the values"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","201-framework-map","266-mapper_sd.html.md"]
category: "reference"
---
 

This *mapper* function returns the standard deviation of each sliding window. The location and elevation returned are those associated with the most recent value in the sliding window.

The standard deviation is the square root of the variance as computed by [mapper.var](mapper_var).

The `mapper.sd` function can only be applied to values of type **LONG** or **DOUBLE**, when applied to **STRING** or **BOOLEAN** it does not return any value.

## Example ##

Stack:

    TOP:  [{"c":"GTS1","l":{"label0":"42"},"a":{},"v":[[10,5],[20,120]]},{"c":"GTS2","l":{"label0":"42"},"a":{},"v":[[10,8],[20,42]]}]

WarpScript commands:

    // Apply Bessel's correction
    true
    mapper.sd
    // pre-window
    5
    // post-window
    5
    // occurrences
    0
    5 ->LIST
    MAP

Stack: 

    TOP: [{"c":"GTS1","l":{"label0":"42"},"a":{},"v":[[10,0],[20,81.31727983645297]]},{"c":"GTS2","l":{"label0":"42"},"a":{},"v":[[10,0],[20,24.041630560342615]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "GTS1" RENAME 
{ 'label0' '42' } RELABEL
10 45.0 4.0 25100 5.0 ADDVALUE
20 50.0 -5.0 25200 120.0 ADDVALUE 
NEWGTS "GTS2" RENAME 
{ 'label0' '42' } RELABEL
10 52.0 -6.0 25300 8.0 ADDVALUE
20 54.0 -7.0 25400 42.0 ADDVALUE 
2 ->LIST
true
mapper.sd 
5
5
0
5 ->LIST
MAP
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "GTS1" RENAME 
{ 'label0' '42' } RELABEL
10 45.0 4.0 25100 5.0 ADDVALUE
20 50.0 -5.0 25200 120.0 ADDVALUE 
NEWGTS "GTS2" RENAME 
{ 'label0' '42' } RELABEL
10 52.0 -6.0 25300 8.0 ADDVALUE
20 54.0 -7.0 25400 42.0 ADDVALUE 
2 ->LIST
true
mapper.sd 
5
5
0
5 ->LIST
MAP
VALUES LIST->
2 == ASSERT
LIST-> DROP
24.041630560342615 == ASSERT
24.041630560342615 == ASSERT
LIST-> DROP
81.31727983645297 == ASSERT
81.31727983645297 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}
