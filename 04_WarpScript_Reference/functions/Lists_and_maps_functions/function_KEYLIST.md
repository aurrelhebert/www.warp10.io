---
title: "KEYLIST"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Extract the keys of a MAP"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","20-lists-and-maps","70-function_KEYLIST.html.md"]
category: "reference"
---
 

The function `KEYLIST` extracts the keys of a map on the top of the stack and pushes on the stack a list with those keys.
The map is consumed.


## Example ##


WarpScript commands:

    { 'foo' 42 'bar' true }
    KEYLIST

Stack:

    TOP: ['foo', 'bar']


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">{ 'foo' 42 'bar' true }
KEYLIST
</warp10-warpscript-widget>
{% endraw %}

## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">{ 'foo' 42 'bar' true }
KEYLIST
LIST-> DROP       //Expand list and drop list size
'bar' == ASSERT
'foo' == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}
