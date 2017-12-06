---
title: "ROT"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Move the third element of the stack onto the top"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","40-stack-manipulation","501-function_ROT.html.md"]
category: "reference"
---
 

The `ROT` function moves the third element of the stack onto the top of the stack, moving the top two elements down one level.


## Example ##

Initial stack:

    TOP: 'a'
    1:   'b'
    2:   'c'
    3:   'd'


WarpScript commands:

    ROT

Stack: 

    TOP: 'c'
    1:   'a'
    2:   'b'
    3:   'd'


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'d' 'c' 'b' 'a' 
ROT
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'d' 'c' 'b' 'a' 
ROT
'c' == ASSERT   'a' == ASSERT
'b' == ASSERT   'd' == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
