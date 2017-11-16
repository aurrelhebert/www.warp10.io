---
title: "MAT->"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Converts a Matrix into nested lists"
categoryTree: ["reference","functions"]
category: "reference"
signature: "Matrix MAT-> [l0] [l1] ... [ln]"
---

The `MAT->` function converts a Matrix into nested lists. 

```
Matrix MAT-> [lo] [l1] ... [ln]
```

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Create List containing number and boolean values
[ [ 42 41 40 42.42 ] [ 42 41 40 0.2 ] [ 42 41 40 42.42 ] ]

// Convert list to Matrix
->MAT

// Convert Matrix to list
MAT->

</warp10-warpscript-widget>
{% endraw %}   