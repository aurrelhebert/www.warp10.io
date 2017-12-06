---
title: "SORT"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Sort a Geo Time Series by ascending timestamps"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","400-function_SORT.html.md"]
category: "reference"
---
 

The function `SORT` takes the GTS on top of the stack and sort its values (and associated locations/elevations) by order of their ticks (i.e. in chronological order, the older ticks first).


## Example ##

Initial stack:

    TOP: {"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[1200,9],[500,6],[1500,6],[1100,10],[300,8],[1300,8],[200,9],[1400,7],[100,10],[400,7]]}


WarpScript commands:

    SORT

Stack: 

    TOP: {"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[100,10],[200,9],[300,8],[400,7],[500,6],[1100,10],[1200,9],[1300,8],[1400,7],[1500,6]]}


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Create a new GTS with ten values 
NEWGTS 
'test name'
RENAME
{ 'label0' '42' 'label1' 'foo' }
RELABEL
1200  NaN NaN NaN  9 ADDVALUE
500   NaN NaN NaN  6 ADDVALUE
1500  NaN NaN NaN  6 ADDVALUE
1100  NaN NaN NaN 10 ADDVALUE
300   NaN NaN NaN  8 ADDVALUE
1300  NaN NaN NaN  8 ADDVALUE
200   NaN NaN NaN  9 ADDVALUE
1400  NaN NaN NaN  7 ADDVALUE
100   NaN NaN NaN 10 ADDVALUE
400   NaN NaN NaN  7 ADDVALUE
SORT
</warp10-warpscript-widget>
{% endraw %}
