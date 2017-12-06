---
title: "CLEAR"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Remove all elements from the stack"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","40-stack-manipulation","100-function_CLEAR.html.md"]
category: "reference"
---
 

The `CLEAR` function empties the stack.

## Example ##

Initial stack:

    TOP: hello
    1: world

WarpScript commands:

    CLEAR

Stack:

    TOP:

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'foo'
'bar'
42
CLEAR
</warp10-warpscript-widget>
{% endraw %}    
    
