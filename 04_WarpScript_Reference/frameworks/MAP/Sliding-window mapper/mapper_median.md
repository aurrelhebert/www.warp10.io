---
title: "mapper.median"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Return the median of the values"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","201-framework-map","263-mapper_median.html.md"]
category: "reference"
---
 

This *mapper* function returns the median of all the values found in each sliding window. The associated location will be the median of all locations. The associated elevation will be the median of all elevations.
The `mapper.median` function can only be applied to values of type **LONG** or **DOUBLE**, when applied to **STRING** or **BOOLEAN** it does not return any value.

## Example ##

Stack:

    TOP:  [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,2],[20,8],[30,11],[40,20]]}]

WarpScript commands:

    mapper.median
    2  // pre-window
    0  // post-median
    0  // occurrences
    5 ->LIST
    MAP

Stack: 

    TOP:  [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,2],[20,5],[30,8],[40,11]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN  2.0 ADDVALUE
20 NaN NaN NaN  8.0 ADDVALUE
30 NaN NaN NaN 11.0 ADDVALUE
40 NaN NaN NaN 20.0 ADDVALUE
1 ->LIST
mapper.median
2  // pre-window
0  // post-median
0  // occurrences
5 ->LIST
MAP
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN  2.0 ADDVALUE
20 NaN NaN NaN  8.0 ADDVALUE
30 NaN NaN NaN 11.0 ADDVALUE
40 NaN NaN NaN 20.0 ADDVALUE
1 ->LIST
mapper.median
2  // pre-window
0  // post-median
0  // occurrences
5 ->LIST
MAP
VALUES LIST-> 
1 == ASSERT   // values list size
LIST-> DROP
11 == ASSERT
8 == ASSERT
5 == ASSERT
2 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        