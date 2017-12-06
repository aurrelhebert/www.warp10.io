---
title: "op.negmask"
layout: "function"
isPage: "true"
link: "/warpscript/framework_apply"
desc: "Eliminate values according to a mask"
categoryTree: ["reference","frameworks"]
category: "reference"
---

The *op.negmask* operation applies to two lists of Geo Time Series<sup>TM</sup>. The first one must be a singleton containing only one GTS with *BOOLEAN* values, the second list can contain multiples Geo Time Series of any types.

If the value of the GTS contained in the first list at the current tick is *true*, then no value for the current tick of the GTS inside the second list will be produced. If there is no value or if the value of the GTS contained in the first list is *false*, the current value is kept for the current tick.

Make sure your equivalence classes contains only a single GTS.

## Example ##

Stack:

    2:   mark
    1:   [gtsBoolean]
    TOP: [gts1, gts2, ...]


WarpScript commands:

      // list of label names to use for computing the equivalence classes
      [ 'label' ]
      op.negmask
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
  op.negmask
]
APPLY
</warp10-warpscript-widget>
{% endraw %}    