---
title: "NORMALIZE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Normalize between 0 and 1 the values a Geo Time Series"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","860-function_NORMALIZE.html.md"]
category: "reference"
---
 

The `NORMALIZE` function takes as parameter a numeric GTS or a LIST of numeric GTS and normalizes them between 0 and 1 
(i.e. it replaces *X* by *(X-min)/(max -min)* or by *1* if *max == min*).

## Example ##

Initial stack:

    TOP: {"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[100,10],[200,9],[300,8],[400,7],[500,6]]}


WarpScript commands:

    NORMALIZE

Stack: 

    TOP: {"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[100,1],[200,0.75],[300,0.5],[400,0.25],[500,0]]}

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Create a new GTS with five values 
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
NORMALIZE
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Create a new GTS with five values 
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
NORMALIZE
VALUES LIST-> DROP    // Expand the LIST of values and drop its size 
0 == ASSERT   0.25 == ASSERT    0.5 == ASSERT   0.75 == ASSERT    1 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
