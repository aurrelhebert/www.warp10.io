---
title: "VALUESORT"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Sorts Geo Time Series according to its values."
categoryTree: ["reference","functions"]
category: "reference"
signature: "[gts] VALUESORT [sorted_gts]"
---
 
The function `VALUESORT` takes the GTS on top of the stack and sort its values (and associated locations/elevations) by order of their values.

## Example ##

Initial stack:

    TOP: {"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[100,10],[200,9],[300,8],[400,7],[500,6],[700,5],[800,4],[900,3],[1000,2],[1100,1]]}


WarpScript commands:


    VALUESORT

Stack: 

    TOP: [{"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[1100,1],[1000,2],[900,3],[800,4],[700,5],[500,6],[400,7],[300,8],[200,9],[100,10]]}]

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Create a new GTS with ten values 
NEWGTS 
'test name'
RENAME
{ 'label0' '42' 'label1' 'foo' }
RELABEL
100  NaN NaN NaN 10 ADDVALUE
200  NaN NaN NaN  9 ADDVALUE
300  NaN NaN NaN  8 ADDVALUE
400  NaN NaN NaN  7 ADDVALUE
500  NaN NaN NaN  6 ADDVALUE
700  NaN NaN NaN  5 ADDVALUE
800  NaN NaN NaN  4 ADDVALUE
900  NaN NaN NaN  3 ADDVALUE
1000 NaN NaN NaN  2 ADDVALUE
1100 NaN NaN NaN  1 ADDVALUE
VALUESORT
</warp10-warpscript-widget>
{% endraw %}
