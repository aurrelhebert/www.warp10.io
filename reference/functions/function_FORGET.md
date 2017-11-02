---
title: "FORGET"
layout: "function"
description: "Removes a symbol from the symbol table"
isPage: "true"
categoryTree: ["reference","functions"]
category: "reference"
---


The `FORGET` function removes the symbol name on top of the stack from the symbol table.

## Example ##


WarpScript commands:

    42
    'myVariable'
    STORE
    'myVariable'
    FORGET
    'myVariable'
    DEFINED

Stack:

    TOP:  false

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
42
'myVariable'
STORE
'myVariable'
FORGET
'myVariable'
DEFINED
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
42
'myVariable'
STORE
'myVariable'
FORGET
'myVariable'
DEFINED
false == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}            
