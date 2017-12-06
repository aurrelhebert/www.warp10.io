---
title: "ASSERT"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Halt execution of the script if the top of the stack is not the BOOLEAN true"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","30-logic-structures","16-function_ASSERT.html.md"]
category: "reference"
---
 

The `ASSERT` function consumes a boolean parameter from the top of the stack. If it is *true*, the execution of the WarpScript script continuates, else it stops the execution of the WarpScript scripts by throwing an exception.

`ASSERT` is usually used in WarpScript unit tests.


## Example ##

Stack:

    
    TOP: true

WarpScript commands:
    
    ASSERT

Stack:

    
    TOP: 

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">true
ASSERT
</warp10-warpscript-widget>
{% endraw %}

  
