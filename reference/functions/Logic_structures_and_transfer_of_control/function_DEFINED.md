---
title: "DEFINED"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Check whether or not a symbol is defined"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","30-logic-structures","15-function_DEFINED.html.md"]
category: "reference"
---
 

The `DEFINED` function checks whether or not a symbol is defined.

WarpScript commands:
    
    42 'foo' STORE  // STORE value 42 under symbol 'foo'
    'foo' DEFINED
    'bar' DEFINED

Stack:

    
    TOP:  false
    1:    true

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42 'foo' STORE
'foo' DEFINED
'bar' DEFINED
</warp10-warpscript-widget>
{% endraw %}


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42 'foo' STORE
'foo' DEFINED
'bar' DEFINED
false == ASSERT
true  == ASSERT 
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}       
