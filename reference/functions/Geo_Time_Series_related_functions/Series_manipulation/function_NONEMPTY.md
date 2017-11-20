---
title: "NONEMPTY"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Check whether or not a Geo Time Series has values"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","500-function_NONEMPTY.html.md"]
category: "reference"
---
 

The `NONEMPTY` function inspects all the Geo Time Series<sup>TM</sup> found in the LIST on top of the stack and retains only those that have at least one value.


## Example ##

Initial stack:

    TOP:  {"c":"c","l":{"label4":"424242","label5":"foobar"},"a":{},"v":[[6000000,2],[7000000,3],[8000000,4],[9000000,4],[10000000,4]]}
    1:    {"c":"b","l":{"label2":"4242","label3":"bar"},"a":{},"v":[]}
    2:    {"c":"a","l":{"label0":"42","label1":"foo"},"a":{},"v":[[1000000,1],[2000000,1],[3000000,1],[4000000,2],[5000000,2]]}


WarpScript commands:

    3 ->LIST
    NONEMPTY

Stack: 

    TOP:  [{"c":"a","l":{"label0":"42","label1":"foo"},"a":{},"v":[[1000000,1],[2000000,1],[3000000,1],[4000000,2],[5000000,2]]},{"c":"c","l":{"label4":"424242","label5":"foobar"},"a":{},"v":[[6000000,2],[7000000,3],[8000000,4],[9000000,4],[10000000,4]]}]


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS 'a' RENAME
{ 'label0' '42' 'label1' 'foo' } RELABEL
1000000  NaN NaN NaN 1.0 ADDVALUE
2000000  NaN NaN NaN 1.0 ADDVALUE
3000000  NaN NaN NaN 1.0 ADDVALUE
4000000  NaN NaN NaN 2.0 ADDVALUE
5000000  NaN NaN NaN 2.0 ADDVALUE
NEWGTS 'b' RENAME
{ 'label2' '4242' 'label3' 'bar' } RELABEL
NEWGTS 'c' RENAME
{ 'label4' '424242' 'label5' 'foobar' } RELABEL
6000000  NaN NaN NaN 2.0 ADDVALUE
7000000  NaN NaN NaN 3.0 ADDVALUE
8000000  NaN NaN NaN 4.0 ADDVALUE
9000000 NaN NaN NaN  4.0 ADDVALUE
10000000 NaN NaN NaN  4.0 ADDVALUE
3 ->LIST
NONEMPTY
</warp10-warpscript-widget>
{% endraw %}


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS 'a' RENAME
{ 'label0' '42' 'label1' 'foo' } RELABEL
1000000  NaN NaN NaN 1.0 ADDVALUE
2000000  NaN NaN NaN 1.0 ADDVALUE
3000000  NaN NaN NaN 1.0 ADDVALUE
4000000  NaN NaN NaN 2.0 ADDVALUE
5000000  NaN NaN NaN 2.0 ADDVALUE
NEWGTS 'b' RENAME
{ 'label2' '4242' 'label3' 'bar' } RELABEL
NEWGTS 'c' RENAME
{ 'label4' '424242' 'label5' 'foobar' } RELABEL
6000000  NaN NaN NaN 2.0 ADDVALUE
7000000  NaN NaN NaN 3.0 ADDVALUE
8000000  NaN NaN NaN 4.0 ADDVALUE
9000000 NaN NaN NaN  4.0 ADDVALUE
10000000 NaN NaN NaN  4.0 ADDVALUE
3 ->LIST
NONEMPTY
SIZE
2 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}         
