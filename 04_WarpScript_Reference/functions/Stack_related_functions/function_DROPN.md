---
title: "DROPN"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Remove the N top elements from the stack"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","40-stack-manipulation","400-function_DROPN.html.md"]
category: "reference"
---
 

The `DROPN` function removes the top `N` elements of the stack after having consumed `N` which was on the top of the stack prior to calling `DROPN`.

Initial stack:

    TOP: foo
    1:   bar
    2:   foobar
    3:   2

WarpScript commands:

    DROPN

Stack:

    TOP: foo

## Tips ##

Calling `1 DROPN` is equivalent to calling the [`DROP`]({{ site.baseurl}}/reference/functions/function_DROP) function. Calling `0 DROPN` does nothing.

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'foo'
'bar'
'foobar'
2 DROPN
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'foo'
'bar'
'foobar'
2 DROPN
'foo' == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}       
