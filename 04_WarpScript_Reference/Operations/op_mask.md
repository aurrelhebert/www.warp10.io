---
title: "op.mask"
layout: "function"
isPage: "true"
link: "/warpscript/framework_apply"
desc: "Eliminate values according to a mask"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","501-framework-apply","510-op_mask.html.md"]
category: "reference"
---

The *op.mask* operation applies to two lists of Geo Time Series<sup>TM</sup>. The first one must be a singleton containing only one GTS with *BOOLEAN* values, the second list can contain multiples Geo Time Series of any types.

If the value of the GTS contained in the first list at the current tick is *true*, then the values at the current tick of the GTS inside the second list will be kept. If the value of the GTS contained in the first list is *false*, no value will be produced for the current tick.

Make sure your equivalence classes contains only a single GTS.

## Example ##

Stack:

    2:   mark
    1:   [gtsBoolean]
    TOP: [gts1, gts2, ...]


WarpScript commands:

      // list of label names to use for computing the equivalence classes
      [ 'label' ]
      op.mask
    ]
    APPLY


Stack: 


    TOP: [gtsMask1, gtsMask2, ...]

{% raw %}
<warp10-warpscript-widget>
[

  // first GTS with boolean values
  [
    NEWGTS "test" RENAME
    { 'item' 'mask' } RELABEL
    100 NaN NaN NaN false ADDVALUE
    101 NaN NaN NaN true  ADDVALUE
    102 NaN NaN NaN false ADDVALUE
  ]

  // list of GTS where we apply the mask op to
  [
    NEWGTS "test" RENAME
    { 'item' '10' } RELABEL
    100 NaN NaN NaN 10 ADDVALUE
    101 NaN NaN NaN 10 ADDVALUE
    102 NaN NaN NaN 10 ADDVALUE
    NEWGTS "test" RENAME
    { 'item' '9' } RELABEL
    100 NaN NaN NaN 9 ADDVALUE
    101 NaN NaN NaN 9 ADDVALUE
    102 NaN NaN NaN 9 ADDVALUE
  ]

  // list of label names to use for computing the equivalence classes
  [ 'item' ]

  // launch apply..
  op.mask
]
APPLY
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget>
[

  // first GTS with boolean values
  [
    NEWGTS "test" RENAME
    { 'item' 'mask' } RELABEL
    100 NaN NaN NaN false ADDVALUE
    101 NaN NaN NaN true  ADDVALUE
    102 NaN NaN NaN false ADDVALUE
  ]

  // list of GTS where we apply the mask op to
  [
    NEWGTS "test" RENAME
    { 'item' '10' } RELABEL
    100 NaN NaN NaN 10 ADDVALUE
    101 NaN NaN NaN 10 ADDVALUE
    102 NaN NaN NaN 10 ADDVALUE
    NEWGTS "test" RENAME
    { 'item' '9' } RELABEL
    100 NaN NaN NaN 9 ADDVALUE
    101 NaN NaN NaN 9 ADDVALUE
    102 NaN NaN NaN 9 ADDVALUE
  ]

  // list of label names to use for computing the equivalence classes
  [ 'item' ]

  // launch apply..
  op.mask
]
APPLY
'result'
STORE
$result
VALUES LIST->
2 == ASSERT
LIST-> DROP
10 == ASSERT
LIST-> DROP
9 == ASSERT
$result
LIST-> DROP
// first GTS
LABELS
MAP-> DROP
'10' == ASSERT
DROP
// second GTS
LABELS
MAP-> DROP
'9' == ASSERT
DROP
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}  