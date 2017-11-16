---
title: "VALUEHISTOGRAM"
layout: function
isPage: "true"
desc: "Builds a value histogram for a GTS."
categoryTree: ["reference","functions"]
category: reference
signature: "gts VALUEHISTOGRAM { value count ... value count }"
---

The `VALUEHISTOGRAM` function builds a value histogram for a single GTS or a List of GTS.
This function replaces on the stack each serie by a map were the `key` are the values of the GTS and the `value` is the count of its occurence in the serie.

```
gts VALUEHISTOGRAM { value count ... value count }
```

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Create a new GTS with ten values 
NEWGTS 
'test name'
RENAME
{ 'label0' '42' 'label1' 'foo' }
RELABEL
100  NaN NaN NaN 1 ADDVALUE
200  NaN NaN NaN  42 ADDVALUE
300  NaN NaN NaN  42 ADDVALUE
400  NaN NaN NaN  2 ADDVALUE
500  NaN NaN NaN  53 ADDVALUE
700  NaN NaN NaN  100 ADDVALUE
800  NaN NaN NaN  42 ADDVALUE
900  NaN NaN NaN  42 ADDVALUE
1000 NaN NaN NaN  2 ADDVALUE
1100 NaN NaN NaN  2 ADDVALUE
// Build a value histogram
VALUEHISTOGRAM
</warp10-warpscript-widget>
{% endraw %}