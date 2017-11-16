---
title: "mapper.toboolean"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Convert the single value in a sliding window to boolean"
categoryTree: ["reference","frameworks","framework-map"]
oldPath: ["20-frameworks","201-framework-map","201-single-value-mappers","130-mapper_toboolean.html.md"]
category: "reference"
---
 

This *mapper* function converts the **single value** in a sliding window to boolean.

The `mapper.toboolean` function can be applied to data of type **BOOLEAN**, **STRING**, **LONG** or **DOUBLE**.


## Example ##

Stack:

    TOP:  [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,"true"],[20,""]]},{"c":"tata","l":{"label0":"42"},"a":{},"v":[[10,0],[20,42]]}]

WarpScript commands:

    mapper.toboolean  // Setting the mapper.toboolean
    0 0 0             // Sliding window of 1 (0 pre and 0 post), no options
    5 ->LIST
    MAP

Stack: 

    TOP:  [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,true],[20,true]]},{"c":"tata","l":{"label0":"42"},"a":{},"v":[[10,false],[20,true]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN 'true' ADDVALUE
20 NaN NaN NaN '' ADDVALUE
NEWGTS "tata" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN 0 ADDVALUE
20 NaN NaN NaN 42 ADDVALUE
2 ->LIST
mapper.toboolean   // Setting the mapper.toboolean
0 0 0         // Sliding window of 1 (0 pre and 0 post), no options
5 ->LIST
MAP
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN 'true' ADDVALUE
20 NaN NaN NaN '' ADDVALUE
NEWGTS "tata" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN 0 ADDVALUE
20 NaN NaN NaN 42 ADDVALUE
2 ->LIST
mapper.toboolean   // Setting the mapper.toboolean
0 0 0         // Sliding window of 1 (0 pre and 0 post), no options
5 ->LIST
MAP
LIST-> 2 == ASSERT    // We should have two list
VALUES LIST-> DROP    // Extract 1st list, drop its size
true == ASSERT
false == ASSERT
VALUES LIST-> DROP    // Extract 2nd list, drop its size
false == ASSERT
true == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        