---
title: "INTERPOLATE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Fill gaps in bucketized Geo Time Series"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","60-bucketized-gts","605-function_INTERPOLATE.html.md"]
category: "reference"
---
 

The `INTERPOLATE` function fills gaps in a *bucketized* Geo Time Serie<sup>TM</sup> instance with by interpolating linearly. It expects a GTS or a list thereof on the top of the stack. 

This function has no effect on non bucketized GTS instances.


## Example ##


WarpScript commands:

    // Create a new bucketized GTS with 9 buckets but only five values
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
    [ SWAP bucketizer.mean 500 50 0  ] BUCKETIZE
    INTERPOLATE

Stack: 

    TOP: [{"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[100,10],[200,9],[300,8],[400,7],[500,6],[150,9.5],[250,8.5],[350,7.5],[450,6.5]]}]

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Create a new bucketized GTS with 9 buckets but only five values
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
[ SWAP bucketizer.mean 500 50 0  ] BUCKETIZE
INTERPOLATE
SORT            // Interpotated series arent sorted
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Create a new bucketized GTS with 9 buckets but only five values
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
[ SWAP bucketizer.mean 500 50 0  ] BUCKETIZE
INTERPOLATE
SORT            // Interpotated series arent sorted
LIST-> DROP VALUES LIST-> DROP
6 == ASSERT 6.5 == ASSERT   7 == ASSERT 7.5 == ASSERT 
8 == ASSERT 8.5 == ASSERT   9 == ASSERT 9.5 == ASSERT 
10 == ASSERT 
'unit test successful'
</warp10-warpscript-widget>
{% endraw %} 

