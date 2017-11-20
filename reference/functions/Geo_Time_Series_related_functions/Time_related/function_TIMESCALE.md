---
title: "TIMESCALE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Modify ticks by multiplying them by a scaling factor."
categoryTree: ["reference","functions"]
category: "reference"
---
 
Modify ticks of Geo Time Series by multiplying them by a scaling factor.

The function expects the following elements on the stack:

      1: [ Geo Time Series ] or a single GTS
    TOP: scaling factor

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS
1 100
<% NaN NaN NaN 0 ADDVALUE %> FOR
DUP
5.0 TIMESCALE
</warp10-warpscript-widget>
{% endraw %}    
