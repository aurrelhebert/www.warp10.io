---
title: "PUT"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Insert a key-value pair into a MAP"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","20-lists-and-maps","30-function_PUT.html.md"]
category: "reference"
---
 

The `PUT` function consomes the two top elements of the stack and then it inserts them as a key-value pair into the MAP on top of the stack. 

## Example ##


WarpScript commands:

    { 'foo' 42 'bar' true }
    'newValue'
    'newKey'    
    PUT

Stack:    

    TOP: {'foo': 42, 'bar': true, 'newKey': 'newValue'}


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">{ 'foo' 42 'bar' true }
'newValue'
'newKey'
PUT
</warp10-warpscript-widget>
{% endraw %}    
