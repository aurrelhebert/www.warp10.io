---
title: "DEPTH"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Push on the stack the depth of the stack"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","40-stack-manipulation","700-function_DEPTH.html.md"]
category: "reference"
---
 

The *DEPTH* function pushes on top of the stack the depth (*i.e.* number of levels) of the stack prior to the call.


## Example ##

Stack:

    
    TOP: 'a'
    1:   'b'
    2:   'c'
    3:   'd'
    4:   'e'

WarpScript commands:
    
    DEPTH

Stack:

    
    TOP: 5
    1:   'a'
    2:   'b'
    3:   'c'
    4:   'd'
    5:   'e'

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'d' 'c' 'b' 'a'
DEPTH
</warp10-warpscript-widget>
{% endraw %}


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'d' 'c' 'b' 'a'
DEPTH
4 == ASSERT   'a' == ASSERT   'b' == ASSERT
'c' == ASSERT   'd' == ASSERT 
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}       
