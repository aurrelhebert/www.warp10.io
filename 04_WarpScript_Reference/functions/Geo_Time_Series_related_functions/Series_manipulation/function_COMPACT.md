---
title: "COMPACT"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Remove measurements which have the same value, location and elevation as the previous one"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","490-function_COMPACT.html.md"]
category: "reference"
---
 

The `COMPACT` function expects a Geo Time Series<sup>TM</sup> or a LIST of GTS on top of the stack. 
For each GTS instance it reads, it will produce a GTS whith fewer values, by removing measurements 
which have the same value, location and elevation as the previous one. The last value will be retained 
so the timespan of the resulting GTS is the same as the original one.


## Example ##

Initial stack:

    TOP: {"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[1000000,1],[2000000,1],[3000000,1],[4000000,1],[5000000,1],[6000000,1],[7000000,1],[8000000,1],[9000000,1],[10000000,1]]}


WarpScript commands:

    COMPACT

Stack: 

    TOP:  {"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[1000000,1],[4000000,2],[7000000,3],[8000000,4],[10000000,4]]}

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS 
'test name'
RENAME
{ 'label0' '42' 'label1' 'foo' }
RELABEL
1000000  NaN NaN NaN 1.0 ADDVALUE
2000000  NaN NaN NaN 1.0 ADDVALUE
3000000  NaN NaN NaN 1.0 ADDVALUE
4000000  NaN NaN NaN 2.0 ADDVALUE
5000000  NaN NaN NaN 2.0 ADDVALUE
6000000  NaN NaN NaN 2.0 ADDVALUE
7000000  NaN NaN NaN 3.0 ADDVALUE
8000000  NaN NaN NaN 4.0 ADDVALUE
9000000 NaN NaN NaN  4.0 ADDVALUE
10000000 NaN NaN NaN  4.0 ADDVALUE
COMPACT
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
4000000  NaN NaN NaN 2.0 ADDVALUE
5000000  NaN NaN NaN 2.0 ADDVALUE
6000000  NaN NaN NaN 2.0 ADDVALUE
7000000  NaN NaN NaN 3.0 ADDVALUE
8000000  NaN NaN NaN 4.0 ADDVALUE
9000000 NaN NaN NaN  4.0 ADDVALUE
10000000 NaN NaN NaN  4.0 ADDVALUE
COMPACT
VALUES LIST-> DROP         // Expand the list and drop its size  
4 == ASSERT   4 == ASSERT
3 == ASSERT   2 == ASSERT
1 == ASSERT
 'unit test successful'
</warp10-warpscript-widget>
{% endraw %}     
