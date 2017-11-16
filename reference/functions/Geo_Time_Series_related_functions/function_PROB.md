---
title: "PROB"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Computes the probability of each value in a Geo Time Series"
categoryTree: ["reference","functions"]
category: "reference"
---
 

The function `PROB` generates a new Geo Time Series from an input Geo Time Series by computing the probability of each value in the original series. The probabilities are computed using the value histogram.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS
0 NaN NaN NaN 1 ADDVALUE
1 NaN NaN NaN 1 ADDVALUE
2 NaN NaN NaN 1 ADDVALUE
3 NaN NaN NaN 2 ADDVALUE
4 NaN NaN NaN 2 ADDVALUE
5 NaN NaN NaN 3 ADDVALUE
6 NaN NaN NaN 4 ADDVALUE
PROB
</warp10-warpscript-widget>
{% endraw %}
