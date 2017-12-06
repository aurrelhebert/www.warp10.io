---
title: "[]"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Push an empty LIST on top of the stack"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","20-lists-and-maps","02-function_EMPTYLIST.html.md"]
category: "reference"
---
 

The `[]` function creates an empty LIST on the top of the stack.

## Example ##

WarpScript commands:

    []

Stack: 

    TOP: []

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[]
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[]
LIST-> 
0 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
