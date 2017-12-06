---
title: "IEEEREMAINDER"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "For parameters 'f1' and 'f2', it calculates the remainder when 'f1' is divided by 'f2"
categoryTree: ["reference","functions"]
category: "reference"
---
 
 

The `IEEEREMAINDER` function consumes two parameters, a dividend *f1* and a divisor *f2*.
This function push the remainder onto the stack as prescribed by the [IEEE 754 standard](https://en.wikipedia.org/wiki/IEEE_754-1985).

The two parameters must be of numeric types.

## Example ##

WarpScript commands:

    9.0 5.0
    IEEEREMAINDER

Stack: 

    TOP: -1

<warp10-warpscript-widget>9.0 5.0
IEEEREMAINDER
</warp10-warpscript-widget>    


## Unit test ##

<warp10-warpscript-widget>9.0 5.0
IEEEREMAINDER 
-1 == ASSERT
'unit test successful'
</warp10-warpscript-widget>        
