---
title: "LASTSORT"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Sorts a list of Geo Time Series according to their most recent value."
category: "reference"
categoryTree: ["reference","functions"]
---
 
Sorts a list of Geo Time Series according to their most recent value. If most recent values are identical, ticks will be compared, the most recent appearing first. If the ticks are also identical, then metadata (class and labels) will be compared.

Use this function to compute *Top N* queries.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS 'gts-0' RENAME
0 NaN NaN NaN 0 ADDVALUE
1 NaN NaN NaN 1 ADDVALUE
2 NaN NaN NaN 2 ADDVALUE
3 NaN NaN NaN 3 ADDVALUE

NEWGTS 'gts-1' RENAME
10 NaN NaN NaN 1 ADDVALUE
30 NaN NaN NaN 3 ADDVALUE

NEWGTS 'gts-2' RENAME
100 NaN NaN NaN 0 ADDVALUE
300 NaN NaN NaN 3 ADDVALUE

3 ->LIST

LASTSORT
</warp10-warpscript-widget>
{% endraw %}    
