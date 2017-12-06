---
title: "PROBABILITY"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Pushes on the stack a function which computes probabilities according to a provided value histogram."
categoryTree: ["reference","functions"]
category: "reference"
---
 
Pushes on the stack a function which computes probabilities according to a provided value histogram.

The `PROBABILITY` function expects the value histogram on top of the stack. The value histogram is a map whose keys are the values and the elements the cardinality at which they occur or their occurrence probability.

The result if a function pushed onto the stack. This function expects a value on top of the stack and will output the probability of occurrence of this value.

To use the function pushed by `PROBABILITY` onto the stack, use `EVAL`.

## Example ##

<warp10-warpscript-widget>{ 0 0.5 1 0.25 2 0.25 } PROBABILITY 'p' STORE

1 $p EVAL
</warp10-warpscript-widget>    
