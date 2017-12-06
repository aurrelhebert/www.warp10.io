---
title: "ISNULL"
layout: function
desc: "Checks whether the top of the stack is null."
isPage: "true"
link: "/warpscript/functions"
categoryTree: ["reference","functions"]
category: reference
---

The `ISNULL` function consumes a parameter *p* from the top of the stack and pushes onto the stack *true* if *p* is null, else it pushes *false*.

## Example ##

WarpScript commands:

    'String'
    ISNULL

    2.0
    ISNULL 
    
    NULL
    ISNULL

Stack: 

    TOP: true
    1: false
    2: false


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
'String'
ISNULL

2.0
ISNULL 

NULL
ISNULL
</warp10-warpscript-widget>
{% endraw %}  