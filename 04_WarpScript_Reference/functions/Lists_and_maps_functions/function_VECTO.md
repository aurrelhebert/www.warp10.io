---
title: "VEC->"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Converts a Vector into a list"
categoryTree: ["reference","functions"]
category: "reference"
signature: "Vector VEC-> [values] "
---

The `VEC->` function converts a Vector into a list. 

```
Vector VEC-> [values] 
```

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Create List containing number and boolean values
[ 42 41 40 42.42 ]

// Convert list to Vector
->VEC

// Convert Vector to list
VEC->

</warp10-warpscript-widget>
{% endraw %}   