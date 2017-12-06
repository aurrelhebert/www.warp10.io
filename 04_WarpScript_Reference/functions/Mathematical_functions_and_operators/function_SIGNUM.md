---
title: "SIGNUM"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Return the signum of a number"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","701-function_SIGNUM.html.md"]
category: "reference"
---
 

The `SIGNUM` function consumes a numeric parameter from the top of the stack and pushes back its signum, i.e. it returns -1 if the parameter is negative, 1 if positive and 0 if it is 0.


## Example ##

Initial stack:

    TOP: 42


WarpScript commands:

    SIGNUM

Stack: 

    TOP: 1

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42 
SIGNUM
-42
SIGNUM
0
SIGNUM
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42 
SIGNUM
1 == ASSERT
-42
SIGNUM
-1 == ASSERT
0
SIGNUM
0 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
