---
title: "RESETS"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Remove resets in Geo Time Series values"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","9300-function_RESETS.html.md"]
category: "reference"
---
 

The `RESETS` function compensates for possible counter resets by adding the last value before the rest to all values after the reset.

The function expects a list of Geo Time Series on the top of the stack after having consumed a boolean indicating whether the counters decrease (*true*) or increase (*false*).


## Example ##

Initial stack:

    TOP: [{"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[1000000,1],[2000000,2],[3000000,3],[4000000,4],[5000000,1],[6000000,2],[7000000,3],[8000000,1],[9000000,2],[10000000,3]]}]


WarpScript commands:

    false
    RESETS

Stack: 

    TOP:  [{"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[1000000,1],[2000000,2],[3000000,3],[4000000,4],[5000000,5],[6000000,6],[7000000,7],[8000000,8],[9000000,9],[10000000,10]]}]

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS 
'test name'
RENAME
{ 'label0' '42' 'label1' 'foo' }
RELABEL
1000000  NaN NaN NaN 1.0 ADDVALUE
2000000  NaN NaN NaN 2.0 ADDVALUE
3000000  NaN NaN NaN 3.0 ADDVALUE
4000000  NaN NaN NaN 4.0 ADDVALUE
5000000  NaN NaN NaN 1.0 ADDVALUE
6000000  NaN NaN NaN 2.0 ADDVALUE
7000000  NaN NaN NaN 3.0 ADDVALUE
8000000  NaN NaN NaN 1.0 ADDVALUE
9000000 NaN NaN NaN  2.0 ADDVALUE
10000000 NaN NaN NaN  3.0 ADDVALUE
1 ->LIST
false 
RESETS
</warp10-warpscript-widget>
{% endraw %}


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS 
'test name'
RENAME
{ 'label0' '42' 'label1' 'foo' }
RELABEL
1000000  NaN NaN NaN 1 ADDVALUE
2000000  NaN NaN NaN 2 ADDVALUE
3000000  NaN NaN NaN 3 ADDVALUE
4000000  NaN NaN NaN 4 ADDVALUE
5000000  NaN NaN NaN 1 ADDVALUE
6000000  NaN NaN NaN 2 ADDVALUE
7000000  NaN NaN NaN 3 ADDVALUE
8000000  NaN NaN NaN 1 ADDVALUE
9000000 NaN NaN NaN  2 ADDVALUE
10000000 NaN NaN NaN  3 ADDVALUE
1 ->LIST
false 
RESETS
VALUES LIST-> DROP     // Expand the list and drop its size  
LIST-> DROP            // Expand the list and drop its size
10 == ASSERT  9 == ASSERT     8 == ASSERT
7 == ASSERT   6 == ASSERT     5 == ASSERT
4 == ASSERT   3 == ASSERT     2 == ASSERT
1 == ASSERT
 'unit test successful'
</warp10-warpscript-widget>
{% endraw %} 

