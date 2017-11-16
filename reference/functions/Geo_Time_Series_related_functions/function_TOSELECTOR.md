---
title: "TOSELECTOR"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Transform a class selector and a labels selection MAPs into a Geo Time Series selector"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","800-function_TOSELECTOR.html.md"]
category: "reference"
---
 

The `TOSELECTOR` function takes a GTS or GTS LIST from the top of the stack and, for each encountered GTS, replace it with a selector which would select it.

## Example ##

Initial stack:

    TOP: {"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[100,10],[200,9],[300,8],[400,7],[500,6],[700,5],[800,4],[900,3],[1000,2],[1100,1]]}

WarpScript commands:
    
    TOSESELECTOR


Response stack:

    
    TOP: "=test%20name{label0=42,label1=foo}"

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
TOSELECTOR
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
TOSELECTOR
PARSESELECTOR
'label0'  CONTAINSKEY true == ASSERT
'label1'  CONTAINSKEY true == ASSERT
2 DROPN
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
