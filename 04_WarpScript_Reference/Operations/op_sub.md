---
title: "op.sub"
layout: "function"
isPage: "true"
link: "/warpscript/framework_apply"
desc: "Compute the difference between its first and second parameters"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","501-framework-apply","502-op_sub.html.md"]
category: "reference"
---

To apply an `op.sub` operation, N parameters are on top of the stack: N-1 Geo Time Series<sup>TM</sup> lists and one labels List. According to those labels, it produces multiple equivalence classes from the GTS inside those N-1 lists (if they match the same labels as the equivalence class). Then `op.sub` is applyied to the GTS in those classes, building only one result GTS for each class.

The sub operator can only operate on equivalence classes which have ** exactly two GTS**. It will **substract** at each tick the value of the first GTS by the value of the second GTS. To produce a result, both GTS of a same class **must have a value** at a same tick.

The type of the resulting GTS will be determined by the first non null value. It only operates on *LONG* and *DOUBLE*.

The name of the resulting GTS is the one of the last GTS of the equivalence class. The labels kept are the one of the equivalence class.

## Example ##

Stack:

    1:   mark
    TOP: [ [gts1{label:0}, gts2{label:1}, ...], [gts3{label:1}, gts4{label:2}, ...], ...]

WarpScript commands:

      [ 'label' ]
      op.sub
    ]
    APPLY

Stack: 

    TOP: [gtsSub{label:0}, gtsSub{label:1}, ...]

{% raw %}
<warp10-warpscript-widget>
[
  [
    NEWGTS "toto" RENAME 
    { 'label0' '42' } RELABEL
    10 NaN NaN NaN 46.5 ADDVALUE
    20 NaN NaN NaN  23  ADDVALUE
    NEWGTS "titi" RENAME 
    { 'label0' '53' } RELABEL
    10 NaN NaN NaN 46.5 ADDVALUE
    20 NaN NaN NaN  23  ADDVALUE
    30 NaN NaN NaN  42  ADDVALUE
  ]
  [
    NEWGTS "tata" RENAME 
    { 'label0' '42' } RELABEL
    10 NaN NaN NaN  4.5 ADDVALUE
    20 NaN NaN NaN  -19 ADDVALUE
    NEWGTS "tati" RENAME 
    { 'label0' '53' } RELABEL
    10 NaN NaN NaN  4.5 ADDVALUE
    15 NaN NaN NaN  0.4 ADDVALUE
    20 NaN NaN NaN  -19 ADDVALUE
  ]
  [ 'label0' ]
  op.sub
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
    10 NaN NaN NaN 46.5 ADDVALUE
    20 NaN NaN NaN  23  ADDVALUE
    NEWGTS "tata" RENAME 
    { 'label0' '42' } RELABEL
    10 NaN NaN NaN  4.5 ADDVALUE
    20 NaN NaN NaN  -19 ADDVALUE
  ]
  []
  op.sub
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