---
title: "LIST->"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Extract the elements of a LIST"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","20-lists-and-maps","11-function_LISTTO.html.md"]
category: "reference"
---
 

The `LIST->` function extracts the elements of the LIST at the top of the stack and pushes them onto the stack one by one. The function then pushes onto the stack the number of elements that were in the LIST.


## Example ##

Initial stack:

    TOP: ['a' 'b' 'c']

WarpScript commands:

    LIST->

Stack:

    TOP: 3
    1:   c
    2:   b
    3:   a

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[ 'a' 'b' 'c' ]
LIST->
</warp10-warpscript-widget>
{% endraw %}
