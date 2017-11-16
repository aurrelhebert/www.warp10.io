---
title: "->MAT"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Converts nested lists of numbers into a Matrix"
categoryTree: ["reference","functions"]
category: "reference"
signature: "[lo] [l1] ... [ln] ->MAT Matrix"
---

The `->MAT` function converts nested lists of numbers (2D array with same number of columns) into a Matrix. 

```
[lo] [l1] ... [ln] ->MAT Matrix
```

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Create List containing number and boolean values
[ [ 42 41 40 42.42 ] [ 42 41 40 0.2 ] [ 42 41 40 42.42 ] ]

// Convert lists to Matrix
->MAT

</warp10-warpscript-widget>
{% endraw %}   