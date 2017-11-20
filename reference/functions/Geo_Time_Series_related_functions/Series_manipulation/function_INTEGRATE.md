---
title: "INTEGRATE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Integrate a Geo Time Serie"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","9200-function_INTEGRATE.html.md"]
category: "reference"
---
 

The `INTEGRATE` function takes a GTS and integrates it, considering the value at each tick is a rate of change per second. 

It consumes two parameters from the top of the stack: the initial value (a numeric parameter) and the GTS to integrate.
The resulting integrated GTS is pushes onto the stack.


## Example ##

Initial stack:

    TOP: {"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[1000000,1],[2000000,1],[3000000,1],[4000000,1],[5000000,1],[6000000,1],[7000000,1],[8000000,1],[9000000,1],[10000000,1]]}


WarpScript commands:


    INTEGRATE

Stack: 

    TOP: {"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[1000000,0],[2000000,1],[3000000,2],[4000000,3],[5000000,4],[6000000,5],[7000000,6],[8000000,7],[9000000,8],[10000000,9]


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS 
'test name'
RENAME
{ 'label0' '42' 'label1' 'foo' }
RELABEL
1000000  NaN NaN NaN 1.0 ADDVALUE
2000000  NaN NaN NaN 1.0 ADDVALUE
3000000  NaN NaN NaN 1.0 ADDVALUE
4000000  NaN NaN NaN 1.0 ADDVALUE
5000000  NaN NaN NaN 1.0 ADDVALUE
6000000  NaN NaN NaN 1.0 ADDVALUE
7000000  NaN NaN NaN 1.0 ADDVALUE
8000000  NaN NaN NaN 1.0 ADDVALUE
9000000 NaN NaN NaN  1.0 ADDVALUE
10000000 NaN NaN NaN  1.0 ADDVALUE
0.0
INTEGRATE
</warp10-warpscript-widget>
{% endraw %}


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS 
'test name'
RENAME
{ 'label0' '42' 'label1' 'foo' }
RELABEL
1000000  NaN NaN NaN 1.0 ADDVALUE
2000000  NaN NaN NaN 1.0 ADDVALUE
3000000  NaN NaN NaN 1.0 ADDVALUE
4000000  NaN NaN NaN 1.0 ADDVALUE
5000000  NaN NaN NaN 1.0 ADDVALUE
6000000  NaN NaN NaN 1.0 ADDVALUE
7000000  NaN NaN NaN 1.0 ADDVALUE
8000000  NaN NaN NaN 1.0 ADDVALUE
9000000 NaN NaN NaN  1.0 ADDVALUE
10000000 NaN NaN NaN  1.0 ADDVALUE
0.0
INTEGRATE
VALUES LIST-> DROP         // Expand the list and drop its size  
9 == ASSERT   8 == ASSERT   7 == ASSERT
6 == ASSERT   5 == ASSERT   4 == ASSERT  
3 == ASSERT   2 == ASSERT   1 == ASSERT
0 == ASSERT   
'unit test successful'
</warp10-warpscript-widget>
{% endraw %} 
