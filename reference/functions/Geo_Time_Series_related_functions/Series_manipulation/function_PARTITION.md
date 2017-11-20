---
title: "PARTITION"
layout: function
isPage: "true"
desc: "Splits GTS in equivalence classes based on label values."
categoryTree: ["reference","functions"]
category: reference
signature: "[ gts ] [ labels ] PARTITION { { labels } [ gts ] ... { labels } [ gts ] }"
---

The `PARTITION` splits a GTS list in equivalence classes based on label values.

This pushes back on the stack a map with `key` a JSON map of labels that constitutes the equivalence classe, and with `value` the GTS list that belongs to it.

```
[ gts ] [ labels ] PARTITION { { labels } [ gts ] ... { labels } [ gts ] }
```

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Create a new GTS list with several GTS
[
  NEWGTS 
  'test-name-1'
  RENAME
  { 'label0' '42' 'label1' 'foo' }
  RELABEL

  NEWGTS 
  'test-name-2'
  RENAME
  { 'label0' '42' 'label1' 'foo' }
  RELABEL

  NEWGTS 
  'test-name-2'
  RENAME
  { 'label0' '42' 'label1' 'bar' }
  RELABEL
]
// List of labels to compute the equivalence classes
[ 'label0' 'label1' ]
// Apply partition
PARTITION
</warp10-warpscript-widget>
{% endraw %}