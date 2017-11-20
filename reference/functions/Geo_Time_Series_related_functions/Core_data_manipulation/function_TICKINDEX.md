---
title: "TICKINDEX"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Reindex the ticks of Geo Time Series"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","840-function_TICKINDEX.html.md"]
category: "reference"
---
 

The `TICKINDEX` function takes as parameter a GTS or a LIST of GTS and for each GTS instance it produces a 
GTS instance similar to the original one except that its ticks will have been modified to reflect their index
in the sequence, starting at 0.

## Example ##

Initial stack:

    TOP: {"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[100,10],[200,9],[300,8],[400,7],[500,6],[100,10],[200,9]]}


WarpScript commands:

    TICKINDEX

Stack: 

    TOP: {"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[0,10],[1,9],[2,8],[3,7],[4,6],[5,10],[6,9]]}


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
100  NaN NaN NaN 10 ADDVALUE
200  NaN NaN NaN  9 ADDVALUE
TICKINDEX
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
100  NaN NaN NaN 10 ADDVALUE
200  NaN NaN NaN  9 ADDVALUE
TICKINDEX
TICKLIST LIST-> DROP  // Expand the LIST of values and drop its size
6 == ASSERT   5 == ASSERT   4 == ASSERT
3 == ASSERT   2 == ASSERT   1 == ASSERT
0 == ASSERT  
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
