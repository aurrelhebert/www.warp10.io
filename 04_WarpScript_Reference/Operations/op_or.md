---
title: "op.or"
layout: "function"
isPage: "true"
link: "/warpscript/framework_apply"
desc: "OR operand on values of multiple Geo Time Series"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","501-framework-apply","518-op_or.html.md"]
category: "reference"
---

To apply an `op.or` operation, N parameters are on top of the stack: N-1 Geo Time Series<sup>TM</sup> lists and one labels List. According to those labels, it produces multiple equivalence classes from the GTS inside those N-1 lists (if they match the same labels as the equivalence class). Then `op.or` is applyied to the GTS in those classes, building only one result GTS for each class.

The `op.or` operation will applies an **[`OR`]({{ site.baseurl }}/reference/functions/function_OR)** at each tick on values of all the GTS belonging to the same class (in the order they are passed). The elevation and location are cleared. To produce a result, all GTS of a same class **must have a value** at a same tick.

If the first value found isn't a boolean, all values produced will be false.

The name of the resulting GTS is the one of the last GTS of the equivalence class. The labels kept are the one of the equivalence class.

## Example ##

Stack:

    1:   mark
    TOP: [ [gts1, gts2, ...], [gts3, gts4, ...], ...]

WarpScript commands:

      [ 'label' ] 
      op.or
    ]
    APPLY

Stack: 

    TOP: [gtsOr1, gtsOr2, ...]

{% raw %}
<warp10-warpscript-widget>
[
  [
    NEWGTS "GTS1" RENAME 
    { 'label0' '42' } RELABEL
    10 NaN NaN NaN false ADDVALUE
    20 NaN NaN NaN true ADDVALUE
    NEWGTS "GTS2" RENAME 
    { 'label0' '53' } RELABEL
    10 NaN NaN NaN false ADDVALUE
    15 NaN NaN NaN false ADDVALUE
    20 NaN NaN NaN true ADDVALUE
  ]
  [
    NEWGTS "GTS1" RENAME 
    { 'label0' '42' } RELABEL
    10 NaN NaN NaN true ADDVALUE
    20 NaN NaN NaN false ADDVALUE
    30 NaN NaN NaN true ADDVALUE
    NEWGTS "GTS2" RENAME 
    { 'label0' '53' } RELABEL
    10 NaN NaN NaN false ADDVALUE
    20 NaN NaN NaN true ADDVALUE
    NEWGTS "Solo" RENAME 
    { 'label0' '4253' } RELABEL
    10 NaN NaN NaN false ADDVALUE
    15 NaN NaN NaN false ADDVALUE
    20 NaN NaN NaN true ADDVALUE
  ]
  [ 'label0' ]
  op.or
]
APPLY
</warp10-warpscript-widget>
{% endraw %}     

## Unit test ##

{% raw %}
<warp10-warpscript-widget>
[
  [
    NEWGTS "GTS1" RENAME 
    { 'label0' '42' } RELABEL
    10 NaN NaN NaN false ADDVALUE
    20 NaN NaN NaN true ADDVALUE
    NEWGTS "GTS2" RENAME 
    { 'label0' '42' } RELABEL
    10 NaN NaN NaN true ADDVALUE
    20 NaN NaN NaN true ADDVALUE
  ]
  []
  op.or
]
APPLY
VALUES LIST->
1 == ASSERT
LIST-> DROP
true == ASSERT
true == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
