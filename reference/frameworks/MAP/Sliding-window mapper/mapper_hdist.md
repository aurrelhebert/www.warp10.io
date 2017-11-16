---
title: "mapper.hdist"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Return the horizontal distance"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","201-framework-map","2901-mapper_hdist.html.md"]
category: "reference"
---
 

This *mapper* function computes the total distance traveled in the sliding window.

The distance is computed by summing the distances along the rhumb line between two consecutive locations.

The associated location and elevation are those at the tick being computed if it is part of the sliding window.

The computed distance is expressed in meters.

The `mapper.hdist` function can be applied to data of any type since it only considers locations.

## Example ##

Stack:

    TOP:  [{"c":"GTS1","l":{"label0":"42"},"a":{},"v":[[10,45,3.9999999292194843,25100,5],[20,49.99999999534339,-5.000000037252903,25200,120]]},{"c":"GTS2","l":{"label0":"42"},"a":{},"v":[[10,51.99999995995313,-6.00000006146729,25300,8],[20,53.99999996647239,-7.000000001862645,25400,42]]}]

WarpScript commands:

    mapper.hdist
    // pre-window
    0
    // post-window
    0
    // occurrences
    0
    5 ->LIST
    MAP

Stack: 

    TOP: [{"c":"GTS1","l":{"label0":"42"},"a":{},"v":[[10,45,3.9999999292194843,25100,0],[20,49.99999999534339,-5.000000037252903,25200,874749.4015525824]]},{"c":"GTS2","l":{"label0":"42"},"a":{},"v":[[10,51.99999995995313,-6.00000006146729,25300,0],[20,53.99999996647239,-7.000000001862645,25400,232083.40568889937]]}]

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
mapper.hdist 
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
10 45.0 4.0 25100 5.0 ADDVALUE
20 50.0 -5.0 25200 120.0 ADDVALUE 
NEWGTS "GTS2" RENAME 
{ 'label0' '42' } RELABEL
10 52.0 -6.0 25300 8.0 ADDVALUE
20 54.0 -7.0 25400 42.0 ADDVALUE 
2 ->LIST 
mapper.hdist 
5
0
0
5 ->LIST
MAP
VALUES LIST->
2 == ASSERT
LIST-> DROP
232083.40568889937 == ASSERT
0 == ASSERT
LIST-> DROP
874749.4015525824 == ASSERT
0 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %} 