---
title: "mapper.todouble"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Convert the single value in a sliding window to DOUBLE"
categoryTree: ["reference","frameworks","framework-map"]
oldPath: ["20-frameworks","201-framework-map","201-single-value-mappers","130-mapper_todoble.html.md"]
category: "reference"
---
 

This *mapper* function converts the **single value** in a sliding window to DOUBLE.

The `mapper.todouble` function can be applied to data of type **BOOLEAN**, **STRING**, **LONG** or **DOUBLE**.


## Example ##

Stack:

    TOP:  [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,"27"],[20,""]]},{"c":"tata","l":{"label0":"42"},"a":{},"v":[[10,0.4],[20,42.1]]}]

WarpScript commands:

    mapper.todouble   // Setting the mapper.todouble
    0 0 0             // Sliding window of 1 (0 pre and 0 post), no options
    5 ->LIST
    MAP

Stack: 

    TOP:  [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,27]]},{"c":"tata","l":{"label0":"42"},"a":{},"v":[[10,0.4],[20,42.1]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN '27' ADDVALUE
20 NaN NaN NaN '' ADDVALUE
NEWGTS "tata" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN 0.4 ADDVALUE
20 NaN NaN NaN 42.1 ADDVALUE
2 ->LIST
mapper.todouble   // Setting the mapper.todouble
0 0 0         // Sliding window of 1 (0 pre and 0 post), no options
5 ->LIST
MAP
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN '27' ADDVALUE
20 NaN NaN NaN '' ADDVALUE
NEWGTS "tata" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN 0.4 ADDVALUE
20 NaN NaN NaN 42.1 ADDVALUE
2 ->LIST
mapper.todouble   // Setting the mapper.todouble
0 0 0         // Sliding window of 1 (0 pre and 0 post), no options
5 ->LIST
MAP
LIST-> 2 == ASSERT    // We should have two list
VALUES LIST-> DROP    // Extract 1st list, drop its size
42.1 == ASSERT
0.4 == ASSERT
VALUES LIST-> DROP    // Extract 2nd list, drop its size
27 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        