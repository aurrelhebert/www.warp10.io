---
title: "ATINDEX"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Extract the timestamp, longitude, lattitude, elevation and value for the N-th point of the GTS"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","300-function_ATINDEXN.html.md"]
category: "reference"
---
 

The `ATINDEX` function consumes a GTS from the stack, looks at its `index`-th point and put on the stack a list with the timestamp, longitude, lattitude, elevation and value for the `index`-th point of the GTS.


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
// Extract values with the VALUES funtion, put them in a list and push it onto the stack
4 ATINDEX
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
// Extract values with the VALUES funtion, put them in a list and push it onto the stack
4 ATINDEX
LIST-> DROP     // Extracting the list and dropping the # of items
6 == ASSERT     // Value
NaN == ASSERT   // Elevation
NaN == ASSERT   // Lattitude
NaN == ASSERT   // Longitude
500 == ASSERT   // Timestamp
'unit test successful'    
</warp10-warpscript-widget>
{% endraw %}
