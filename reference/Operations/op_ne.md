---
title: "op.ne"
layout: "function"
isPage: "true"
link: "/warpscript/framework_apply"
desc: "Check values from N time Geo Time Series for inequality"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","501-framework-apply","511-op_ne.html.md"]
category: "reference"
---

To apply an `op.ne` operation, N parameters are on top of the stack: N-1 Geo Time Series<sup>TM</sup> lists and one labels List. According to those labels, it produces multiple equivalence classes from the GTS inside those N-1 lists (if they match the same labels as the equivalence class). Then `op.ne` is applyied to the GTS in those classes, building only one result GTS for each class.

The `op.ne` operation will check for **inequality** at each tick all the values of all the GTS belonging to the same class. If one GTS doesn't have a value for the current tick the result for this tick is false.

The elevation and location are cleared.

The name of the resulting GTS is the one of the last GTS of the equivalence class. The labels kept are the one of the equivalence class.

## Example ##

Stack:

    1:   mark
    TOP: [ [gts1, gts2, ...], [gts3, gts4, ...], ...]

WarpScript commands:

      [ 'label' ] 
      op.ne
    ]
    APPLY

Stack: 

    TOP: [gtsNe1, gtsNe2, ...]

{% raw %}
<warp10-warpscript-widget>
[
  [ 
    NEWGTS "GTS1" RENAME 
    { 'label0' '42' } RELABEL
    10 NaN NaN NaN 46.5 ADDVALUE
    20 NaN NaN NaN 42 ADDVALUE
    NEWGTS "GTS2" RENAME 
    { 'label0' '53' } RELABEL
    10 NaN NaN NaN 46.5 ADDVALUE
    15 NaN NaN NaN 44.0 ADDVALUE
    20 NaN NaN NaN 42.42 ADDVALUE
  ]
  [
    NEWGTS "GTS1" RENAME 
    { 'label0' '42' } RELABEL
    10 NaN NaN NaN 46.5 ADDVALUE
    20 NaN NaN NaN 5 ADDVALUE
    30 NaN NaN NaN -5 ADDVALUE
    NEWGTS "GTS2" RENAME 
    { 'label0' '53' } RELABEL
    10 NaN NaN NaN 46.5 ADDVALUE
    20 NaN NaN NaN 42.0 ADDVALUE
    NEWGTS "Solo" RENAME 
    { 'label0' '4253' } RELABEL
    10 NaN NaN NaN 46 ADDVALUE
    15 NaN NaN NaN 44 ADDVALUE
    20 NaN NaN NaN 42 ADDVALUE
  ]
  [ 'label0' ]
  op.ne
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
    10 NaN NaN NaN 46.5 ADDVALUE
    20 NaN NaN NaN 5 ADDVALUE
    NEWGTS "GTS2" RENAME 
    { 'label0' '42' } RELABEL
    10 NaN NaN NaN 46.5 ADDVALUE
    20 NaN NaN NaN 42 ADDVALUE
  ]
  []
  op.ne
]
APPLY
VALUES LIST->
1 == ASSERT
LIST-> DROP
true == ASSERT
false == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
