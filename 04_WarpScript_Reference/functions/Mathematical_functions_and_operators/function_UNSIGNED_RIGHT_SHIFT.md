---
title: ">>>"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Unsigned right bit shift, setting the most significant bit to 0."
categoryTree: ["reference","functions"]
category: "reference"
---
 
Shifts the bits of a long by a number of positions to the right. The most significant bit after each shift is set to 0, regardless of the sign of the unshifted long.

The function expects the number of positions on top of the stack and the long to shift below it.

## Example ##

<warp10-warpscript-widget>2 1 >>>
-2 1 >>>
</warp10-warpscript-widget>    
