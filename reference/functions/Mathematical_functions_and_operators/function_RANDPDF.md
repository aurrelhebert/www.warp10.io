---
title: "RANDPDF"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Pushes on the stack a function which emits values according to a provided value histogram."
categoryTree: ["reference","functions"]
category: "reference"
---
 
Pushes on the stack a function which emits values according to a provided value histogram.

The `RANDPDF` function expects the value histogram on top of the stack. The value histogram is a map whose keys are the values and the elements the cardinality at which they occur or their occurrence probability.

The result if a function pushed onto the stack. This function does not have any arguments.

To use the function pushed by `RANDPDF` onto the stack, use `EVAL`.

## Example ##

<warp10-warpscript-widget>{ 0 2 1 1 2 1 } RANDPDF 'p' STORE
$p EVAL
$p EVAL
$p EVAL
$p EVAL
</warp10-warpscript-widget>    
