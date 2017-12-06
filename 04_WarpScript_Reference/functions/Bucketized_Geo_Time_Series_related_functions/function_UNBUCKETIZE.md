---
title: "UNBUCKETIZE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Force a Geo Time Series to be un-bucketized"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","60-bucketized-gts","630-function_UNBUCKETIZE.html.md"]
category: "reference"
---
 

The `UNBUCKETIZE` function takes a bucketized GTS from the stack and removes the buckets info from it, leaving it as unbucketized.


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
LIST-> DROP     // Extracting the list and dropping the # of items
UNBUCKETIZE     // Unbucketizing the last one
BUCKETSPAN       // The unbucketized GTS has a bucketspan of 0, no bucket info
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
LIST-> DROP     // Extracting the list and dropping the # of items
CLONE           // Cloning it to have two instances of the GTS
UNBUCKETIZE     // Unbucketizing the last one
BUCKETSPAN 0 == ASSERT       // The unbucketized GTS has a bucketspan of 0, no bucket info
BUCKETSPAN 0 > ASSERT       // The bucketized GTS has a bucketspan bigger than 0
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}
