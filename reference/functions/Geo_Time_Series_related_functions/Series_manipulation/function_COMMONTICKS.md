---
title: "COMMONTICKS"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
categoryTree: ["reference","functions"]
desc: "Modifies Geo Time Series so they all have the same ticks, the set of ticks common to all input Geo Time Series."
category: "reference"
---
 
Modifies Geo Time Series so they all have the same ticks, the set of ticks common to all input Geo Time Series.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS 'gts-0' RENAME
0 NaN NaN NaN 0 ADDVALUE
1 NaN NaN NaN 1 ADDVALUE
2 NaN NaN NaN 2 ADDVALUE
3 NaN NaN NaN 3 ADDVALUE
4 NaN NaN NaN 4 ADDVALUE

NEWGTS 'gts-1' RENAME
1 NaN NaN NaN 1 ADDVALUE
3 NaN NaN NaN 3 ADDVALUE

NEWGTS 'gts-2' RENAME
0 NaN NaN NaN 0 ADDVALUE
3 NaN NaN NaN 3 ADDVALUE

3 ->LIST

DUP

COMMONTICKS
</warp10-warpscript-widget>
{% endraw %}    
