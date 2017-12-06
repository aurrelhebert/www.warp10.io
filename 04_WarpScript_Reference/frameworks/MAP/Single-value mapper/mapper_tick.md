---
title: "mapper.tick"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Return the tick for which it is computed"
categoryTree: ["reference","frameworks","framework-map"]
oldPath: ["20-frameworks","201-framework-map","201-single-value-mappers","270-mapper_tick.html.md"]
category: "reference"
---
 

This *mapper* function returns the tick for which it is computed. The associated location and elevation are those of the selected value.

The `mapper.tick` function can be applied to values of any type.


## Example ##

Stack:

    TOP:  [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,42.0],[20,123.0],[30,211.0],[40,132.0]]}]

WarpScript commands:

    // arguments are: GTS or [GTS], mapper, prewindow, postwindow, occurences
    [ SWAP mapper.tick 0 0 0 ] MAP

Stack: 

    TOP:  [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,10],[20,20],[30,30],[40,40]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN  42.0 ADDVALUE
20 NaN NaN NaN 123.0 ADDVALUE
30 NaN NaN NaN 211.0 ADDVALUE
40 NaN NaN NaN 132.0 ADDVALUE

// arguments are: GTS or [GTS], mapper, prewindow, postwindow, occurences
[ SWAP mapper.tick 0 0 0 ] MAP
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

// arguments are: GTS or [GTS], mapper, prewindow, postwindow, occurences
[ SWAP mapper.tick 0 0 0 ] MAP

VALUES LIST-> 
1 == ASSERT   // values list size
LIST-> DROP
40 == ASSERT
30 == ASSERT
20 == ASSERT
10 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        