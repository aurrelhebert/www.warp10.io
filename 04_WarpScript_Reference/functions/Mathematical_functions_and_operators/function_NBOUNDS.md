---
title: "NBOUNDS"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Pushes a list of n-1 bounds defining n intervals with equal area under the bell cureve N(mu,sigma)."
categoryTree: ["reference","functions"]
category: "reference"
---
 
Pushes a list of n-1 bounds defining n intervals with equal area under the bell cureve N(mu,sigma). This is used jointly with [QUANTIZE](function_QUANTIZE) to quantify a Geo Time Series.

The function `NBOUNDS` expects the following parameters:

      2: mu
      1: sigma 
    TOP: n

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">0.0
1.0
10
NBOUNDS
</warp10-warpscript-widget>
{% endraw %}

