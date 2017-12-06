---
title: "UNPACK"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Unpack a list of numeric or boolean values according to a specified format"
categoryTree: ["reference","functions"]
category: "reference"
signature: "bytes[] 'string_format' UNPACK [values]"
---

The `UNPACK` function unpacks a list of numeric or boolean values according to a specified string format. 

```
bytes[] 'string_format' UNPACK [values]
```

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Create List containing number and boolean values
[ 42 41 40 true 42.42 ]

// Build a string format : 
// "<L" --> '<' mean no bigendian, 'L' means Long
// "<L32" --> '32' means the length of the number (<64).
// ">L" --> '>' means bigendian.
// "B" --> 'B' means boolean.
// "<D" --> 'D' means Double, length always equals 64.

'&lt;L&lt;L32&gt;LB&lt;D'
PACK

'&lt;L&lt;L32&gt;LB&lt;D'
UNPACK
</warp10-warpscript-widget>
{% endraw %}   