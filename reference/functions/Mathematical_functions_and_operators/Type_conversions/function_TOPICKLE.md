---
title: "->PICKLE"
layout: function
isPage: "true"
link: "/warpscript/functions"
desc: "Converts the object on top of the stack to its PICKLE representation."
categoryTree: ["reference","functions"]
category: reference
---

The `->PICKLE` function converts the object on top of the stack to its [Pickle](https://en.wikipedia.org/wiki/Pickle_(Python)) representation as a byte array and pushes it on the stack.

The conversion is done using [Pyrolite](https://github.com/irmen/Pyrolite).

## Example ##
{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
{ 'PICKLE' 'STRING' }
->PICKLE
->HEX
</warp10-warpscript-widget>
{% endraw %}    
