---
title: "DTW"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Computes similarity between two Geo Time Series using Dynamic Time Warping."
categoryTree: ["reference","functions"]
category: "reference"
---
 
The `DTW` function computes similarity between two Geo Time Series by using the [Dynamic Time Warping](https://en.wikipedia.org/wiki/Dynamic_time_warping) algorithm.

The function expects three parameters on the stack. A threshold (a DOUBLE) and the two Geo Time Series for which to compute the similarity.

The threshold is used to abort the Dynamic Time Warping algorithm if the computed distance can no longer be lower than this threshold. To pursue the Dynamic Time Warping algorithm until the end, use 0.0 as the value of the threshold.

The function leaves on the stack the computed similarity or -1 if the algorithm was aborted due to the threshold.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
//
// Compute the DTW distance with no threshold
//
NEWGTS 1 360 <% DUP 360.0 / 2 PI * * SIN NaN NaN NaN 4 ROLL ADDVALUE %> FOR
NEWGTS 1 360 <% DUP 360.0 / 2 PI * * COS NaN NaN NaN 4 ROLL ADDVALUE %> FOR
0.0
DTW

//
// Now do the same with 13 as the threshold (the computed distance is ~14.1)
//
NEWGTS 1 360 <% DUP 360.0 / 2 PI * * SIN NaN NaN NaN 4 ROLL ADDVALUE %> FOR
NEWGTS 1 360 <% DUP 360.0 / 2 PI * * COS NaN NaN NaN 4 ROLL ADDVALUE %> FOR
13.0
DTW
</warp10-warpscript-widget>
{% endraw %}        
