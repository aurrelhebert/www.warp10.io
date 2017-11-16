---
title: "VALUESPLIT"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Split a Geo Time Series into N distinct GTS, one for each distinct value"
categoryTree: ["reference","functions"]
category: "reference"
signature: "[gts] label VALUESPLIT [gts split]"
---
 
The function `VALUESPLIT` takes the GTS on top of the stack and split it into N distinct boolean GTS, where N is the number of distinct values in the GTS.


## Example ##

Initial stack:

    TOP: {"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[100,10],[200,10],[300,10],[400,10],[500,6],[700,6],[800,6],[900,6],[1000,4],[1100,4]]}


WarpScript commands:

    'split-by-value'
    VALUESPLIT

Stack: 

    TOP: [{"c":"test name","l":{"label0":"42","split-by-value":"4","label1":"foo"},"a":{},"v":[[1000,true],[1100,true]]},{"c":"test name","l":{"label0":"42","split-by-value":"6","label1":"foo"},"a":{},"v":[[500,true],[700,true],[800,true],[900,true]]},{"c":"test name","l":{"label0":"42","split-by-value":"10","label1":"foo"},"a":{},"v":[[100,true],[200,true],[300,true],[400,true]]}]
    

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Create a new GTS with ten values 
NEWGTS 
'test name'
RENAME
{ 'label0' '42' 'label1' 'foo' }
RELABEL
100  NaN NaN NaN 10 ADDVALUE
200  NaN NaN NaN 10 ADDVALUE
300  NaN NaN NaN 10 ADDVALUE
400  NaN NaN NaN 10 ADDVALUE
500  NaN NaN NaN  6 ADDVALUE
700  NaN NaN NaN  6 ADDVALUE
800  NaN NaN NaN  6 ADDVALUE
900  NaN NaN NaN  6 ADDVALUE
1000 NaN NaN NaN  4 ADDVALUE
1100 NaN NaN NaN  4 ADDVALUE
'split-by-value'
VALUESPLIT
</warp10-warpscript-widget>
{% endraw %}
