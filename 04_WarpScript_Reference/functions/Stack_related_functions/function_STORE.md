---
title: "STORE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Store the element below the top of the stack under the symbol name on top of the stack"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","30-logic-structures","15-function_STORE.html.md"]
category: "reference"
---
 

The `STORE` function stores the element below the top of the stack under the symbol name on top of the stack. The stored symbol can later be pushed onto the top of the stack by invoking `$symbol`.

## Example ##

Stack:


    TOP:  'foo'
    1:    42

WarpScript commands:

    STORE

Stack:

    TOP:  


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42 'foo' STORE
'Now we have a variable $foo'
'With a value of 42'
$foo
$foo
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42 'foo' STORE
$foo
$foo
$foo
42 == ASSERT
42 == ASSERT
42 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}            

