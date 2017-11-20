---
title: "QUANTIZE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Generates a quantified version of a Geo Time Series."
categoryTree: ["reference","functions"]
category: "reference"
---
 
Generates a quantified version of a Geo Time Series, replacing each value with the value from the array `values` which is at the same index as the interval in which the value falls given a set of `bounds`.

The function expects the following parameters on the stack:

      3: [ GTS ]
      2: [ bounds ]
      1: [ values ]
    TOP: n

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS
1 100
<% 'i' STORE $i NaN NaN NaN $i ADDVALUE %>
FOR
10 50 2 LBOUNDS
[ 'below' '1' '2' 'above' ]
QUANTIZE
</warp10-warpscript-widget>
{% endraw %}

