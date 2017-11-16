---
title: "->V"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Convert the list on top of the stack into a set"
categoryTree: ["reference","functions"]
category: "reference"
signature: "[values] ->V set"
---

The `->V` function converts a list of numbers into a set (needed for PIG). 

```
[values] ->V set
```

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Create List containing number and boolean values
[ 42 41 40 42.42 ]

// Convert list to set
->V

</warp10-warpscript-widget>
{% endraw %}   