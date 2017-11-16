---
title: "COS"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Calculate the cosine"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","800-function_COS.html.md"]
category: "reference"
---
 

The `COS` function consumes a floating point number from the top of the stack and pushes back its cosine.

The parameter is considered to be in radians.

## Example ##

Initial stack:

    TOP: 4.2


WarpScript commands:

    COS

Stack: 

    TOP: -0.4902608213406994

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">4.2 
COS
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">0 COS 
1 == ASSERT
pi COS 
-1 == ASSERT
pi 2 / COS
1e-15 < ASSERT // Avec current precision we get cos(pi/2) == 6.123233995736766e-17
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
