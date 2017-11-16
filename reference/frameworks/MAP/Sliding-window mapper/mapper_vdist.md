---
title: "mapper.vdist"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Return the vertical distance"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","201-framework-map","2901-mapper_vdist.html.md"]
category: "reference"
---
 

This *mapper* function computes the total distance traveled in the vertical plane in the sliding window.

The distance is computed by summing the distances between consecutive elevations (this differs from the computation done in [`mapper.vspeed`](mapper.vspeed))

The associated location and elevation are those at the tick being computed if it is part of the sliding window.

The computed distance is expressed in meters.

The `mapper.vdist` function can be applied to data of any type since it only considers locations.

## Example ##

Stack:

    TOP:  [{"c":"GTS1","l":{"label0":"42"},"a":{},"v":[[10,45,3.9999999292194843,25000,5],[20,49.99999999534339,4.999999953433871,25200,120]]},{"c":"GTS2","l":{"label0":"42"},"a":{},"v":[[10,51.99999995995313,5.999999977648258,25300,8],[20,53.99999996647239,6.999999918043613,26000,42]]}]

WarpScript commands:

    mapper.vdist
    // pre-window
    5
    // post-window
    5
    // occurrences
    0
    5 ->LIST
    MAP

Stack: 

    TOP: [{"c":"GTS1","l":{"label0":"42"},"a":{},"v":[[10,45,3.9999999292194843,25000,0],[20,49.99999999534339,4.999999953433871,25200,0.2]]},{"c":"GTS2","l":{"label0":"42"},"a":{},"v":[[10,51.99999995995313,5.999999977648258,25300,0],[20,53.99999996647239,6.999999918043613,26000,0.7]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "GTS1" RENAME 
{ 'label0' '42' } RELABEL
10 45.0 4.0 25000 5.0 ADDVALUE
20 50.0 5.0 25200 120.0 ADDVALUE 
NEWGTS "GTS2" RENAME 
{ 'label0' '42' } RELABEL
10 52.0 6.0 25300 8.0 ADDVALUE
20 54.0 7.0 26000 42.0 ADDVALUE 
2 ->LIST 
mapper.vdist 
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
10 52.0 6.0 25300 8.0 ADDVALUE
20 54.0 7.0 26000 42.0 ADDVALUE 
2 ->LIST 
mapper.vdist 
5
0
0
5 ->LIST
MAP
VALUES LIST->
2 == ASSERT
LIST-> DROP
0.7 == ASSERT
0 == ASSERT
LIST-> DROP
0.2 == ASSERT
0 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}