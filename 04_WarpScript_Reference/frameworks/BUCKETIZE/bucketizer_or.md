---
title: "bucketizer.or"
layout: "function"
isPage: "true"
link: "/warpscript/framework_bucketize"
desc: "Compute or between the values of the interval"
categoryTree: ["reference","frameworks"]
category: "reference"
---

The `bucketizer.or` function applies the logical operator **OR** on all the values found in the interval to bucketize. 

The associated location and elevation are those of the most recent tick of the interval.

The `bucketizer.or` function can be applied to values of any type, when not applied to **BOOLEAN** types, the current value is considered to be **false**.

## Example ##

Stack: 

    TOP: 
    [{"c":"testname","l":{"label0":"42","label1":"foo"},"a":{},"v":[[100,true],[200,false],[300,true],[400,true],[500,true],[600,true],[700,true],[800,true]]},{"c":"testname","l":{"label0":"42","label1":"foo"},"a":{},"v":[[100,true],[200,true],[300,true],[400,true],[500,true],[600,true],[700,true],[2000,false]]}]

WarpScript commands:

    // arguments are: GTS or [GTS], bucketizer, lastbucket, bucketspan, bucketcount
    [ SWAP bucketizer.or 2000 0 6 ] BUCKETIZE

Stack: 

    TOP:  [{"c":"testname","l":{"label0":"42","label1":"foo"},"a":{},"v":[[1049,true],[732,true],[415,true]]},{"c":"testname","l":{"label0":"42","label1":"foo"},"a":{},"v":[[2000,false],[732,true],[415,true]]}]


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
  400  NaN NaN NaN true ADDVALUE
  500  NaN NaN NaN true ADDVALUE
  600  NaN NaN NaN true ADDVALUE
  700  NaN NaN NaN true ADDVALUE
  800  NaN NaN NaN true ADDVALUE

  NEWGTS 
  'testname'
  RENAME
  { 'label0' '42' 'label1' 'foo' }
  RELABEL
  100  NaN NaN NaN true ADDVALUE
  200  NaN NaN NaN true ADDVALUE
  300  NaN NaN NaN true ADDVALUE
  400  NaN NaN NaN true ADDVALUE
  500  NaN NaN NaN true ADDVALUE
  600  NaN NaN NaN true ADDVALUE
  700  NaN NaN NaN true ADDVALUE
  2000  NaN NaN NaN false ADDVALUE
]

// arguments are: GTS or [GTS], bucketizer, lastbucket, bucketspan, bucketcount
[ SWAP bucketizer.or 2000 0 6 ] BUCKETIZE
</warp10-warpscript-widget>
{% endraw %}    