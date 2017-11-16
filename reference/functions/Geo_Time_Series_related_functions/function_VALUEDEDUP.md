---
title: "VALUEDEDUP"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Remove duplicate values from a Geo Time Series"
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `VALUEDEDUP` function takes as parameter a GTS or a LIST of GTS and it removes its duplicate values.

Expects a boolean indicating whether we keep the oldest or most recent datapoint for a given value.

## Example ##

Initial stack:

    TOP: {"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[100,10],[200,9],[300,8],[400,7],[500,6],[600,10],[700,9]]}


WarpScript commands:

    true
    VALUEDEDUP

Stack: 

    TOP: {"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[500,6],[400,7],[300,8],[200,9],[100,10]]}

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Create a new GTS with five values 
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
600  NaN NaN NaN 10 ADDVALUE
700  NaN NaN NaN  9 ADDVALUE
true
VALUEDEDUP
</warp10-warpscript-widget>
{% endraw %}          
