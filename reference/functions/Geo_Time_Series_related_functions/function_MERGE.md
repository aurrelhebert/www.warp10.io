---
title: "MERGE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Merge two Geo Time Series"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","505-function_MERGE.html.md"]
category: "reference"
---
 

The `MERGE` function expects a LIST of Geo Time Series<sup>TM</sup> on the top of the stack. It will consume these GTS and push onto the stack a single GTS instance with all measurements found in the GTS instances present in the LIST. The name and labels of the resulting GTS instance are those of the first one of the LIST.


## Example ##

Initial stack:

    TOP:  {"c":"b","l":{"label2":"4242","label3":"bar"},"a":{},"v":[[6000000,2],[7000000,3],[8000000,4],[9000000,4],[10000000,4]]}
    1:    {"c":"a","l":{"label0":"42","label1":"foo"},"a":{},"v":[[1000000,1],[2000000,1],[3000000,1],[4000000,2],[5000000,2]]}


WarpScript commands:

    MERGE

Stack: 

    TOP:  {"c":"a","l":{"label0":"42","label1":"foo"},"a":{},"v":[[1000000,1],[2000000,1],[3000000,1],[4000000,2],[5000000,2],[6000000,2],[7000000,3],[8000000,4],[9000000,4],[10000000,4]]}

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[
  NEWGTS 'a' RENAME
  { 'label0' '42' 'label1' 'foo' } RELABEL
  1000000  NaN NaN NaN 1.0 ADDVALUE
  2000000  NaN NaN NaN 1.0 ADDVALUE
  3000000  NaN NaN NaN 1.0 ADDVALUE
  4000000  NaN NaN NaN 2.0 ADDVALUE
  5000000  NaN NaN NaN 2.0 ADDVALUE
  NEWGTS 'b' RENAME
  { 'label2' '4242' 'label3' 'bar' } RELABEL
  6000000  NaN NaN NaN 2.0 ADDVALUE
  7000000  NaN NaN NaN 3.0 ADDVALUE
  8000000  NaN NaN NaN 4.0 ADDVALUE
  9000000 NaN NaN NaN  4.0 ADDVALUE
  10000000 NaN NaN NaN  4.0 ADDVALUE
]
MERGE
</warp10-warpscript-widget>
{% endraw %}


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[
  NEWGTS 'a' RENAME
  { 'label0' '42' 'label1' 'foo' } RELABEL
  1000000  NaN NaN NaN 1.0 ADDVALUE
  2000000  NaN NaN NaN 1.0 ADDVALUE
  3000000  NaN NaN NaN 1.0 ADDVALUE
  4000000  NaN NaN NaN 2.0 ADDVALUE
  5000000  NaN NaN NaN 2.0 ADDVALUE
  NEWGTS 'b' RENAME
  { 'label2' '4242' 'label3' 'bar' } RELABEL
  6000000  NaN NaN NaN 2.0 ADDVALUE
  7000000  NaN NaN NaN 3.0 ADDVALUE
  8000000  NaN NaN NaN 4.0 ADDVALUE
  9000000 NaN NaN NaN  4.0 ADDVALUE
  10000000 NaN NaN NaN  4.0 ADDVALUE
]
MERGE
VALUES LIST-> DROP         // Expand the LIST and drop its size  
4 == ASSERT   4 == ASSERT   4 == ASSERT
3 == ASSERT
2 == ASSERT   2 == ASSERT   2 == ASSERT
1 == ASSERT   1 == ASSERT   1 == ASSERT
 'unit test successful'
</warp10-warpscript-widget>
{% endraw %}     
