---
title: "UNLIST"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Push onto the stack all elements of the list on top of a Mark."
categoryTree: ["reference","functions"]
category: "reference"
signature: "[values] UNLIST value0 ... valueN"
---

The `UNLIST` function pushes onto the stack a Mark and all elements of the parameter list. The last value contained in the list is the one on top of the stack after the `UNLIST` execution.

*If the top of the stack is not a list, do nothing.*

```
[values] UNLIST MARK value0 ... valueN
```

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Create List containing values
[ 42 41 40 ]

// Apply UNLIST
UNLIST
</warp10-warpscript-widget>
{% endraw %}   