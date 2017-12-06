---
title: "mapper.vspeed"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Return the vertical speed"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","201-framework-map","2900-mapper_vspeed.html.md"]
category: "reference"
---
 

This *mapper* function computes the vertical speed between the first and last readings of the sliding window. It **does not** compute the speed based on the total vertical distance traveled in the sliding window, it only considers its extrema (it differs significantly of what is done for horizontal speed in [`mapper.hspeed`](mapper.hspeed)), thus the result can be positive or negative.

If one of the extrema of the sliding window has no elevation, no value is returned.

The associated location and elevation are those at the tick being computed if it is part of the sliding window.

The computed speed is expressed in meters per second.

The `mapper.vspeed` function can be applied to data of any type since it only considers elevations.

## Example ##

Stack:

    TOP:  [{"c":"GTS1","l":{"label0":"42"},"a":{},"v":[[10,45,3.9999999292194843,25000,5],[20,49.99999999534339,4.999999953433871,25200,120]]},{"c":"GTS2","l":{"label0":"42"},"a":{},"v":[[10,51.99999995995313,5.999999977648258,25200,8],[20,53.99999996647239,6.999999918043613,26000,42]]}]

WarpScript commands:

    mapper.vspeed
    // pre-window
    5
    // post-window
    5
    // occurrences
    0
    5 ->LIST
    MAP

Stack: 

    TOP: [{"c":"GTS1","l":{"label0":"42"},"a":{},"v":[[10,45,3.9999999292194843,25000,0],[20,49.99999999534339,4.999999953433871,25200,20000]]},{"c":"GTS2","l":{"label0":"42"},"a":{},"v":[[10,51.99999995995313,5.999999977648258,25200,0],[20,53.99999996647239,6.999999918043613,26000,80000]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "GTS1" RENAME 
{ 'label0' '42' } RELABEL
10 45.0 4.0 25000 5.0 ADDVALUE
20 50.0 5.0 25200 120.0 ADDVALUE 
NEWGTS "GTS2" RENAME 
{ 'label0' '42' } RELABEL
10 52.0 6.0 25200 8.0 ADDVALUE
20 54.0 7.0 26000 42.0 ADDVALUE 
2 ->LIST 
mapper.vspeed 
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
10 45.0 4.0 25000 5.0 ADDVALUE
20 50.0 5.0 25200 120.0 ADDVALUE 
NEWGTS "GTS2" RENAME 
{ 'label0' '42' } RELABEL
10 52.0 6.0 25200 8.0 ADDVALUE
20 54.0 7.0 26000 42.0 ADDVALUE 
2 ->LIST 
mapper.vspeed 
5
0
0
5 ->LIST
MAP
VALUES LIST->
2 == ASSERT
LIST-> DROP
80000 == ASSERT
0 == ASSERT
LIST-> DROP
20000 == ASSERT
0 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}