---
title: "RELABEL"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Modify the labels of a Geo Time Series"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","241-function_RELABEL.html.md"]
category: "reference"
---
 

The `RELABEL` function modifies the labels on top of the stack after having consumed a map of labels as parameter. 
The parameter is simply a map of label name to label value.

Labels appearing in the parameter list will be added to those of the original GTS instances.

If a label has an empty value in the parameter map, this label will be removed from the labels of all GTS instances found in the list.

If a null name is found, then the labels in the parameter map will replace the original labels from the GTS.


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[
  // Create a new list of GTS 
  NEWGTS 
  'test name 1' RENAME
  { 'label0' '43' 'label1' 'foo' 'label2' '1' } RELABEL
  NEWGTS 
  'test name 2' RENAME
  { 'label0' '44' 'label1' 'bar' 'label2' '2' } RELABEL
  NEWGTS 
  'test name 3' RENAME 
  { 'label0' '45' 'label1' 'foobar' 'label2' '3' } RELABEL 
]
{ 'label0' '42' 'label1' ''  'label3' 'yeah' } RELABEL
</warp10-warpscript-widget>
{% endraw %}
