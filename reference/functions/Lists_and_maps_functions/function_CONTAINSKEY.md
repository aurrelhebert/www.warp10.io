---
title: "CONTAINSKEY"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Check if an element is one of the keys of a MAP"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","20-lists-and-maps","50-function_CONTAINSKEY.html.md"]
category: "reference"
---
 

The `CONTAINSKEY` function checks if the `key` element on top of the stack is a key of the map on second position.
The `key` is consumed, and a boolean is pushed on the stack.


## Example ##

Initial stack:

    TOP: {'foo': 42, 'bar': true, 'cool': 'always'}
    1:   'bar'
    
WarpScript commands:

    CONTAINSKEY

Stack:

    TOP: true
    1:   {'foo': 42, 'bar': true, 'cool': 'always'}

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">{ 'foo' 42 'bar' true 'cool' 'always' }
'bar' CONTAINSKEY
</warp10-warpscript-widget>
{% endraw %}

## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">{ 'foo' 42 'bar' true 'cool' 'always' }
'bar' CONTAINSKEY
true == ASSERT
'yeah'  CONTAINSKEY
false == ASSERT
DROP
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}


