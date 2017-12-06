---
title: "MAP->"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","20-lists-and-maps","21-function_MAPTO.html.md"]
category: "reference"
---
 

The *MAP->* function expands the MAP on top of the stack into pairs of elements followed by the number of elements extracted. If the MAP was created by a call to *->MAP*, the order of the elements will be the same as prior to calling *->MAP*.

 ## Example ##

Initial stack:

    TOP: {'foo': 42, 'bar': true}

WarpScript commands:

    MAP->

Stack:

    TOP: 4
    1:   true
    2:   'bar'
    3:   42
    4:   'foo'


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">{ 'foo' 42 'bar' true }
MAP-> 
</warp10-warpscript-widget>
{% endraw %}
