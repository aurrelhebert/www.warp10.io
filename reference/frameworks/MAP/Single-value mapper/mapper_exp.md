---
title: "mapper.exp"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Raise a constant to the value power"
categoryTree: ["reference","frameworks","framework-map"]
oldPath: ["20-frameworks","201-framework-map","201-single-value-mappers","mapper_exp.html.md"]
category: "reference"
---
 

This *mapper* function raises a constant to the **single value** in a sliding window.

If the sliding window is empty, the function does not return any value. If the sliding window contains more than a single value, an error is produced.

The associated location and elevation are those of the single value.

The `mapper.exp` function can be applied to data of type **LONG** or **DOUBLE**.

The `mapper.exp` function must be parameterized with the constant.

The result is always of type **DOUBLE**.

## Note ##
 
 The `mapper.exp` mapper needs a single value sliding window, i.e. pre-window and post-window to 0.      

 So you are looking for a way to apply the exponential function, *e<sup>x</sup>*, to a series of GTS. It's very easy to do it using `mapper.exp` and the [`e`]({{ site.baseurl }}/warpscript/function.e) constant.

## Example ##

Stack:

    TOP:  [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,2],[20,5]]}]

WarpScript commands:

    // arguments are: GTS or [GTS], constant, mapper, prewindow, postwindow, occurences
    [ SWAP 2.0 mapper.exp  0 0 0 ] MAP

Stack: 

    TOP: [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,4],[20,32]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN  2.0 ADDVALUE
20 NaN NaN NaN 5.0 ADDVALUE

// arguments are: GTS or [GTS], constant, mapper, prewindow, postwindow, occurences
[ SWAP 2.0 mapper.exp  0 0 0 ] MAP
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN  2.0 ADDVALUE
20 NaN NaN NaN 5.0 ADDVALUE

// arguments are: GTS or [GTS], constant, mapper, prewindow, postwindow, occurences
[ SWAP 2.0 mapper.exp  0 0 0 ] MAP

VALUES LIST-> 
1 == ASSERT   // values list size
LIST-> DROP
32 == ASSERT
4 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        