---
title: "STANDARDIZE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Replace Geo Time Series values with their standardized score"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","862-function_STANDARDIZE.html.md"]
category: "reference"
---
 


The `STANDARDIZE` function takes as parameter a numeric GTS or a list of numeric GTS and standardizes them (i.e. it replaces *X* by *(X-mu)/sd*).

## Example ##

Initial stack:

    TOP: {"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[100,10],[200,9],[300,8],[400,7],[500,6]]}


WarpScript commands:

    STANDARDIZE

Stack: 

    TOP: {"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[100,1.2649110640673518],[200,0.6324555320336759],[300,0],[400,-0.6324555320336759],[500,-1.2649110640673518]]}

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
STANDARDIZE
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
STANDARDIZE
VALUES LIST-> DROP    // Expand the list of values and drop its size 
-1.2649110640673518 == ASSERT   -0.6324555320336759 == ASSERT    0 == ASSERT   
0.6324555320336759 == ASSERT    1.2649110640673518 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
