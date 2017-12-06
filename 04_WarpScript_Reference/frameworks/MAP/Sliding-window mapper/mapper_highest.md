---
title: "mapper.highest"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Return the value with the highest elevation"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","201-framework-map","2910-mapper_highest.html.md"]
category: "reference"
---
 

This *mapper* function returns the value associated with the highest elevation in the sliding window. The location and elevation returned are those associated with the selected value. In case of multiple occurrences, the most recent is selected.

If no elevation data was found in the sliding window, no value will be returned.

## Example ##

Stack:

    TOP:  [{"c":"GTS1","l":{"label0":"42"},"a":{},"v":[[10,5],[20,120]]},{"c":"GTS2","l":{"label0":"42"},"a":{},"v":[[10,8],[20,42]]}]

WarpScript commands:

    mapper.highest
    // pre-window
    5
    // post-window
    5
    // occurrences
    0
    5 ->LIST
    MAP

Stack: 

    TOP: [{"c":"GTS1","l":{"label0":"42"},"a":{},"v":[[10,49.99999999534339,-5.000000037252903,25200,120],[20,49.99999999534339,-5.000000037252903,25200,120]]},{"c":"GTS2","l":{"label0":"42"},"a":{},"v":[[10,53.99999996647239,-7.000000001862645,25400,42],[20,53.99999996647239,-7.000000001862645,25400,42]]}]

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
mapper.highest 
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
mapper.highest 
5
5
0
5 ->LIST
MAP
'result'
STORE
$result
// test Values
VALUES LIST->
2 == ASSERT
LIST-> DROP
42 == ASSERT
42 == ASSERT
LIST-> DROP
120 == ASSERT
120 == ASSERT
// test elevations
$result
LIST->
2 == ASSERT
// first GTS
ELEVATIONS LIST->
2 == ASSERT
25400 == ASSERT
25400 == ASSERT
// second GTS
ELEVATIONS LIST->
2 == ASSERT
25200 == ASSERT
25200 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}