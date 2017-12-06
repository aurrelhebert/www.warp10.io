---
title: "GET"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Retrieve a value in a MAP or in a LIST"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","20-lists-and-maps","30-function_GET.html.md"]
category: "reference"
---
 

The function `GET` retrieve a value in a MAP or in a LIST.

It takes the top item in the stack and uses it as key (or index) to look for the value on the MAP (or on the LIST) in the second position on the stack.


## Example ##


WarpScript commands:

    { 'foo' 42 'bar' true }
    'foo'
    GET

Stack:

    TOP: 42
    1:   {'foo': 42, 'bar': true}

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">{ 'foo' 42 'bar' true }
'foo' 
GET
</warp10-warpscript-widget>
{% endraw %}
