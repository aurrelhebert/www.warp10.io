---
title: "FILLTICKS"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Add values to a GTS at given ticks"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","510-function_FILLTICKS.html.md"]
category: "reference"
---
 

The `FILLTICKS` function add values to a Geo Time Serie<sup>TM</sup> instance for ticks in the given LIST for which it does not yet have values, by re-using the value/location/elevation of the next non empty bucket to fill each empty bucket. It expects a GTS or a LIST thereof on the top of the stack.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Create a new GTS with five values 
NEWGTS 'test name' RENAME
{ 'label0' '42' 'label1' 'foo' } RELABEL
100  NaN NaN NaN 10 ADDVALUE
200  NaN NaN NaN  9 ADDVALUE
300  NaN NaN NaN  8 ADDVALUE
400  NaN NaN NaN  7 ADDVALUE
500  NaN NaN NaN  6 ADDVALUE
// Creating argument LIST
[
  0.0 0.0 0 42
  // Creating ticks LIST
  [ 125 225 325 425 ]
]
FILLTICKS
SORT
</warp10-warpscript-widget>
{% endraw %}

## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Create a new GTS with five values 
NEWGTS 'test name' RENAME
{ 'label0' '42' 'label1' 'foo' } RELABEL
100  NaN NaN NaN 10 ADDVALUE
200  NaN NaN NaN  9 ADDVALUE
300  NaN NaN NaN  8 ADDVALUE
400  NaN NaN NaN  7 ADDVALUE
500  NaN NaN NaN  6 ADDVALUE
// Creating argument LIST
[
  0.0 0.0 0 42
  // Creating ticks LIST
  [ 125 225 325 425 ]
]
FILLTICKS
SORT
TICKS
SIZE
9 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}
