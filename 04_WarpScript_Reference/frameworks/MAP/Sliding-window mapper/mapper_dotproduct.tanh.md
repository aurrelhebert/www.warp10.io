---
title: "mapper.dotproduct.tanh"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Return the dotproduct of the values with a given LIST"
categoryTree: ["reference","frameworks"]
category: "reference"
---
 

The `mapper.dotproduct.tanh` function consumes a vector as parameter (a LIST of DOUBLE) from the top of the stack.

The resulting mapper computes the dot product of the given vector with the values of the sliding window, then it returns the ([hyperbolic tangent](https://en.wikipedia.org/wiki/Hyperbolic_function) of this result.

If the sliding window at a tick does not have the same size as the given vector, then no value is produced.

The resulting mapper can only be applied to values of type **LONG** or **DOUBLE**, it will produce no value for types **STRING** and **BOOLEAN**.

## Example ##

Stack:

    TOP:  {"c":"","l":{},"a":{},"v":[[100,1],[200,2],[300,3],[400,4],[500,5],[600,6],[700,7],[800,8],[900,9],[1000,10]]}

WarpScript commands:

    // arguments are: GTS or [GTS], mapper, prewindow, postwindow, occurences
    [ SWAP [ 1.0 0.1 ] mapper.dotproduct.tanh 1 0 0 ] MAP

Stack: 

    TOP:  [{"c":"","l":{},"a":{},"v":[[200,0.8336546070121552],[300,0.9800963962661914],[400,0.9977749279342794],[500,0.9997532108480275],[600,0.9999726519818308],[700,0.999996969716367],[800,0.9999996642345503],[900,0.9999999627961221],[1000,0.9999999958776927]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS 1 10 <% 'i' STORE $i 100 * NaN NaN NaN $i ADDVALUE %> FOR
[ SWAP [ 1.0 0.1 ] mapper.dotproduct.tanh 1 0 0 ] MAP
</warp10-warpscript-widget>
{% endraw %}    
