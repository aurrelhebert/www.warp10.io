---
title: "->MAP"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Creates a MAP with the top `N` elements of the stack"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","20-lists-and-maps","20-function_TOMAP.html.md"]
category: "reference"
---


The `->MAP` function creates a MAP from an even number `N` of elements on the stack. `N` is consumed off the top of the stack. The deepest element of each pair is the key and should be a string, the shallowest is the value.


## Example ##


WarpScript commands:


    'foo' 42
    'bar' true
    4 ->MAP

Stack:

    TOP: {'foo': 42, 'bar': true}

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'foo' 42 'bar' true 4 ->MAP
// alternate syntax:
{ 'foo' 42 'bar' true }
</warp10-warpscript-widget>
{% endraw %}
