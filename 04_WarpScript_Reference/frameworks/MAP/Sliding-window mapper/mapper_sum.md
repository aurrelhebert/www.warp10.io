---
title: "mapper.sum"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Return the sum of the values"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","201-framework-map","260-mapper_sum.html.md"]
category: "reference"
---
 

This *mapper* function computes the sum of all the values found in the sliding window. The associated location and elevation are those of the most recent tick of the window.

The `mapper.sum` function can only be applied to values of type **LONG** or **DOUBLE**, it will produce no value for types **STRING** and **BOOLEAN**.

## Example ##

Stack:

    TOP:  [{"c":"GTS1","l":{"label0":"42"},"a":{},"v":[[10,5],[20,120]]},{"c":"GTS2","l":{"label0":"42"},"a":{},"v":[[10,8],[20,42]]}]

WarpScript commands:

    // arguments are: GTS or [GTS], mapper, prewindow, postwindow, occurences
    [ SWAP mapper.sum 2 0 0 ] MAP

Stack: 

    TOP: [{"c":"GTS1","l":{"label0":"42"},"a":{},"v":[[10,5],[20,125]]},{"c":"GTS2","l":{"label0":"42"},"a":{},"v":[[10,8],[20,50]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>[
NEWGTS "GTS1" RENAME 
    { 'label0' '42' } RELABEL
    10 NaN NaN NaN 5.0 ADDVALUE
    20 NaN NaN NaN 120.0 ADDVALUE 
    NEWGTS "GTS2" RENAME 
    { 'label0' '42' } RELABEL
    10 NaN NaN NaN 8.0 ADDVALUE
    20 NaN NaN NaN 42.0 ADDVALUE 
]
[ SWAP mapper.sum 2 0 0 ] MAP
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget>[
    NEWGTS "GTS1" RENAME 
    { 'label0' '42' } RELABEL
    10 NaN NaN NaN 5.0 ADDVALUE
    20 NaN NaN NaN 120.0 ADDVALUE 
    NEWGTS "GTS2" RENAME 
    { 'label0' '42' } RELABEL
    10 NaN NaN NaN 8.0 ADDVALUE
    20 NaN NaN NaN 42.0 ADDVALUE 
]
[ SWAP mapper.sum 2 0 0 ] MAP
VALUES LIST->
2 == ASSERT
LIST-> DROP
50 == ASSERT
8 == ASSERT
LIST-> DROP
125 == ASSERT
5 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}    