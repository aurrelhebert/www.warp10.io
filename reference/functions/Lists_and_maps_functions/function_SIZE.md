---
title: "SIZE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Push on the stack the size of a LIST, map or GTS"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","20-lists-and-maps","01-function_SIZE.html.md"]
category: "reference"
---
 

The `SIZE` function consumes a LIST, map or GTS from the top of the stack and pushes on the stack its size.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Create a new GTS with ten values 
// With a GTS
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
CLONE 
SIZE
// With a map
{ 'label0' '42' 'label1' 'foo' }
DUP
SIZE
// With a LIST
[ 'label0' '42' 'label1' 'foo' ]
DUP
SIZE
</warp10-warpscript-widget>
{% endraw %}

## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Create a new GTS with ten values 
// With a GTS
NEWGTS 'test name' RENAME
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
SIZE
10 == ASSERT
// With a map
{ 'label0' '42' 'label1' 'foo' }
SIZE
2 == ASSERT
// With a LIST
[ 'label0' '42' 'label1' 'foo' ]
SIZE
4 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}
