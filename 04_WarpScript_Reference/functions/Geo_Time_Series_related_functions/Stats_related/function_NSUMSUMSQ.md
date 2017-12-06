---
title: "NSUMSUMSQ"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Computes the cardinality, sum of values and sum of squared values of a Geo Time Series."
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","870-function_MUSIGMA.html.md"]
category: "reference"
---
 
Computes the cardinality, sum of values and sum of squared values of a Geo Time Series. Pushes those results on the stack in the order they were mentioned.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Create a new GTS with five values 
NEWGTS 
100  NaN NaN NaN 10 ADDVALUE
200  NaN NaN NaN  9 ADDVALUE
300  NaN NaN NaN  8 ADDVALUE
400  NaN NaN NaN  7 ADDVALUE
500  NaN NaN NaN  6 ADDVALUE

NSUMSUMSQ
</warp10-warpscript-widget>
{% endraw %}    
