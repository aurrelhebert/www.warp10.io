---
title: "op.eq"
layout: "function"
isPage: "true"
link: "/warpscript/framework_apply"
desc: "Check values from N time Geo Time Series for equality"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","501-framework-apply","512-op_eq.html.md"]
category: "reference"
---
 
To apply an `op.eq` operation, N parameters are on top of the stack: N-1 Geo Time Series<sup>TM</sup> lists and one labels List. According to those labels, it produces multiple equivalence classes from the GTS inside those N-1 lists (if they match the same labels as the equivalence class). Then `op.eq` is applyied to the GTS in those classes, building only one result GTS for each class.

The `op.eq` operation will check for **equality** at each tick all the values of all the GTS belonging to the same class (if they do have a value for this current tick). If one GTS doesn't have a value for the current tick the result for this tick is false.

The elevation and location are cleared. 

The name of the resulting GTS is the one of the last GTS of the equivalence class. The labels kept are the one of the equivalence class.

## Example ##

Stack:

    1:   mark
    TOP: [ [gts1, gts2, ...], [gts3, gts4, ...], ...]

WarpScript commands:

      [ 'label' ] 
      op.eq
    ]
    APPLY

Stack: 

    TOP: [gtsEq1, gtsEq2, ...]

{% raw %}
<warp10-warpscript-widget>
[
  [
    NEWGTS "GTS1" RENAME 
    { 'label0' '42' } RELABEL
    10 NaN NaN NaN 46 ADDVALUE
    20 NaN NaN NaN 5 ADDVALUE
    NEWGTS "GTS2" RENAME 
    { 'label0' '53' } RELABEL
    10 NaN NaN NaN 46.5 ADDVALUE
    15 NaN NaN NaN 44 ADDVALUE
    20 NaN NaN NaN 42.0 ADDVALUE
  ]
  [
    NEWGTS "GTS1" RENAME 
    { 'label0' '42' } RELABEL
    10 NaN NaN NaN 46 ADDVALUE
    20 NaN NaN NaN 5 ADDVALUE
    30 NaN NaN NaN 0 ADDVALUE
    NEWGTS "GTS2" RENAME 
    { 'label0' '53' } RELABEL
    10 NaN NaN NaN -42.0 ADDVALUE
    20 NaN NaN NaN 42.0 ADDVALUE
    NEWGTS "Solo" RENAME 
    { 'label0' '4253' } RELABEL
    10 NaN NaN NaN 46 ADDVALUE
    15 NaN NaN NaN 44 ADDVALUE
    20 NaN NaN NaN 42 ADDVALUE
  ]
  [ 'label0' ]
  op.eq
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
  op.eq
]
APPLY
VALUES LIST->
1 == ASSERT
LIST-> DROP
true == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
