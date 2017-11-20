---
title: "VALUES"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Push Geo Time Series values onto the stack"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","230-function_VALUES.html.md"]
category: "reference"
---
 

The `VALUES` function consomes a GTS or a list of GTS from the stack, and it replaces each GTS instance by a list of its values.


## Example ##

Initial stack:

    TOP: {"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[100,10],[200,9],[300,8],[400,7],[500,6],[700,5],[800,4],[900,3],[1000,2],[1100,1]]}


WarpScript commands:


    VALUES

Stack: 

    TOP: [10,9,8,7,6,5,4,3,2,1]

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
VALUES
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
VALUES
LIST-> DROP         // Expand the list and drop its size  
1 == ASSERT  2 == ASSERT  3 == ASSERT  
4 == ASSERT  5 == ASSERT  6 == ASSERT
7 == ASSERT  8 == ASSERT  9 == ASSERT
10 == ASSERT                 
'unit test successful'
</warp10-warpscript-widget>
{% endraw %} 
