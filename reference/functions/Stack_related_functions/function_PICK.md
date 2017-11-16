---
title: "PICK"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Copies onto the top of the stack the n-th element of the stack"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","40-stack-manipulation","600-function_PICK.html.md"]
category: "reference"
---
 

The `PICK` function copies on top of the stack the element at level *N*. Parameter *N* is consumed off the top of the stack when `PICK` is called.

## Example ##

Stack:

    
    TOP: 'a'
    1:   'b'
    2:   'c'
    3:   'd'
    4:   'e'

WarpScript commands:
    
    2
    PICK

Stack:

    
    TOP: 'b'
    1:   'a'
    2:   'b'
    3:   'c'
    4:   'd'
    5:   'e'


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'d' 'c' 'b' 'a'
2 PICK
</warp10-warpscript-widget>
{% endraw %}


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'d' 'c' 'b' 'a'
2 PICK
'b' == ASSERT   'a' == ASSERT   'b' == ASSERT
'c' == ASSERT   'd' == ASSERT 
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}   
