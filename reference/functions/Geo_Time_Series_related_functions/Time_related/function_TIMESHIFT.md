---
title: "TIMESHIFT"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Shift the ticks of a Geo Time Series"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","9100-function_TIMESHIFT.html.md"]
category: "reference"
---
 

The `TIMESHIFT` function shifts the ticks of a GTS or a list of GTS according to the delta passed as parameter.

It expects a GTS or a list of GTS instances on the top of the stack after having consumed the delta from the top of the stack.

    2: [ GTS1, GTS2, ... ]
    1: -60000000

    TIMESHIFT

    1: [ GTS'1, GTS'2, ... ]


---
title: "TIMEMODULO"
layout: "default"
isPage: true
link: "/warpscript/functions"
--- 

The [`TIMEMODULO`]({{ site.baseurl }}/reference/functions/function_TIMEMODULO) function takes a GTS or a list of GTS and splits each Geo Time Serie<sup>TM</sup> into a list multiple GTS instances, whose timestamps are the original timestamps modulo a value passed as parameter. 

This function consumes two parameters from the of the stack and then expects to find the GTS or the list of GTS  on the top of the stack.

## Example ##

Initial stack:

    TOP: {"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[100,10],[200,9],[300,8],[400,7],[500,6],[1100,10],[1200,9],[1300,8],[1400,7],[1500,6]]}


WarpScript commands:

    1000               //  DELTA
    TIMESHIFT

Stack: 

    {"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[1100,10],[1200,9],[1300,8],[1400,7],[1500,6],[2100,10],[2200,9],[2300,8],[2400,7],[2500,6]]}

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Create a new GTS with ten values separated by a pause 
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
1100  NaN NaN NaN 10 ADDVALUE
1200  NaN NaN NaN  9 ADDVALUE
1300  NaN NaN NaN  8 ADDVALUE
1400  NaN NaN NaN  7 ADDVALUE
1500  NaN NaN NaN  6 ADDVALUE
1000               //  DELTA
TIMESHIFT    
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Create a new GTS with ten values separated by a pause 
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
1100  NaN NaN NaN 10 ADDVALUE
1200  NaN NaN NaN  9 ADDVALUE
1300  NaN NaN NaN  8 ADDVALUE
1400  NaN NaN NaN  7 ADDVALUE
1500  NaN NaN NaN  6 ADDVALUE
1000               //  DELTA
TIMESHIFT 
TICKS LIST-> DROP // Expand list of ticks
2500 == ASSERT  2400 == ASSERT  2300 == ASSERT  2200 == ASSERT    2100 == ASSERT 
1500 == ASSERT  1400 == ASSERT  1300 == ASSERT  1200 == ASSERT    1100 == ASSERT 
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}            
