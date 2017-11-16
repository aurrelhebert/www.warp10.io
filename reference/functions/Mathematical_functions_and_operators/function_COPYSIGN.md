---
title: "COPYSIGN"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Copies the sign of a number on another one."
categoryTree: ["reference","functions"]
category: "reference"
---
 
The `COPYSIGN` function copies the sign of a number on another one and pushes back the value.


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
10
-3
COPYSIGN

// expect -10 on the top the stack
DUP -10 == ASSERT
</warp10-warpscript-widget>
{% endraw %}    