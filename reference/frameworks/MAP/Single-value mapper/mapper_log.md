---
title: "mapper.log"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Take the log of the value"
categoryTree: ["reference","frameworks","framework-map"]
oldPath: ["20-frameworks","201-framework-map","201-single-value-mappers","mapper_log.html.md"]
category: "reference"
---
 

This *mapper* function takes the log of the **single value** in a sliding window in the base used as parameter to `mapper.log`.

If the sliding window is empty, the function does not return any value. If the sliding window contains more than a single value, an error is produced.

The associated location and elevation are those of the single value.

The `mapper.log` function can be applied to data of type **LONG** or **DOUBLE**.

The `mapper.log` function must be parameterized with the constant.

The result is always of type **DOUBLE**.

The `mapper.log` mapper needs a single value sliding window, i.e. pre-window and post-window to 0. 

## Example ##

Stack:

    TOP:  [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,1],[20,10]]}]

WarpScript commands:

    // arguments are: GTS or [GTS], constant (will be used as the base of the log), mapper, prewindow, postwindow, occurences
    [ SWAP 10.0 mapper.log 0 0 0 ] MAP

Stack: 

    TOP: [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,0],[20,1]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN  1.0 ADDVALUE
20 NaN NaN NaN 10.0 ADDVALUE

// arguments are: GTS or [GTS], constant (will be used as the base of the log), mapper, prewindow, postwindow, occurences
[ SWAP 10.0 mapper.log 0 0 0 ] MAP
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN  1.0 ADDVALUE
20 NaN NaN NaN 10.0 ADDVALUE

// arguments are: GTS or [GTS], constant (will be used as the base of the log), mapper, prewindow, postwindow, occurences
[ SWAP 10.0 mapper.log 0 0 0 ] MAP

VALUES LIST-> 
1 == ASSERT   // values list size
LIST-> DROP
1 == ASSERT
0 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}  