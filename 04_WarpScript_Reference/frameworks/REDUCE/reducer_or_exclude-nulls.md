---
title: "reducer.or.exclude-nulls"
layout: "function"
isPage: "true"
link: "/warpscript/framework-reduce"
desc: "Compute or between the values"
categoryTree: ["reference","frameworks"]
category: "reference"
---
 
The `reducer.or.exclude-nulls` function outputs the result of the logical operator **OR** for each tick value of Geo Time Series<sup>TM</sup> which are in the same equivalence class, excluding nulls from the computation.

The location and elevation returned are the first one encountered, which may vary depending on the order of the parameters.

The `reducer.or.exclude-nulls` function can be applied to values of any type, when not applied to **BOOLEAN** types, the current value is considered to be **false**.

The standard version of this reducer, `reducer.or`, will return `null` for any tick where one or more GTS have `null`values.
The *exclude null* version, `reducer.or.exclude-nulls`, will exclude all null values when computing the or.

## Example ##

Stack:

    1:   mark
    TOP:  [{"c":"testname","l":{"label0":"42","label1":"foo"},"a":{},"v":[[100,true],[200,false],[300,true],[400,false],[600,true],[800,true]]},{"c":"testname","l":{"label0":"42","label1":"bar"},"a":{},"v":[[100,true],[200,true],[300,true],[400,false],[500,false],[700,false]]}]

WarpScript commands:

    [] // list of labels to define the equivalence classes. For example : 'label0' 42 ->LIST
    reducer.or.exclude-nulls
    ]
    REDUCE

Stack: 

    TOP: [{"c":"","l":{"label0":"42"},"a":{},"v":[[100,true],[200,true],[300,true],[400,false],[500,false],[600,true],[700,false],[800,true]]}]

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
  300  NaN NaN NaN true ADDVALUE
  400  NaN NaN NaN false ADDVALUE
  600  NaN NaN NaN true ADDVALUE
  800  NaN NaN NaN true ADDVALUE

  NEWGTS 
  'testname'
  RENAME
  { 'label0' '42' 'label1' 'bar' }
  RELABEL
  100  NaN NaN NaN true ADDVALUE
  200  NaN NaN NaN true ADDVALUE
  300  NaN NaN NaN true ADDVALUE
  400  NaN NaN NaN false ADDVALUE
  500  NaN NaN NaN false ADDVALUE
  700  NaN NaN NaN false ADDVALUE
]

[ SWAP [] reducer.or.exclude-nulls  ] REDUCE 
</warp10-warpscript-widget>
{% endraw %}    