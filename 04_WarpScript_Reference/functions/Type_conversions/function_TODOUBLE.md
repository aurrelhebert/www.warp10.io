---
title: "TODOUBLE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Convert a number to double"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","750-function_TODOUBLE.html.md"]
category: "reference"
---
 

The `TODOUBLE` function consumes a parameter (string, boolean, number) from the top of the stack and pushes back its conversion to double, if it is possible.

The boolean *true* is converted to 1.0 and *false* to 0.0.  

When conversion is not possible (e.g. `'a' TODOUBLE`) we get an error.


## Example ##

WarpScript commands:

    '42'
    TODOUBLE
    '3.14'
    TODOUBLE
    true
    TODOUBLE

Stack: 

    TOP: 1.0
    1:   3.14
    2:   42.0


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'42'
TODOUBLE
'3.14'
TODOUBLE
true
TODOUBLE
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'42'
TODOUBLE
'3.14'
TODOUBLE
true
TODOUBLE
1 == ASSERT
3.14 == ASSERT
42 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
