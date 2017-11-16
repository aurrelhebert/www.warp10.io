---
title: "DROP"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Remove the top element from the stack"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","40-stack-manipulation","400-function_DROP.html.md"]
category: "reference"
---
 

The `DROP` function removes the element at the top of the stack.

## Example ##

Initial stack:

    TOP: hello
    1:   world

WarpScript commands:

    DROP

Stack:

    TOP: hello

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'foo'
'bar'
DROP
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'foo'
'bar'
DROP
'foo' == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}    
