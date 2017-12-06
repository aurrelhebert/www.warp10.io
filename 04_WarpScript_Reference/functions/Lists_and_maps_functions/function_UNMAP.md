---
title: "UNMAP"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Deconstructs a map, putting each key/value pair as two elements on the stack on top of a Mark."
categoryTree: ["reference","functions"]
category: "reference"
signature: "{map} UNMAP MARK value0 key0 ... keyN valueN"
---

The `UNMAP` function deconstructs a map, putting each key/value pair as two elements on the stack on top of a Mark. The last pair contained in the map is the one on top of the stack after the `UNMAP` execution.

```
{map} UNMAP MARK value0 key0 ... keyN valueN
```

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Create Map with 2 key-value
{ 
  'foo' 42 
  'bar' 'myValue'
}

// Apply UNMAP
UNMAP
</warp10-warpscript-widget>
{% endraw %}   