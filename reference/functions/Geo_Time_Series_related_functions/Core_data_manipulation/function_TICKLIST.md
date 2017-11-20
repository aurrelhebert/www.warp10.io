---
title: "TICKLIST"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Push Geo Time Series ticks onto the stack"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","215-function_TICKLIST.html.md"]
category: "reference"
---
 

The `TICKLIST` function consomes a GTS or a list of GTS from the stack, and it replaces each GTS instance by a list of its ticks.


## Example ##

Initial stack:

    TOP: {"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[100,10],[200,9],[300,8],[400,7],[500,6],[100,5],[200,4],[300,3],[400,2],[500,1]]}


WarpScript commands:


    TICKLIST

Stack: 

    TOP: [100,200,300,400,500,100,200,300,400,500]


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS 
'test name'
RENAME
{ 'label0' '42' 'label1' 'foo' }
RELABEL
100  NaN NaN NaN 10 ADDVALUE
200  NaN NaN NaN  9 ADDVALUE
300  NaN NaN NaN  8 ADDVALUE
400  NaN NaN NaN  7 ADDVALUE
500  NaN NaN NaN  6 ADDVALUE
100  NaN NaN NaN  5 ADDVALUE
200  NaN NaN NaN  4 ADDVALUE
300  NaN NaN NaN  3 ADDVALUE
400 NaN NaN NaN  2 ADDVALUE
500 NaN NaN NaN  1 ADDVALUE
TICKLIST
</warp10-warpscript-widget>
{% endraw %}


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS 
'test name'
RENAME
{ 'label0' '42' 'label1' 'foo' }
RELABEL
100  NaN NaN NaN 10 ADDVALUE
200  NaN NaN NaN  9 ADDVALUE
300  NaN NaN NaN  8 ADDVALUE
400  NaN NaN NaN  7 ADDVALUE
500  NaN NaN NaN  6 ADDVALUE
100  NaN NaN NaN  5 ADDVALUE
200  NaN NaN NaN  4 ADDVALUE
300  NaN NaN NaN  3 ADDVALUE
400 NaN NaN NaN  2 ADDVALUE
500 NaN NaN NaN  1 ADDVALUE
TICKLIST
LIST-> DROP         // Expand the list and drop its size  
500 == ASSERT   400 == ASSERT   300 == ASSERT
200 == ASSERT   100 == ASSERT  
500 == ASSERT   400 == ASSERT   300 == ASSERT
200 == ASSERT   100 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %} 
