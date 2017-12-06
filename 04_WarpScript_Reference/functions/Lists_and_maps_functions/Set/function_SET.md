---
title: "SET"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Replace an element in a list"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","20-lists-and-maps","30-function_SET.html.md"]
category: "reference"
---
 

The `SET` function takes three parameters from the top of the stack: an index *i*, an element to insert *elem* and a list *l*. It replaces the element at the *i*<sup>th</sup> position of *l* with *elem*.

If index is greater or equal to the size of the list, then it will raise an error.


## Example ##


WarpScript commands:

    [ 'foo' 'bar' ]
    'cool'
    1
    SET

Stack:

    TOP: ["foo","cool"]


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[ 'foo' 'bar' ]
'cool'
1 
SET
</warp10-warpscript-widget>
{% endraw %}
