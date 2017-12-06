---
title: "mapper.lowest"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Return the value with the highest elevation"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","201-framework-map","2910-mapper_lowest.html.md"]
category: "reference"
---
 

This *mapper* function returns the value associated with the lowest elevation in the sliding window. The location and elevation returned are those associated with the selected value. In case of multiple occurrences, the one appearing first chronologically is selected.

If no elevation data was found in the sliding window, no value will be returned.

## Example ##

Stack:

    TOP:  [{"c":"GTS1","l":{"label0":"42"},"a":{},"v":[[10,-79.9999999254942,-4.45136315189302,25100,5],[20,-78.99999998509884,-4.451363235712051,25200,120]]},{"c":"GTS2","l":{"label0":"42"},"a":{},"v":[[10,-78.00000004470348,-4.451363319531083,25300,8],[20,-77.00000010430813,-4.451363403350115,25100,42]]}]

WarpScript commands:

    mapper.lowest
    // pre-window
    5
    // post-window
    5
    // occurrences
    0
    5 ->LIST
    MAP

Stack: 

    TOP: [{"c":"GTS1","l":{"label0":"42"},"a":{},"v":[[10,-79.9999999254942,-4.45136315189302,25100,5],[20,-79.9999999254942,-4.45136315189302,25100,5]]},{"c":"GTS2","l":{"label0":"42"},"a":{},"v":[[10,-77.00000010430813,-4.451363403350115,25100,42],[20,-77.00000010430813,-4.451363403350115,25100,42]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "GTS1" RENAME 
{ 'label0' '42' } RELABEL
10 4313071000 -4.4513631 25100 5.0 ADDVALUE
20 4313071001 -4.4513632 25200 120.0 ADDVALUE 
NEWGTS "GTS2" RENAME 
{ 'label0' '42' } RELABEL
10 4313071002 -4.4513633 25300 8.0 ADDVALUE
20 4313071003 -4.4513634 25100 42.0 ADDVALUE 
2 ->LIST 
mapper.lowest 
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
20 4313071003 -4.4513634 25100 42.0 ADDVALUE 
2 ->LIST 
mapper.lowest 
5
5
0
5 ->LIST
MAP
VALUES LIST->
2 == ASSERT
LIST-> DROP
42 == ASSERT
42 == ASSERT
LIST->
2 == ASSERT
5 == ASSERT
5 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}