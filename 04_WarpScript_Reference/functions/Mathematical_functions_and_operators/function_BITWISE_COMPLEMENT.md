---
title: "~"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Computes the unary bitwise complement of the long value on top of the stack."
categoryTree: ["reference","functions"]
category: "reference"
---
 
Computes the unary bitwise complement of the long value on top of the stack.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42 DUP ~
42 TOBIN
42 ~ TOBIN
</warp10-warpscript-widget>
{% endraw %}    
