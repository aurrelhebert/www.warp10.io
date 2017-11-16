---
title: "CLIP"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Clip a Geo Time Series according to a series of limits."
categoryTree: ["reference","functions"]
category: "reference"
---

The `CLIP` function clips a Geo Time Series according to a series of limits.
The limits is a list of pair containing the lower and upper timestamp to apply on the GTS.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Create a new GTS with 12  values separated by a day 
NEWGTS 
'test name'
RENAME
{ 'label0' '42' 'label1' 'foo' }
RELABEL

NOW 'now' STORE

// ADDS 12 values to the GTS separated by 1 day
0 11 
<% 'indice' STORE
$now  $indice d +  NaN NaN NaN  $indice ADDVALUE 
%> FOR
'gts' STORE

$now 4  d + 'nowPlus4'  STORE
$now 8  d + 'nowPlus8'  STORE
$now 12 d + 'nowPlus12' STORE

// CLIP this GTS
$gts
// CLIP with this LIMITS
[ [ $now  $nowPlus4 1 - ] [ $nowPlus4 $nowPlus8 1 - ] [ $nowPlus8 $nowPlus12 1 - ] ]
CLIP
</warp10-warpscript-widget>
{% endraw %}    
