---
title: "->LIST"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Creates a LIST with the top `N` elements of the stack"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","20-lists-and-maps","10-function_TOLIST.html.md"]
category: "reference"
---
 
The `->LIST` function creates a LIST with the top `N` elements of the stack, `N` being consumed off the top of the stack 
when `->LIST` is called. The element at the top of the stack will be last in the resulting LIST.

## Example ##

WarpScript commands:

    4 3 2
    3 ->LIST

Stack:

    TOP: [4 3 2]


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">4 3 2
3 ->LIST
// alternate syntax:
[ 4 3 2 ]
</warp10-warpscript-widget>
{% endraw %}    
