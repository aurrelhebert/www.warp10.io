---
title: "REMOVE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Remove an entry from a LIST or MAP"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","20-lists-and-maps","40-function_REMOVE.html.md"]
category: "reference"
---
 

The `REMOVE` function removes an entry from a MAP or from a LIST. 

When using on a LIST,  it consumes the element on top of the stack as index *n* to remove the *n*th element of the LIST in the second position on the stack, then the removed element is pushed on the stack.

When using on a MAP,  it consumes the element on top of the stack as key to remove the corresponding key-value pair of the MAP in the second position on the stack, then the removed value is pushed on the stack.

## Example ##

Stack:

    TOP:  ["a","b","c"]

WarpScript commands:

    1
    REMOVE

Stack:

    TOP:  "b"
    1:    ["a","c"]

On a LIST:

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[ 'foo' 'bar' 'cool' ]
1 REMOVE
</warp10-warpscript-widget>
{% endraw %}

On a MAP:

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">{ 'label0' '42' 'label1' 'foo' 'label2' true }
'label1' REMOVE
</warp10-warpscript-widget>
{% endraw %}

## Unit tests ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[ 'foo' 'bar' 'cool' ]
1 REMOVE
'bar' == ASSERT
SIZE 2 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}

On a MAP:

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">{ 'label0' '42' 'label1' 'foo' 'label2' true }
'label1' REMOVE
'foo' == ASSERT
SIZE 2 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}
