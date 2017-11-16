---
title: "mapper.dotproduct"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Return the dotproduct of the values with a given LIST"
categoryTree: ["reference","frameworks"]
category: "reference"
---
 

The `mapper.dotproduct` function consumes a vector as parameter (a LIST of DOUBLE) from the top of the stack.

The resulting mapper computes the dot product of the given vector with the values of the sliding window.

If the sliding window at a tick does not have the same size as the given vector, then no value is produced.

The resulting mapper can only be applied to values of type **LONG** or **DOUBLE**, it will produce no value for types **STRING** and **BOOLEAN**.

## Example ##

Stack:

    TOP:  {"c":"","l":{},"a":{},"v":[[100,1],[200,2],[300,3],[400,4],[500,5],[600,6],[700,7],[800,8],[900,9],[1000,10]]}

WarpScript commands:

    // arguments are: GTS or [GTS], mapper, prewindow, postwindow, occurences
    [ SWAP [ 1.0 0.1 ] mapper.dotproduct 1 0 0 ] MAP

Stack: 

    TOP:  [{"c":"","l":{},"a":{},"v":[[200,1.2],[300,2.3],[400,3.4],[500,4.5],[600,5.6],[700,6.7],[800,7.8],[900,8.9],[1000,10]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS 1 10 <% 'i' STORE $i 100 * NaN NaN NaN $i ADDVALUE %> FOR
[ SWAP [ 1.0 0.1 ] mapper.dotproduct 1 0 0 ] MAP
</warp10-warpscript-widget>
{% endraw %}    
