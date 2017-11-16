---
title: "TOSTRING"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Convert the argument to string"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","750-function_TOSTRING.html.md"]
category: "reference"
---
 

The `TOSTRING` function consumes a parameter (string, boolean, number) from the top of the stack and pushes back its conversion to string.


## Example ##

WarpScript commands:

    42
    TOSTRING
    3.14
    TOSTRING
    true
    TOSTRING

Stack: 

    TOP: "true"
    1:   "3.14"
    2:   "42"

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42
TOSTRING
3.14
TOSTRING
true
TOSTRING
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42
TOSTRING
3.14
TOSTRING
true
TOSTRING
'true' == ASSERT
'3.14' == ASSERT
'42' == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
