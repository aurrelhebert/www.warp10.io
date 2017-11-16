---
title: "ROLL"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Moves the N-th element of the stack onto the top"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","40-stack-manipulation","502-function_ROLL.html.md"]
category: "reference"
---
 

The `ROLL` function moves the *N*th element of the stack onto the top, pushing the top *N-1* elements down one level. Parameter *N* is consumed off the top of the stack when *ROLL* is called.

Calling `ROLL` with *N*=*3* is equivalent to calling [`ROT`]({{ site.baseurl}}/reference/functions/function_ROT).


## Example ##

Initial stack:

    TOP:  "a"
    1:    "b"
    2:    "c"
    3:    "d"


WarpScript commands:

    3 ROLL

Stack: 

    TOP:  "c"
    1:    "a"
    2:    "b"
    3:    "d"


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'d' 'c' 'b' 'a' 
3 ROLL
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'d' 'c' 'b' 'a' 
3 ROLL
'c' == ASSERT   'a' == ASSERT
'b' == ASSERT   'd' == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}      
