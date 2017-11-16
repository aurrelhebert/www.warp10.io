---
title: "mapper.tanh"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Return the hyperbolic tangent of the single value in a sliding window"
categoryTree: ["reference","frameworks","framework-map"]
category: "reference"
---
 

This *mapper* function returns the [hyperbolic tangent](https://en.wikipedia.org/wiki/Hyperbolic_function) of **single value** in a sliding window.

The `mapper.tanh` function can be applied to data of type **LONG** or **DOUBLE**.


## Example ##

Stack:

    TOP:  {"c":"","l":{},"a":{},"v":[[100,1],[200,2],[300,3],[400,4],[500,5],[600,6],[700,7],[800,8],[900,9],[1000,10]]}

WarpScript commands:

    // arguments are: GTS or [GTS], mapper, prewindow, postwindow, occurences
    [ SWAP mapper.tanh 0 0 0 ] MAP

Stack: 

    TOP: [{"c":"","l":{},"a":{},"v":[[100,0.7615941559557649],[200,0.9640275800758169],[300,0.9950547536867305],[400,0.999329299739067],[500,0.9999092042625951],[600,0.9999877116507956],[700,0.9999983369439447],[800,0.9999997749296758],[900,0.999999969540041],[1000,0.9999999958776927]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS 1 10 <% 'i' STORE $i 100 * NaN NaN NaN $i ADDVALUE %> FOR
[ SWAP mapper.tanh 0 0 0 ] MAP
</warp10-warpscript-widget>
{% endraw %}    
