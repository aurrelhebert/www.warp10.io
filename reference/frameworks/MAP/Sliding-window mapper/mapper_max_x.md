---
title: "mapper.max.x"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Return the maximum between a constant and each value"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","201-framework-map","233-mapper_maxx.html.md"]
category: "reference"
---
 

This *mapper* function returns the max between a constant passed as parameter and each value. The associated location and elevation are those of the selected value.

The `mapper.max.x` function can be applied to values of any type, when applied to **BOOLEAN** types, the value **false** is considered less than **true**.


## Example ##

Stack:

    TOP:  [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,42.0],[20,123.0],[30,211.0],[40,132.0]]}]

WarpScript commands:

    // arguments are: GTS or [GTS], constant, mapper, prewindow, postwindow, occurences
    [ SWAP 100.0 mapper.max.x 0 0 0 ] MAP

Stack: 

    TOP:  [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,100.0],[20,123.0],[30,211.0],[40,132.0]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN  42.0 ADDVALUE
20 NaN NaN NaN 123.0 ADDVALUE
30 NaN NaN NaN 211.0 ADDVALUE
40 NaN NaN NaN 132.0 ADDVALUE

// arguments are: GTS or [GTS], constant, mapper, prewindow, postwindow, occurences
[ SWAP 100.0 mapper.max.x 0 0 0 ] MAP
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN  42.0 ADDVALUE
20 NaN NaN NaN 123.0 ADDVALUE
30 NaN NaN NaN 211.0 ADDVALUE
40 NaN NaN NaN 132.0 ADDVALUE

// arguments are: GTS or [GTS], constant, mapper, prewindow, postwindow, occurences
[ SWAP 100.0 mapper.max.x 0 0 0 ] MAP

VALUES LIST-> 
1 == ASSERT   // values list size
LIST-> DROP
132 == ASSERT
211 == ASSERT
123 == ASSERT
100 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        