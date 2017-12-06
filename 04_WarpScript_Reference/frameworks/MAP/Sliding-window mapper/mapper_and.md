---
title: "mapper.and"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Compute and between the values"
categoryTree: ["reference","frameworks"]
category: "reference"
---

This *mapper* function applies the logical operator **AND** on all the values found in each sliding window. 

The associated location and elevation are those of the most recent tick of the interval.

The `mapper.and` function can be applied to values of any type, when not applied to **BOOLEAN** types, the current value is considered to be **false**.

## Example ##

Stack:

    1:   mark
    TOP:  [{"c":"testname","l":{"label0":"42","label1":"foo"},"a":{},"v":[[100,true],[200,false],[300,false],[400,true],[500,true],[600,true],[700,true],[800,true]]}]

WarpScript commands:

    mapper.and
    1
    1
    0
    ]
    MAP

Stack: 

    TOP:  [{"c":"testname","l":{"label0":"42","label1":"foo"},"a":{},"v":[[100,false],[200,false],[300,false],[400,false],[500,true],[600,true],[700,true],[800,true]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>
[
  NEWGTS 
  'testname'
  RENAME
  { 'label0' '42' 'label1' 'foo' }
  RELABEL
  100  NaN NaN NaN true ADDVALUE
  200  NaN NaN NaN false ADDVALUE
  300  NaN NaN NaN false ADDVALUE
  400  NaN NaN NaN true ADDVALUE
  500  NaN NaN NaN true ADDVALUE
  600  NaN NaN NaN true ADDVALUE
  700  NaN NaN NaN true ADDVALUE
  800  NaN NaN NaN true ADDVALUE
]

[ SWAP mapper.and 1 1 0 ] MAP 
</warp10-warpscript-widget>
{% endraw %}