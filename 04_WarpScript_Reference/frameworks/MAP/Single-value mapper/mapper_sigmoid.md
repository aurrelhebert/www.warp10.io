---
title: "mapper.sigmoid"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Return the sigmoid of the single value in a sliding window"
categoryTree: ["reference","frameworks","framework-map"]
category: "reference"
---
 

This *mapper* function returns the [sigmoid](https://en.wikipedia.org/wiki/Sigmoid_function) of **single value** in a sliding window.

The `mapper.sigmoid` function can be applied to data of type **LONG** or **DOUBLE**.


## Example ##

Stack:

    TOP:  {"c":"","l":{},"a":{},"v":[[100,1],[200,2],[300,3],[400,4],[500,5],[600,6],[700,7],[800,8],[900,9],[1000,10]]}

WarpScript commands:

    // arguments are: GTS or [GTS], mapper, prewindow, postwindow, occurences
    [ SWAP mapper.sigmoid 0 0 0 ] MAP

Stack: 

    TOP: [{"c":"","l":{},"a":{},"v":[[100,0.7310585786300049],[200,0.8807970779778823],[300,0.9525741268224334],[400,0.9820137900379085],[500,0.9933071490757153],[600,0.9975273768433653],[700,0.9990889488055994],[800,0.9996646498695336],[900,0.9998766054240137],[1000,0.9999546021312976]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS 1 10 <% 'i' STORE $i 100 * NaN NaN NaN $i ADDVALUE %> FOR
[ SWAP mapper.sigmoid 0 0 0 ] MAP
</warp10-warpscript-widget>
{% endraw %}    
