---
title: "TIMESPLIT"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Splits a Geo Time Series at the quiet periods"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","9100-function_TIMESPLIT.html.md"]
category: "reference"
---
 

The `TIMESPLIT` function takes a GTS or a list of GTS and splits each Geo Time Series<sup>TM</sup> into a list multiple GTS instances, cutting the original GTS when it encounters *quiet periods* when there are no measurements.

This function consumes three parameters from the of the stack and then expects to find the GTS or the list of GTS  on the top of the stack.

The parameter are :

- the length of the quiet period (in microseconds)
- the minimum number of values each resulting GTS should have
- the name of the label which will hold the sequence of the resulting GTS (1 being the oldest). 

GTS which would have been created with less than the minimum number of values will be dropped.

If the original GTS is bucketized, the produced GTS will also be bucketized.

If the label name to use for the sequence number is already used, the result will be a clone of the original Geo Time Serie, unsplit.

## Example ##

Initial stack:

    TOP: {"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[100,10],[200,9],[300,8],[400,7],[500,6],[1100,10],[1200,9],[1300,8],[1400,7],[1500,6]]}


WarpScript commands:


    250       //  Quiet period
    2         // Min number of values
    'subSequenceNumber'  // Label
    TIMESPLIT

Stack: 

    [{"c":"test name","l":{"label0":"42","subSequenceNumber":"1","label1":"foo"},"a":{},"v":[[100,10],[200,9],[300,8],[400,7],[500,6]]},{"c":"test name","l":{"label0":"42","subSequenceNumber":"2","label1":"foo"},"a":{},"v":[[1100,10],[1200,9],[1300,8],[1400,7],[1500,6]]}]


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
250       //  Quiet period
2         // Min number of values
'subSequenceNumber'  // Label
TIMESPLIT      
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
250       //  Quiet period
2         // Min number of values
'subSequenceNumber'  // Label
TIMESPLIT      
SIZE 2 == ASSERT      // 2 sub-series found
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
