---
title: "NOW"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Push on the stack the current time in microseconds since the Unix Epoch"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","10-constants","100-function_NOW.html.md"]
category: "reference"
---
 

The `NOW` functions pushes onto the stack the current time in microseconds s since the Unix Epoch.

## Example ##

WarpScript commands:
    
    42 
    NOW


Response stack:

    
    TOP: 1381227598000000
    1:   42


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42
NOW
</warp10-warpscript-widget>
{% endraw %}    
