---
title: "mapper.ne"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Return the first value equal to a given value"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","201-framework-map","210-mapper_ne.html.md"]
category: "reference"
---
 

This *mapper* function returns the first value in a sliding window which is not equal to a given value.

The associated location and elevation are those of the selected value.

The `mapper.ne` function can be applied to data of any type.

The `mapper.ne` function must be parameterized with the value against which to test for equality.

## Example ##

Stack:

    TOP:  [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,2],[20,8],[30,11],[40,20]]}]

WarpScript commands:

    // arguments are: GTS or [GTS], value to compare to, mapper, prewindow, postwindow, occurences
    [ SWAP 8.0 mapper.ne 0 0 0 ] MAP

Stack: 

    TOP:  [[{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,2],[30,11],[40,20]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN  2.0 ADDVALUE
20 NaN NaN NaN  8.0 ADDVALUE
30 NaN NaN NaN 11.0 ADDVALUE
40 NaN NaN NaN 20.0 ADDVALUE

// arguments are: GTS or [GTS], value to compare to, mapper, prewindow, postwindow, occurences
[ SWAP 8.0 mapper.ne 0 0 0 ] MAP
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

    // arguments are: GTS or [GTS], value to compare to, mapper, prewindow, postwindow, occurences
    [ SWAP 8.0 mapper.ne 0 0 0 ] MAP
VALUES LIST-> 
1 == ASSERT   // values list size
LIST-> DROP
20 == ASSERT
11 == ASSERT
2 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        