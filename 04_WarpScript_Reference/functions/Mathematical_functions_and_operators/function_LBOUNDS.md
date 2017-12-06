---
title: "LBOUNDS"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Pushes onto the stack a list of M+1 bounds defining M intervals between a and b plus the intervals before a and after b."
categoryTree: ["reference","functions"]
category: "reference"
---
 
Pushes onto the stack a list of M+1 bounds defining M intervals between a and b plus the intervals before a and after b. This is used jointly with [QUANTIZE](function_QUANTIZE) to quantify a Geo Time Series.

The function expects the following parameters on the stack:

      2: a
      1: b
    TOP: M

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">0
10
16
LBOUNDS
</warp10-warpscript-widget>
{% endraw %}

