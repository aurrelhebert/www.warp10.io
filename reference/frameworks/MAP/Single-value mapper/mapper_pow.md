---
title: "mapper.pow"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Raise the value to a constant power"
categoryTree: ["reference","frameworks","framework-map"]
oldPath: ["20-frameworks","201-framework-map","201-single-value-mappers","mapper_pow.html.md"]
category: "reference"
---
 

This *mapper* function raises the **single value** in a sliding window to a constant power.

If the sliding window is empty, the function does not return any value. If the sliding window contains more than a single value, an error is produced.

The associated location and elevation are those of the single value.

The `mapper.pow` function can be applied to data of type **LONG** or **DOUBLE**.

The `mapper.pow` function must be parameterized with the constant.

The result is always of type **DOUBLE**.

## Syntax ##

    [ [GTS] constant mapper.pow pre post occurences ] MAP

## Note ##
 
 The `mapper.pow` mapper needs a single value sliding window, i.e. pre-window and post-window to 0         

## Example ##

Stack:

    TOP:  [{"c":"GTS1","l":{"label0":"42"},"a":{},"v":[[10,5],[20,120]]},{"c":"GTS2","l":{"label0":"42"},"a":{},"v":[[10,8],[20,42]]}]

WarpScript commands:

    // arguments are: GTS or [GTS], constant mapper, prewindow, postwindow, occurences
    [ SWAP 2.0 mapper.pow 0 0 0 ] MAP

Stack: 

    TOP: [{"c":"GTS1","l":{"label0":"42"},"a":{},"v":[[10,25],[20,14400]]},{"c":"GTS2","l":{"label0":"42"},"a":{},"v":[[10,64],[20,1764]]}]

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

// arguments are: GTS or [GTS], constant mapper, prewindow, postwindow, occurences
[ SWAP 2.0 mapper.pow 0 0 0 ] MAP
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

// arguments are: GTS or [GTS], constant mapper, prewindow, postwindow, occurences
[ SWAP 2.0 mapper.pow 0 0 0 ] MAP

VALUES LIST->
2 == ASSERT
LIST-> DROP
1764 == ASSERT
64 == ASSERT
LIST-> DROP
14400 == ASSERT
25 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        