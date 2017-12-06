---
title: "TICKS"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Push Geo Time Series timestamps onto the stack"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","200-function_TICKS.html.md"]
category: "reference"
---
 

The `TICKS` function consomes a GTS or a LIST of GTS from the stack, 
extracts the ticks (the timestamps of all the data points of the GTS) of all the GTS instances,
eliminates any doubles, sort them, puts them in a LIST and pushes the LIST onto the stack.

As a side effect of TICKS, the LIST is sorted. 


## Example ##

Initial stack:

    TOP: [{"c":"a","l":{},"a":{},"v":[[100,10],[200,9],[300,8],[400,7],[500,6]]},{"c":"b","l":{},"a":{},"v":[[100,10],[300,9],[500,8],[700,7],[900,6]]}]

WarpScript commands:

    TICKS

Stack:

    TOP: [100,200,300,400,500,700,900]    

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS 
'a'
RENAME
100  NaN NaN NaN 10 ADDVALUE
200  NaN NaN NaN  9 ADDVALUE
300  NaN NaN NaN  8 ADDVALUE
400  NaN NaN NaN  7 ADDVALUE
500  NaN NaN NaN  6 ADDVALUE
NEWGTS 
'b'
RENAME
100  NaN NaN NaN 10 ADDVALUE
300  NaN NaN NaN  9 ADDVALUE
500  NaN NaN NaN  8 ADDVALUE
700  NaN NaN NaN  7 ADDVALUE
900  NaN NaN NaN  6 ADDVALUE
2 ->LIST
TICKS
</warp10-warpscript-widget>
{% endraw %}


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS 
'a'
RENAME
100  NaN NaN NaN 10 ADDVALUE
200  NaN NaN NaN  9 ADDVALUE
300  NaN NaN NaN  8 ADDVALUE
400  NaN NaN NaN  7 ADDVALUE
500  NaN NaN NaN  6 ADDVALUE
NEWGTS 
'b'
RENAME
100  NaN NaN NaN 10 ADDVALUE
300  NaN NaN NaN  9 ADDVALUE
500  NaN NaN NaN  8 ADDVALUE
700  NaN NaN NaN  7 ADDVALUE
900  NaN NaN NaN  6 ADDVALUE
2 ->LIST
TICKS
LIST-> DROP     // Expands the LIST and drops its size
900 == ASSERT   700 == ASSERT   500 == ASSERT
400 == ASSERT   300 == ASSERT   200 == ASSERT
100 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        

