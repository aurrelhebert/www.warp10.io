---
title: "mapper.abs"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Return the absolute value of the single value in a sliding window"
categoryTree: ["reference","frameworks","framework-map"]
oldPath: ["20-frameworks","201-framework-map","201-single-value-mappers","100-mapper_abs.html.md"]
category: "reference"
---
 

This *mapper* function returns the absolute value of **single value** in a sliding window.

The `mapper.abs` function can be applied to data of type **LONG** or **DOUBLE**.


## Example ##

Stack:

    TOP:  [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,-42],[20,-123]]},{"c":"tata","l":{"label0":"42"},"a":{},"v":[[10,-211],[20,-42]]}]

WarpScript commands:

    // arguments are: GTS or [GTS], mapper, prewindow, postwindow, occurences
    [ SWAP mapper.abs 0 0 0 ] MAP

Stack: 

    TOP: [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,42],[20,123]]},{"c":"tata","l":{"label0":"42"},"a":{},"v":[[10,211],[20,42]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>[
  NEWGTS "toto" RENAME 
  { 'label0' '42' } RELABEL
  10 NaN NaN NaN -42.0 ADDVALUE
  20 NaN NaN NaN -123.0 ADDVALUE
  NEWGTS "tata" RENAME 
  { 'label0' '42' } RELABEL
  10 NaN NaN NaN -211.0 ADDVALUE
  20 NaN NaN NaN -42.0 ADDVALUE
]

// arguments are: GTS or [GTS], mapper, prewindow, postwindow, occurences
[ SWAP mapper.abs 0 0 0 ] MAP
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget>[
  NEWGTS "toto" RENAME 
  { 'label0' '42' } RELABEL
  10 NaN NaN NaN -42.0 ADDVALUE
  20 NaN NaN NaN -123.0 ADDVALUE
  NEWGTS "tata" RENAME 
  { 'label0' '42' } RELABEL
  10 NaN NaN NaN -211.0 ADDVALUE
  20 NaN NaN NaN -42.0 ADDVALUE
]

// arguments are: GTS or [GTS], mapper, prewindow, postwindow, occurences
[ SWAP mapper.abs 0 0 0 ] MAP
LIST-> 2 == ASSERT    // We should have two list
VALUES LIST-> DROP    // Extract 1st list, drop its size
42 == ASSERT
211 == ASSERT
VALUES LIST-> DROP    // Extract 2nd list, drop its size
123 == ASSERT
42 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        