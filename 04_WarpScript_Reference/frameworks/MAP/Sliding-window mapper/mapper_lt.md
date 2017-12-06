---
title: "mapper.lt"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Return the first value lesser than a given value"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","201-framework-map","212-mapper_lt.html.md"]
category: "reference"
---
 

This *mapper* function returns the first value in a sliding window which is less than a given threshold.

The associated location and elevation are those of the selected value.

The `mapper.lt` function can be applied to data of any type except **BOOLEAN**.

The `mapper.lt` function must be parameterized with the threshold.

## Example ##

Stack:

    TOP:  [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,2],[20,1]]}]

WarpScript commands:

    // arguments are: GTS or [GTS], threshold, mapper, prewindow, postwindow, occurences
    [ SWAP 2.0 mapper.lt 0 0 0 ] MAP

Stack: 

    TOP: [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[20,1]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN  2.0 ADDVALUE
20 NaN NaN NaN 1.0 ADDVALUE

// arguments are: GTS or [GTS], threshold, mapper, prewindow, postwindow, occurences
[ SWAP 2.0 mapper.lt 0 0 0 ] MAP
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN  2.0 ADDVALUE
20 NaN NaN NaN 1.0 ADDVALUE

// arguments are: GTS or [GTS], threshold, mapper, prewindow, postwindow, occurences
[ SWAP 2.0 mapper.lt 0 0 0 ] MAP

VALUES LIST-> 
1 == ASSERT   // values list size
LIST-> DROP
1 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
