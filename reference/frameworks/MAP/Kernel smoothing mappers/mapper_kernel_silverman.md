---
title: "mapper.kernel.silverman"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Push onto the stack a kernel smoothing mapper using a silverman kernel."
categoryTree: ["reference","frameworks","framework-map"]
category: "reference"
---
 
This function pushes onto the stack a [kernel smoothing](https://en.wikipedia.org/wiki/Kernel_smoother) mapper using a *silverman* [kernel](https://en.wikipedia.org/wiki/Kernel_(statistics)#In_non-parametric_statistics). The mapper applies the [Nadaraya-Watson kernel-weighted average](https://en.wikipedia.org/wiki/Kernel_regression#Nadaraya.E2.80.93Watson_kernel_regression) algorithm.

The function expects on top of the stack a bandwidth expressed as an odd number of ticks and below it a step expressed in time units. The `step` parameter is used to determine the distance of a tick from the tick being computed to feed it into the kernel. The bandwidth in time units is the bandwidth in ticks times the step.

## Example ##

{% raw %}
<warp10-warpscript-widget>//
// Create a random walk Geo Time Series
//

NEWGTS 'random walk' RENAME
0.0 'i' STORE
1 1000
<% NaN NaN NaN $i RAND 0.5 - + DUP 'i' STORE ADDVALUE %>
FOR
DUP

// Pseudo radius of the kernel (the kernel really has a diameter of 2 * radius + 1 steps)
8 'radius' STORE
// Number of time units per radius unit
1 'step' STORE

//
// Apply the MAP on a window which extends $radius ticks on both sides of the current tick
//
[ SWAP $step $radius 2 * 1 + mapper.kernel.silverman $radius $radius 0 ] MAP 0 GET
'%2B:smoothed' RENAME
</warp10-warpscript-widget>
{% endraw %}    
