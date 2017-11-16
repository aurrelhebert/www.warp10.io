---
title: "FILLPREVIOUS"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Fill missing values in a bucketized Geo Time Series with the last known value"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","60-bucketized-gts","600-function_FILLPREVIOUS.html.md"]
category: "reference"
---
 

The `FILLPREVIOUS` function fills gaps in a *bucketized* Geo Time Serie instance by re-using the value/location/elevation of the previous non empty bucket to fill each empty bucket. It expects a GTS or a list thereof on the top of the stack.

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
    // And we apply FILLPREVIOUS to fill the gaps
    FILLPREVIOUS
    // And then sort to see the result
    SORT

Stack: 

    TOP: [{"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[100,10],[150,10],[200,9],[250,9],[300,8],[350,8],[400,7],[450,7],[500,6]]}]

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Create a new bucketized GTS with 10 buckets but only five values
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
// And we apply FILLPREVIOUS to fill the gaps
FILLPREVIOUS
// And then sort to see the result
SORT
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Create a new bucketized GTS with 10 buckets but only five values
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
// And we apply FILLPREVIOUS to fill the gaps
FILLPREVIOUS
// And then sort to see the result
SORT
LIST-> DROP   // Expand the GTS list to extract its values
VALUES
LIST-> DROP   // Expand the list of values
6 == ASSERT 
7 == ASSERT 7 == ASSERT 
8 == ASSERT 8 == ASSERT  
9 == ASSERT 9 == ASSERT 
10 == ASSERT 10 == ASSERT 
'unit test successful'
</warp10-warpscript-widget>
{% endraw %} 
