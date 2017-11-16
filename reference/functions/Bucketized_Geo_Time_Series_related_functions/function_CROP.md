---
title: "CROP"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Rebucketize a Geo Time Series"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","60-bucketized-gts","620-function_CROP.html.md"]
category: "reference"
---
 

The `CROP` function works on bucketized Geo Time Series instances, if transforms a GTS into another one whose bucket parameters span the smallest interval with actual values.

When called on a non bucketized GTS instance, `CROP` simply clones it.

This function expects a list of GTS instances on the top of the stack.

