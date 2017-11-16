---
title: "ATBUCKET"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Extracts the data from a bucket of a Geo Time Series"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","60-bucketized-gts","610-function_ATBUCKET.html.md"]
category: "reference"
---
 

The `ATBUCKET` function consumes a bucketized GTS from the stack, looks at its `index`-th bucker and put on the stack a list with the timestamp, longitude, lattitude, elevation and value for the `index`-th point of the GTS.


## Example ##

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
// And bucketize it with 5 buckets
[ SWAP bucketizer.max 0 0 5 ] BUCKETIZE
0 GET     // Getting the single gts of the list
4 ATBUCKET
</warp10-warpscript-widget>
{% endraw %}

## Unit test ##

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
// And bucketize it with 5 buckets
[ SWAP bucketizer.max 0 0 5 ] BUCKETIZE
0 GET     // Getting the single gts of the list
4 ATBUCKET
LIST-> DROP     // Expanding the list and dropping the number of items
3 == ASSERT     // Value
NaN == ASSERT   // Elevation
NaN == ASSERT   // Lattitude
NaN == ASSERT   // Longitude
1100 == ASSERT   // Timestamp
'unit test successful'    
</warp10-warpscript-widget>
{% endraw %}
