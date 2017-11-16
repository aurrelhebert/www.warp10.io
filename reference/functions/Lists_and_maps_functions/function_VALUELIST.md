---
title: "VALUELIST"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Extract the values of a MAP"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","20-lists-and-maps","70-function_VALUELIST.html.md"]
category: "reference"
---
 

The function `VALUELIST` extracts the values of a MAP on the top of the stack and pushes on the stack a list with those values.
The MAP is consumed.


## Example ##


WarpScript commands:

    { 'foo' 42 'bar' true }
    VALUELIST

Stack:

    TOP: [42, true]

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">{ 'foo' 42 'bar' true }
VALUELIST
</warp10-warpscript-widget>
{% endraw %}

## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">{ 'foo' 42 'bar' true }
VALUELIST
LIST-> DROP       //Expand list and drop list size
true == ASSERT
42 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}
