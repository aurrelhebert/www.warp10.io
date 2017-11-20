---
title: "DWTSPLIT"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Split a Geo Time Series produced by FDWT into a set of series based on the resolution level."
categoryTree: ["reference","functions"]
category: "reference"
---
 
The `DWTSPLIT` function splits a Geo Time Series produced by [FDWT]({{ site.baseurl}}/reference/functions/function_FDWT) into multiple series, one per resolution level of the Wavelet transform.

The function expects a label name on top of the stack and will operate on the Geo Time Series below it.

The label name will be used in the generated series to indicate the level of each Geo Time Series.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS
1 512 <% 'i' STORE $i NaN NaN NaN $i 360.0 / 2 PI * * SIN $i 512.0 / 2 PI * * COS + ADDVALUE %> FOR
'db9'
FDWT
'level'
DWTSPLIT
</warp10-warpscript-widget>
{% endraw %}        
