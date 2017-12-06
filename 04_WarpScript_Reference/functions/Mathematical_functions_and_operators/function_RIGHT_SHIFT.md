---
title: ">>"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Signed right bit shift."
categoryTree: ["reference","functions"]
category: "reference"
---
 
Shifts the bits of a long by a number of positions to the right. The most significant bit after shifting depends on the sign of the unshifted long.

The function expects the number of positions on top of the stack and the long to shift below it.

## Example ##

<warp10-warpscript-widget>2 1 >>
-2 1 >>
</warp10-warpscript-widget>    
