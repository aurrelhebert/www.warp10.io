---
title: "TIMEMODULO"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Split a Geo Time Serie into a LIST of GTS whose timestamps are original timestamps modulo a value passed as parameter"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","9100-function_TIMEMODULO.html.md"]
category: "reference"
---
 

The `TIMEMODULO` function takes a GTS or a LIST of GTS and splits each Geo Time Serie<sup>TM</sup> into a LIST with multiple GTS instances, whose timestamps are the original timestamps modulo a value passed as parameter. 

This function consumes two parameters from the of the stack and then expects to find the GTS or the LIST of GTS  on the top of the stack.

The parameter are :

- the quotient label which will hold the sequence of the resulting GTS (1 being the oldest)
- the modulo (a *long*) 


If the original GTS is bucketized, the produced GTS will also be bucketized.

If the label name to use for the sequence number is already used, the result will be a clone of the original Geo Time Serie, unsplit.

## Example ##

Initial stack:

    TOP: {"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[100,10],[200,9],[300,8],[400,7],[500,6],[1100,10],[1200,9],[1300,8],[1400,7],[1500,6]]}


WarpScript commands:

    1000               //  Modulo
    'sub-sequence'     // Label          
    TIMEMODULO

Stack: 

    [{"c":"test name","l":{"label0":"42","label1":"foo","sub-sequence":"0"},"a":{},"v":[[100,10],[200,9],[300,8],[400,7],[500,6]]},{"c":"test name","l":{"label0":"42","label1":"foo","sub-sequence":"1"},"a":{},"v":[[100,10],[200,9],[300,8],[400,7],[500,6]]}]

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Create a new GTS with ten values separated by a pause 
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
1100  NaN NaN NaN 10 ADDVALUE
1200  NaN NaN NaN  9 ADDVALUE
1300  NaN NaN NaN  8 ADDVALUE
1400  NaN NaN NaN  7 ADDVALUE
1500  NaN NaN NaN  6 ADDVALUE
1000              // Modulo
'sub-sequence'    // Label
TIMEMODULO   
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Create a new GTS with ten values separated by a pause 
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
1100  NaN NaN NaN 10 ADDVALUE
1200  NaN NaN NaN  9 ADDVALUE
1300  NaN NaN NaN  8 ADDVALUE
1400  NaN NaN NaN  7 ADDVALUE
1500  NaN NaN NaN  6 ADDVALUE
1000              // Modulo
'sub-sequence'    // Label
TIMEMODULO
SIZE 2 == ASSERT  // 2 sub-series found 
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
