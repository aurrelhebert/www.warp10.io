---
title: "ASIN"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Calculate the arcsine"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","806-function_ASIN.html.md"]
category: "reference"
---
 

The `ASIN` function consumes a floating point number between -1 and 1 from the top of the stack and pushes back its arcsine in radians.


## Example ##

Initial stack:

    TOP: 0.42


WarpScript commands:

    ASIN

Stack: 

    TOP: 0.43344532006988595

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">0.42 
ASIN
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">0 ASIN 
0 == ASSERT 
1 ASIN 
pi 2 / == ASSERT   // ~ pi/2
-1 ASIN
pi 2 / -1 * == ASSERT   // ~ -pi/2
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
