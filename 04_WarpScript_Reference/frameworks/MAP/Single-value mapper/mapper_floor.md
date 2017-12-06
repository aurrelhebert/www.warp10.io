---
title: "mapper.floor"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Round the single value in a sliding window to the closests lower LONG"
categoryTree: ["reference","frameworks","framework-map"]
oldPath: ["20-frameworks","201-framework-map","201-single-value-mappers","120-mapper_floor.html.md"]
category: "reference"
---
 

This *mapper* function rounds the **single value** in a sliding window to the closests lower LONG.

The `mapper.floor` function can be applied to data of type **LONG** or **DOUBLE**.


## Example ##

Stack:

    TOP:  [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,42],[20,-123]]},{"c":"tata","l":{"label0":"42"},"a":{},"v":[[10,-211],[20,5]]}]

WarpScript commands:

    mapper.floor    // Setting the mapper.floor
    0 0 0         // Sliding window of 1 (0 pre and 0 post), no options
    5 ->LIST
    MAP

Stack: 

    TOP: [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,41],[20,-124]]},{"c":"tata","l":{"label0":"42"},"a":{},"v":[[10,-212],[20,4]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN 41.1 ADDVALUE
20 NaN NaN NaN -123.4 ADDVALUE
NEWGTS "tata" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN -211.9 ADDVALUE
20 NaN NaN NaN 4.6 ADDVALUE
2 ->LIST
mapper.floor   // Setting the mapper.floor
0 0 0         // Sliding window of 1 (0 pre and 0 post), no options
5 ->LIST
MAP
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN 41.1 ADDVALUE
20 NaN NaN NaN -123.4 ADDVALUE
NEWGTS "tata" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN -211.9 ADDVALUE
20 NaN NaN NaN 4.6 ADDVALUE
2 ->LIST
mapper.floor   // Setting the mapper.floor
0 0 0         // Sliding window of 1 (0 pre and 0 post), no options
5 ->LIST
MAP
LIST-> 2 == ASSERT    // We should have two list
VALUES LIST-> DROP    // Extract 1st list, drop its size
4 == ASSERT
-212 == ASSERT
VALUES LIST-> DROP    // Extract 2nd list, drop its size
-124 == ASSERT
41 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        