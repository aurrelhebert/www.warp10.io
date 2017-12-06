---
title: "->VEC"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Converts a list of numbers into a Vector"
categoryTree: ["reference","functions"]
category: "reference"
signature: "[values] ->VEC Vector"
---

The `->VEC` function converts a list of numbers into a Vector. 

```
[values] ->VEC Vector
```

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Create List containing number and boolean values
[ 42 41 40 42.42 ]

// Convert List to Vector
->VEC

</warp10-warpscript-widget>
{% endraw %}   