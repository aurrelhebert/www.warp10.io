---
title: "BOOTSTRAP"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Function executed before the WarpScript stack becomes available."
categoryTree: ["reference","functions"]
category: "reference"
---
 
This function is executed systematically before the WarpScript stack is available for anything else. By default this function does nothing, it is equivalent to `NOOP`.

If bootstrap code was specified in the Warp 10 platform configuration, for either or all of `egress`, `mobius` or `runner`, the `BOOTSTRAP` function might have been redefined and actual code could be executed.

This function is not meant to be used in user provided scripts.
