---
title: "mapper.rate"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Return the rate of change between the last and first values"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","201-framework-map","251-mapper_rate.html.md"]
category: "reference"
---
 
This *mapper* function computes the rate of change between the first and last values (`rate = (last - first) / (lastick - firsttick)`) of each sliding window. The location and elevation returned are those associated with the most recent value in the sliding window.

The `mapper.rate` function can only be applied to values of type **LONG** or **DOUBLE**, when applied to **STRING** or **BOOLEAN** it does not return any value. If the sliding window contains less than 2 values, the rate of change will be 0.0.

The rate of change is expressed in units per second.

## Example ##

Stack:

    TOP:  [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,3],[20,10],[30,16],[40,40]]}]

WarpScript commands:

    mapper.rate
    1
    0
    0
    5 ->LIST
    MAP

Stack: 

    TOP:  [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[100],[20,700000],[30,600000],[40,2400000]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN  3.0 ADDVALUE
20 NaN NaN NaN  10.0 ADDVALUE
30 NaN NaN NaN 16.0 ADDVALUE
40 NaN NaN NaN 40.0 ADDVALUE
1 ->LIST
mapper.rate
1
0
0
5 ->LIST
MAP
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN  3.0 ADDVALUE
20 NaN NaN NaN  10.0 ADDVALUE
30 NaN NaN NaN 16.0 ADDVALUE
40 NaN NaN NaN 40.0 ADDVALUE
1 ->LIST
mapper.rate
1
0
0
5 ->LIST
MAP
VALUES LIST-> 
1 == ASSERT   // values list size
LIST-> DROP
2400000 == ASSERT
600000 == ASSERT
700000 == ASSERT
0 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        