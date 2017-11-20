---
title: "RENAME"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Rename a Geo Time Series"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","240-function_RENAME.html.md"]
category: "reference"
---
 

The `RENAME` function  modifies the name of a GTS or a list of GTS on top of the stack after having consumed a parameter from the top of the stack.

The parameter is the name to assign to the GTS instances. If this name starts with '+' (As the string are URL encoded, the symbol `+` have to be replaced by `%2B`, otherwise a `space` will replace the `+` in the string), the content following the '+' (%2B) will be added to the existing name of each GTS instance.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[
  // Create a new list of GTS 
  NEWGTS 
  'test_name_1' RENAME
  { 'label0' '42' 'label1' 'foo' } RELABEL
  NEWGTS 
  'test_name_2' RENAME
  { 'label0' '43' 'label1' 'bar' } RELABEL
  NEWGTS 
  'test_name_3' RENAME
  { 'label0' '44' 'label1' 'foobar' } RELABEL 
]
'%2B.new_name' RENAME
</warp10-warpscript-widget>
{% endraw %}
