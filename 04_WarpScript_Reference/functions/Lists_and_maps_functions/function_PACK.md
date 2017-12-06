---
title: "PACK"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Pack a list of numeric or boolean values according to a specified format"
categoryTree: ["reference","functions"]
category: "reference"
signature: "[values] 'string_format' PACK bytes[]"
---

The `PACK` function packs a list of numeric or boolean values according to a specified string format. 

```
[values] 'string_format' PACK bytes[]
```

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Create List containing number and boolean values
[ 42 41 40 true 42.42 ]

// Build a string format : 
// "&lt;L" --> '&lt;' mean no bigendian, 'L' means Long
// "&lt;L32" --> '32' means the length of the number (&lt;64).
// "&gt;L" --> '&gt;' means bigendian.
// "B" --> 'B' means boolean.
// "&lt;D" --> 'D' means Double, length always equals 64.

'&lt;L&lt;L32&gt;LB&lt;D'
PACK

'&lt;L&lt;L32&gt;LB&lt;D'
UNPACK
</warp10-warpscript-widget>
{% endraw %}   