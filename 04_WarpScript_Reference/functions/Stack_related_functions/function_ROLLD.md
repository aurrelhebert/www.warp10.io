---
title: "ROLLD"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Moves the element on top of the stack to the N-th position"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","40-stack-manipulation","503-function_ROLLD.html.md"]
category: "reference"
---
 

The `ROLLD` function moves the element on top of the stack at level *N*, moving up all elements above it. Parameter *N* is consumed off the top of the stack when `ROLLD` is called.

     6: 6
     5: 5
     4: 4
     3: 3
     2: 2
     1: 4

     ROLLD

     5: 6
     4: 2
     3: 5
     2: 4
     1: 3


## Example ##

Initial stack:

    TOP:  "a"
    1:    "b"
    2:    "c"
    3:    "d"


WarpScript commands:

    3 ROLLD

Stack: 

    TOP:  "b"
    1:    "c"
    2:    "a"
    3:    "d"


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'d' 'c' 'b' 'a' 
3 ROLLD
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'d' 'c' 'b' 'a' 
3 ROLLD
'b' == ASSERT   'c' == ASSERT
'a' == ASSERT   'd' == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}           
