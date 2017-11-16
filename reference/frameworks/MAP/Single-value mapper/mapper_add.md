---
title: "mapper.add"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Add a constant to value"
categoryTree: ["reference","frameworks","framework-map"]
oldPath: ["20-frameworks","201-framework-map","201-single-value-mappers","110-mapper_add.html.md"]
category: "reference"
---
 


This *mapper* function adds a constant to the **single value** in a sliding window.

If the sliding window is empty, the function does not return any value. If the sliding window contains more than a single value, an error is produced.

The associated location and elevation are those of the single value.

The `mapper.add` function can be applied to data of type **LONG** or **DOUBLE**.

The `mapper.add` function must be parameterized with the constant.

The result will be of the same type as the constant.

## Note ##
 
The `mapper.add` mapper needs a single value sliding window, i.e. pre-window and post-window to 0   

## Example ##

Stack:

    TOP:  [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,42],[20,123]]},{"c":"tata","l":{"label0":"42"},"a":{},"v":[[10,211],[20,42]]}]

WarpScript commands:

    2.0 mapper.add    // Setting the mapper.abs with a constant value 2.0 to add
    0 0 0         // Sliding window of 1 (0 pre and 0 post), no options
    5 ->LIST
    MAP

Stack: 

    TOP: [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,44],[20,125]]},{"c":"tata","l":{"label0":"42"},"a":{},"v":[[10,213],[20,44]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN 42.0 ADDVALUE
20 NaN NaN NaN 123.0 ADDVALUE
NEWGTS "tata" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN 211.0 ADDVALUE
20 NaN NaN NaN 42.0 ADDVALUE
2 ->LIST
2.0 mapper.add    // Setting the mapper.abs with a constant value 2.0 to add
0 0 0         // Sliding window of 1 (0 pre and 0 post), no options
5 ->LIST
MAP
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN 42.0 ADDVALUE
20 NaN NaN NaN 123.0 ADDVALUE
NEWGTS "tata" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN 211.0 ADDVALUE
20 NaN NaN NaN 42.0 ADDVALUE
2 ->LIST
2.0 mapper.add    // Setting the mapper.abs with a constant value 2.0 to add
0 0 0         // Sliding window of 1 (0 pre and 0 post), no options
5 ->LIST
MAP
LIST-> 2 == ASSERT    // We should have two list
VALUES LIST-> DROP    // Extract 1st list, drop its size
44 == ASSERT
213 == ASSERT
VALUES LIST-> DROP    // Extract 2nd list, drop its size
125 == ASSERT
44 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        