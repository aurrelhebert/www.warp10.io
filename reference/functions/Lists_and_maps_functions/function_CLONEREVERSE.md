---
title: "CLONEREVERSE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Clone a LIST and reverse its order"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","20-lists-and-maps","80-function_CLONEREVERSE.html.md"]
category: "reference"
---
 

The function `REVERSE` reverses the order of the elements of the LIST on the top of the stack by copying the elements of the LIST in the reversed order on a new LIST instance.


## Example ##


WarpScript commands:

    [ 'foo' 42 'bar' true ]
    CLONEREVERSE

Stack:

    TOP: [true,"bar",42,"foo"]

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[ 'foo' 42 'bar' true ]
CLONEREVERSE
</warp10-warpscript-widget>
{% endraw %}

## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[ 'foo' 42 'bar' true ]
CLONEREVERSE
LIST-> DROP       //Expand LIST and drop LIST size
'foo' == ASSERT
42 == ASSERT
'bar' == ASSERT
true == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}

## TIPS ##

The [`REVERSE`]({{ site.baseurl}}/reference/functions/function_REVERSE) function reverses the LIST in place, i.e. it doesn't creates a new instace of the LIST.
The [`CLONEREVERSE`]({{ site.baseurl}}/reference/functions/function_CLONEREVERSE) reversing the LIST by creating a new instance.

To illustrate the difference:

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[ 'foo' 42 'bar' true ]
DUP
REVERSE
</warp10-warpscript-widget>
{% endraw %}

As [`DUP`] only creates a new reference to the same object, both positions of the stack are reversed when using `REVERSE`

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[ 'foo' 42 'bar' true ]
DUP
CLONEREVERSE
</warp10-warpscript-widget>
{% endraw %}

By using `CLONEREVERSE` we created a new instance, so the first LIST is not reversed.



