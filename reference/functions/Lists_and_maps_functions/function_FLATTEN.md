---
title: "FLATTEN"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Flatten a LIST"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","20-lists-and-maps","25-function_FLATTEN.html.md"]
category: "reference"
---
 

The function `FLATTEN` inspects the top of the stack. If it is a LIST of values, it inspects each value and replaces each value which was a LIST with its content. `FLATTEN` proceed recursively until all LISTs have been flattened.


## Example ##

Initial stack:

    TOP: [['a','b','c'],['d','e', ['f', 'g']]]

WarpScript commands:

    FLATTEN

Stack:

    TOP: [true,"bar",42,"foo"]

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[ 'a' 'b' 'c' ]
[ 'd' 'e' [ 'f' 'g' ] ]
2 ->LIST
FLATTEN
</warp10-warpscript-widget>
{% endraw %}

## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[ 'a' 'b' 'c' ]
[ 'd' 'e' [ 'f' 'g' ] ]
2 ->LIST
FLATTEN
SIZE 7 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}
