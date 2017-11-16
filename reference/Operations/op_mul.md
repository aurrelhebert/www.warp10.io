---
title: "op.mul"
layout: "function"
isPage: "true"
link: "/warpscript/framework_apply"
desc: "Produce values which are the product of all parameters"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","501-framework-apply","503-op_mul.html.md"]
category: "reference"
---

To apply an `op.mul` operation, N parameters are on top of the stack: N-1 Geo Time Series<sup>TM</sup> lists and one labels List. According to those labels, it produces multiple equivalence classes from the GTS inside those N-1 lists (if they match the same labels as the equivalence class). Then `op.mul` is applyied to the GTS in those classes, building only one result GTS for each class.

The `op.mul` operation will **multiply** at each tick all the values of all the GTS belonging to the same class (if they do have a value for this current tick). To produce a result, all GTS of a same class **must have a value** at a same tick.

The type of the resulting GTS will be determined by the first non null value. 

The name of the resulting GTS is the one of the last GTS of the equivalence class. The labels kept are the one of the equivalence class.

Some types cannot be multiplied (*eg* it's not possible to multiply a *STRING* to a *LONG*).

## Example ##

Stack:

    1:   mark
    TOP: [ [gts1, gts2, ...], [gts3, gts4, ...], ...]

WarpScript commands:

      [ 'label' ] 
      op.mul
    ]
    APPLY

Stack: 

    TOP: [gtsMul1, gtsMul2, ...]

{% raw %}
<warp10-warpscript-widget>
[
  [
    NEWGTS "toto" RENAME 
    { 'label0' '42' } RELABEL
    10 NaN NaN NaN 21 ADDVALUE
    20 NaN NaN NaN 14  ADDVALUE
    NEWGTS "tata" RENAME 
    { 'label0' '53' } RELABEL
    10 NaN NaN NaN 2.0 ADDVALUE
    15 NaN NaN NaN 1.0 ADDVALUE
    20 NaN NaN NaN 0.5 ADDVALUE
  ]
  [
    NEWGTS "toto" RENAME 
    { 'label0' '42' } RELABEL
    10 NaN NaN NaN 2 ADDVALUE
    20 NaN NaN NaN 3 ADDVALUE
    30 NaN NaN NaN 4 ADDVALUE
    NEWGTS "tata" RENAME 
    { 'label0' '53' } RELABEL
    10 NaN NaN NaN 21.1 ADDVALUE
    20 NaN NaN NaN 84.1 ADDVALUE
    NEWGTS "Solo" RENAME 
    { 'label0' '4253' } RELABEL
    10 NaN NaN NaN -42 ADDVALUE
    20 NaN NaN NaN 42 ADDVALUE
  ]
  [ 'label0' ]
  op.mul
]
APPLY
</warp10-warpscript-widget>
{% endraw %}     


## Unit test ##

{% raw %}
<warp10-warpscript-widget>
[
  [
    NEWGTS "toto" RENAME 
    { 'label0' '42' } RELABEL
    10 NaN NaN NaN 21.0 ADDVALUE
    20 NaN NaN NaN 84.0  ADDVALUE
    NEWGTS "tata" RENAME 
    { 'label0' '42' } RELABEL
    10 NaN NaN NaN 2.0 ADDVALUE
    20 NaN NaN NaN 0.5 ADDVALUE
  ]
  []
  op.mul
]
APPLY
LIST-> DROP   // expand the result list to extract the result GTS
VALUES LIST-> 
2 == ASSERT   // values list size
42 == ASSERT
42 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        


## A richer example ##

{% raw %}
<warp10-warpscript-widget>
[
  [
    NEWGTS "A" RENAME 
    { 'label0' '42' } RELABEL
    10 NaN NaN NaN 21.0 ADDVALUE
    20 NaN NaN NaN 84.0  ADDVALUE
    NEWGTS "B" RENAME 
    { 'label0' '42' } RELABEL
    10 NaN NaN NaN 2.0 ADDVALUE
    20 NaN NaN NaN 0.5 ADDVALUE
    NEWGTS "C" RENAME 
    { 'label0' '42' } RELABEL
    10 NaN NaN NaN 4.0 ADDVALUE
    20 NaN NaN NaN 0.25 ADDVALUE
  ]
  []
  op.mul
]
APPLY
</warp10-warpscript-widget>
{% endraw %}
