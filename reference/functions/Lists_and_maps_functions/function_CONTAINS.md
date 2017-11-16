---
title: "CONTAINS"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Check if an element is in a LIST"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","20-lists-and-maps","50-function_CONTAINS.html.md"]
category: "reference"
---
 

The `CONTAINS` function checks if the element on top of the stack is contained by the list on second position.
A boolean is pushed on the stack.

Initial stack:

    TOP:  ['foo' 'bar' 'cool']
    1:    'bar'
    
WarpScript commands:

    CONTAINS

Stack:

    TOP: true
    1:   ['foo','cool']

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[ 'foo' 'bar' 'cool' ]
'bar' CONTAINS
</warp10-warpscript-widget>
{% endraw %}

## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[ 'foo' 'bar' 'cool' ]
'bar' CONTAINS
true == ASSERT
'yeah' CONTAINS
false == ASSERT
DROP
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}
