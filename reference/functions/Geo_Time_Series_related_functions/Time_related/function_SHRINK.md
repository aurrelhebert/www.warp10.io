---
title: "SHRINK"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Shrink the number of values of a GTS"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","500-function_SHRINK.html.md"]
category: "reference"
---
 

The `SHRINK` function requieres a `size` parameter and a GTS on the top of the stack. It consumes the `size` parameter and then it shrinks the number of values of a GTS to `size`.

This function has the side effect of sorting the GTS. If the GTS has fewer than 'SIZE' values the function will get an error.


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Create a new GTS with ten values 
NEWGTS 
'test name'
RENAME
{ 'label0' '42' 'label1' 'foo' }
RELABEL
1100 NaN NaN NaN  1 ADDVALUE
400  NaN NaN NaN  7 ADDVALUE
900  NaN NaN NaN  3 ADDVALUE
100  NaN NaN NaN 10 ADDVALUE
300  NaN NaN NaN  8 ADDVALUE
200  NaN NaN NaN  9 ADDVALUE
500  NaN NaN NaN  6 ADDVALUE
800  NaN NaN NaN  4 ADDVALUE
700  NaN NaN NaN  5 ADDVALUE
1000 NaN NaN NaN  2 ADDVALUE
5 SHRINK
</warp10-warpscript-widget>
{% endraw %}
