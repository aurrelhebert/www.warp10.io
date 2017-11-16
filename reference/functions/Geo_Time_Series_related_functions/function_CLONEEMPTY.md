---
title: "CLONEEMPTY"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Push onto the stack an empty clone of the argument GTS"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","101-function_CLONEEMPTY.html.md"]
category: "reference"
---
 

The `CLONEEMPTY` function takes as parameter a GTS or a list of GTS and it produces an empty clone of the parameter GTS instances. The parameter GTS or list of GTS is consumed.

## Example ##

Initial stack:

    TOP: {"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[100,10],[200,9],[300,8],[400,7],[500,6]]}


WarpScript commands:

    CLONEEMPTY

Stack: 

    TOP: {"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[]}

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
CLONEEMPTY
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

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
CLONEEMPTY
VALUES SIZE 
0 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
