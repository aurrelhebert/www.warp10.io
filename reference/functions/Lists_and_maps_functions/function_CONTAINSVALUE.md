---
title: "CONTAINSVALUE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Check if an element is one of the values of a MAP"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","20-lists-and-maps","50-function_CONTAINSVALUE.html.md"]
category: "reference"
---
 

The `CONTAINSVALUE` function checks if the `value` element on top of the stack is a value of the map on second position.
The `value` is consumed, and a boolean is pushed on the stack.


## Example ##

Initial stack:

    TOP: {'foo': 42, 'bar': true, 'cool': 'always'}
    1:   42
    
WarpScript commands:

    CONTAINSVALUE

Stack:

    TOP: true
    1:   {'foo': 42, 'bar': true, 'cool': 'always'}

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">{ 'foo' 42 'bar' true 'cool' 'always' }
42 CONTAINSVALUE
</warp10-warpscript-widget>
{% endraw %}

## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">{ 'foo' 42 'bar' true 'cool' 'always' }
42 CONTAINSVALUE
true == ASSERT
0 CONTAINSVALUE
false == ASSERT
DROP
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}
