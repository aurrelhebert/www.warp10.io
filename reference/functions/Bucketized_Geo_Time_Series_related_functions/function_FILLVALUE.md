---
title: "FILLVALUE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Fill missing values in a bucketized Geo Time Series with a constant"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","60-bucketized-gts","600-function_FILLVALUE.html.md"]
category: "reference"
---
 

The `FILLVALUE` function fills gaps in a *bucketized* Geo Time Serie instance with a fixed value/location/elevation.

It expects a GTS or a list thereof on the top of the stack after having consumed a list of parameters (latitude, longitude, elevation, value) sitting on top of the stack prior to the call. 

Location must be floating point numbers (e.g. `0.0` not `0`). Elevation must be an integer. If no location or elevation should be set, [`NaN`]({{ site.baseurl}}/reference/functions/function_NaN) can be used instead of specific value.

This function has no effect on non bucketized GTS instances.


## Example ##


WarpScript commands:

    // Create a new bucketized GTS with 9 buckets but only five values
    NEWGTS 'test name' RENAME
    { 'label0' '42' 'label1' 'foo' } RELABEL
    100  NaN NaN NaN 10 ADDVALUE
    200  NaN NaN NaN  9 ADDVALUE
    300  NaN NaN NaN  8 ADDVALUE
    400  NaN NaN NaN  7 ADDVALUE
    500  NaN NaN NaN  6 ADDVALUE
    [ SWAP bucketizer.mean 500 50 0 ] BUCKETIZE
    // Create the list of parameters for FILLVALUE
    [ 0.0 0.0 0 42 ]
    // And we apply FILLVALUE to fill the gaps
    FILLVALUE
    // And then sort to see the result
    SORT

Stack: 

    TOP: [{"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[100,10],[150,0,0,0,42],[200,9],[250,0,0,0,42],[300,8],[350,0,0,0,42],[400,7],[450,0,0,0,42],[500,6]]}]

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Create a new bucketized GTS with 9 buckets but only five values
NEWGTS 'test name' RENAME
{ 'label0' '42' 'label1' 'foo' } RELABEL
100  NaN NaN NaN 10 ADDVALUE
200  NaN NaN NaN  9 ADDVALUE
300  NaN NaN NaN  8 ADDVALUE
400  NaN NaN NaN  7 ADDVALUE
500  NaN NaN NaN  6 ADDVALUE
[ SWAP bucketizer.mean 500 50 0 ] BUCKETIZE
// Create the list of parameters for FILLVALUE
[ 0.0 0.0 0 42 ]
// And we apply FILLVALUE to fill the gaps
FILLVALUE
// And then sort to see the result
SORT
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Create a new bucketized GTS with 9 buckets but only five values
NEWGTS 'test name' RENAME
{ 'label0' '42' 'label1' 'foo' } RELABEL
100  NaN NaN NaN 10 ADDVALUE
200  NaN NaN NaN  9 ADDVALUE
300  NaN NaN NaN  8 ADDVALUE
400  NaN NaN NaN  7 ADDVALUE
500  NaN NaN NaN  6 ADDVALUE
[ SWAP bucketizer.mean 500 50 0 ] BUCKETIZE
// Create the list of parameters for FILLVALUE
[ 0.0 0.0 0 42 ]
// And we apply FILLVALUE to fill the gaps
FILLVALUE
// And then sort to see the result
SORT
LIST-> DROP   // Expand the GTS list to extract its values
VALUES
LIST-> DROP   // Expand the list of values
6 == ASSERT 42 == ASSERT 
7 == ASSERT 42 == ASSERT 
8 == ASSERT 42 == ASSERT  
9 == ASSERT 42 == ASSERT 
10 == ASSERT 
'unit test successful'
</warp10-warpscript-widget>
{% endraw %} 

