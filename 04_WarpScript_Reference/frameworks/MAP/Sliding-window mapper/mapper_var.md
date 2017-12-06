---
title: "mapper.var"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Return the variance of the values"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","201-framework-map","265-mapper_var.html.md"]
category: "reference"
---
 

This *mapper* function returns the variance of all the values found in each sliding window. The location and elevation returned are those associated with the most recent value in the sliding window.

If the number of values in the sliding window is greater than one, [Bessel's correction](http://en.wikipedia.org/wiki/Bessel's_correction) is applied.
The `mapper.var` function can only be applied to values of type **LONG** or **DOUBLE**, when applied to **STRING** or **BOOLEAN** it does not return any value.

## Example ##

Stack:

    TOP:  [{"c":"GTS1","l":{"label0":"42"},"a":{},"v":[[10,5],[20,120]]},{"c":"GTS2","l":{"label0":"42"},"a":{},"v":[[10,8],[20,42]]}]

WarpScript commands:

    // Apply Bessel's correction
    true
    mapper.var
    // pre-window
    5
    // post-window
    0
    // occurrences
    0
    5 ->LIST
    MAP

Stack: 

    TOP: [{"c":"GTS1","l":{"label0":"42"},"a":{},"v":[[10,6612.5],[20,6612.5]]},{"c":"GTS2","l":{"label0":"42"},"a":{},"v":[[10,578],[20,578]]}]

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
true
mapper.var 
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
10 NaN NaN NaN 5.0 ADDVALUE
20 NaN NaN NaN 120.0 ADDVALUE 
NEWGTS "GTS2" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN 8.0 ADDVALUE
20 NaN NaN NaN 42.0 ADDVALUE 
2 ->LIST 
true
mapper.var 
5
5
0
5 ->LIST
MAP
VALUES LIST->
2 == ASSERT
LIST-> DROP
578 == ASSERT
578 == ASSERT
LIST-> DROP
6612.5 == ASSERT
6612.5 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}