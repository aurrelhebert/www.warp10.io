---
title: "V->"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Convert the set on top of the stack into a list"
categoryTree: ["reference","functions"]
category: "reference"
signature: "[set] ->V List"
---

The `V->` function converts the set (needed for PIG) on top of the stack into a list. 

```
[set] ->V List
```

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Create List containing number and boolean values
[ 42 41 40 42.42 ]

// Convert list to set
->V

// Convert set to list
V->

</warp10-warpscript-widget>
{% endraw %}   