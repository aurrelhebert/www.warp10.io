---
title: "ISNaN"
layout: function
desc: "Checks whether a double is NaN."
isPage: "true"
link: "/warpscript/functions"
categoryTree: ["reference","functions"]
category: reference
---

The `ISNaN` function consumes a double parameter *p* from the top of the stack and pushes onto the stack *true* if *p* is Not a Number (NaN), else it pushes *false*.

## Example ##

WarpScript commands:

    2.0
    ISNaN 
    
    NaN
    ISNaN

Stack: 

    TOP: true
    1: false


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
2.0
ISNaN 

NaN
ISNaN
</warp10-warpscript-widget>
{% endraw %}    