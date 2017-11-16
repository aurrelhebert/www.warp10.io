---
title: "<<"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Left shifting of bit pattern."
categoryTree: ["reference","functions"]
category: "reference"
---
 
Shifts the bits of a long by a number of positions to the left. The least significant bit is filled with 0 after each shift.

The function expects the number of positions on top of the stack and the long to shift below it.

## Example ##

<warp10-warpscript-widget>2 1 <<
-2 1 <<
</warp10-warpscript-widget>    
