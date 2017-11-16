---
title: "UNIQUE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Eliminates duplicate elements on a LIST"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","20-lists-and-maps","900-function_UNIQUE.html.md"]
category: "reference"
---
 

The `UNIQUE` functions eliminates duplicate elements on the LIST on the top of the stack.
The order of the resulting LIST is not the same than the original one.


## Example ##


WarpScript commands:

    [ 'foo' 42 'bar' true 'foo' 57 42 'code' true false ]
    UNIQUE

Stack:

    TOP: ["bar","code",false,"foo",57,42,true]

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[ 'foo' 42 'bar' true 'foo' 57 42 'code' true false ]
UNIQUE
</warp10-warpscript-widget>
{% endraw %}

## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[ 'foo' 42 'bar' true 'foo' 57 42 'code' true false ]
UNIQUE
SIZE 7 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}
