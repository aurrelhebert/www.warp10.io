---
title: "mapper.product"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Return the product of the values"
categoryTree: ["reference","frameworks"]
category: "reference"
---
 

This *mapper* function computes the product of all the values found in the sliding window.

The `mapper.product` function can only be applied to values of type **LONG** or **DOUBLE**, it will produce no value for types **STRING** and **BOOLEAN**.

## Example ##

Stack:

    TOP:  {"c":"","l":{},"a":{},"v":[[100,1],[200,2],[300,3],[400,4],[500,5],[600,6],[700,7],[800,8],[900,9],[1000,10]]}

WarpScript commands:

    // arguments are: GTS or [GTS], mapper, prewindow, postwindow, occurences
    [ SWAP mapper.product 1 1 0 ] MAP

Stack: 

    TOP: [{"c":"","l":{},"a":{},"v":[[100,2],[200,6],[300,24],[400,60],[500,120],[600,210],[700,336],[800,504],[900,720],[1000,90]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS 1 10 <% 'i' STORE $i 100 * NaN NaN NaN $i ADDVALUE %> FOR
[ SWAP mapper.product 1 1 0 ] MAP
</warp10-warpscript-widget>
{% endraw %}    
