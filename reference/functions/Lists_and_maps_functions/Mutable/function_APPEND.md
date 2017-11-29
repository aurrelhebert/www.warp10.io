---
title: "APPEND"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Append a LIST or MAP to another"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","20-lists-and-maps","40-function_APPEND.html.md"]
category: "reference"
---
 

The *APPEND* function appends the LIST or MAP on top of the stack to the one just below.

## Example ##

Stack:

    TOP:  ["d","e"]
    1:    ["a","b","c"]

WarpScript commands:

    APPEND

Stack:

    TOP: ["a","b","c","d","e"]

On a LIST:

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[ 'a' 'b' 'c' ]
[ 'd' 'e' ]
APPEND
</warp10-warpscript-widget>
{% endraw %}

On a MAP:

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">{ 'a' 'aa'
'b' 'bb'
'c' 'cc' }
{ 'd' 'dd'
'e' 'ee' }
APPEND
</warp10-warpscript-widget>
{% endraw %}

## Unit tests ##

On a LIST:

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[ 'a' 'b' 'c' ]
[ 'd' 'e' ]
APPEND
LIST-> DROP   // Extract the elements of the LIST and drop its size
'e' == ASSERT   'd' == ASSERT   'c' == ASSERT   'b' == ASSERT   'a' == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}

On a MAP:

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">{ 'a' 'aa'
'b' 'bb'
'c' 'cc' }
{ 'd' 'dd'
'e' 'ee' }
APPEND
MAP-> DROP    // Extract the elements of the MAP and drop its size
'ee' == ASSERT   'e' == ASSERT   'dd' == ASSERT   'd' == ASSERT   
'cc' == ASSERT   'c' == ASSERT   'bb' == ASSERT   'b' == ASSERT   
'aa' == ASSERT   'a' == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}
