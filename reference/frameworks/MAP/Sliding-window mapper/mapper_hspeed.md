---
title: "mapper.hspeed"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Return the horizontal speed"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","201-framework-map","2900-mapper_hspeed.html.md"]
category: "reference"
---
 

This *mapper* function computes the horizontal speed along the path traveled in the sliding window.

The distance is computed by summing the distances along the rhumb line between two consecutive locations.

If there is only one tick in the sliding window, the speed is 0.

The associated location and elevation are those at the tick being computed if it is part of the sliding window.

The computed speed is expressed in meters per second.

The `mapper.hspeed` function can be applied to data of any type since it only considers locations.

## Example ##

Stack:

    TOP:  [{"c":"GTS1","l":{"label0":"42"},"a":{},"v":[[10,-79.9999999254942,-4.45136315189302,25100,5],[20,-78.99999998509884,-4.451363235712051,25200,120]]},{"c":"GTS2","l":{"label0":"42"},"a":{},"v":[[10,-78.00000004470348,-4.451363319531083,25300,8],[20,-77.00000010430813,-4.451363403350115,25400,42]]}]

WarpScript commands:

    mapper.hspeed
    // pre-window
    5
    // post-window
    5
    // occurrences
    0
    5 ->LIST
    MAP

Stack: 

    TOP: [{"c":"GTS1","l":{"label0":"42"},"a":{},"v":[[10,-79.9999999254942,-4.45136315189302,25100,11111999337.673187],[20,-78.99999998509884,-4.451363235712051,25200,11111999337.673187]]},{"c":"GTS2","l":{"label0":"42"},"a":{},"v":[[10,-78.00000004470348,-4.451363319531083,25300,11111999337.673187],[20,-77.00000010430813,-4.451363403350115,25400,11111999337.673187]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "GTS1" RENAME 
{ 'label0' '42' } RELABEL
10 4313071000 -4.4513631 25100 5.0 ADDVALUE
20 4313071001 -4.4513632 25200 120.0 ADDVALUE 
NEWGTS "GTS2" RENAME 
{ 'label0' '42' } RELABEL
10 4313071002 -4.4513633 25300 8.0 ADDVALUE
20 4313071003 -4.4513634 25400 42.0 ADDVALUE 
2 ->LIST 
mapper.hspeed 
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
10 4313071000 -4.4513631 25100 5.0 ADDVALUE
20 4313071001 -4.4513632 25200 120.0 ADDVALUE 
NEWGTS "GTS2" RENAME 
{ 'label0' '42' } RELABEL
10 4313071002 -4.4513633 25300 8.0 ADDVALUE
20 4313071003 -4.4513634 25400 42.0 ADDVALUE 
2 ->LIST 
mapper.hspeed 
5
5
0
5 ->LIST
MAP
VALUES LIST->
2 == ASSERT
LIST-> DROP
11111999337.673187 == ASSERT
11111999337.673187 == ASSERT
LIST-> DROP
11111999337.673187 == ASSERT
11111999337.673187 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}  