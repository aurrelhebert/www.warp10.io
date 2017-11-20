---
title: "NEWGTS"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Push an empty Geo Time Series onto the stack"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","100-function_NEWGTS.html.md"]
category: "reference"
---
 

The `NEWGTS` function pushes onto the stack an empty GTS.


## Example ##

WarpScript commands:

    NEWGTS

Stack:

    TOP: {"c":"","l":{},"a":{},"v":[]}


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS
</warp10-warpscript-widget>
{% endraw %}    
