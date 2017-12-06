---
title: "CBRT"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Calculate the cubic root"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","811-function_CBRT.html.md"]
category: "reference"
---
 

The `CBRT` function consumes a numeric parameter from the top of the stack and pushes back its cubic root.


## Example ##

Initial stack:

    TOP: 42


WarpScript commands:

    CBRT

Stack: 

    TOP: 3.4760266448864496

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42 
CBRT
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42 CBRT
3.4760266448864496 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
