---
title: "NAME"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Push the class name of a Geo Time Series onto the stack"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","210-function_NAME.html.md"]
category: "reference"
---
 

The `NAME` function consomes a GTS from the stack, extracts its name, and pushes it onto the stack.


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Create a new GTS with ten values 
NEWGTS 
'test name'
RENAME
{ 'label0' '42' 'label1' 'foo' }
RELABEL
100  48.4313071 -4.4513631 25100 10 ADDVALUE
200  48.4313072 -4.4513632 25200  9 ADDVALUE
300  48.4313073 -4.4513633 25300  8 ADDVALUE
400  48.4313074 -4.4513634 25400  7 ADDVALUE
500  48.4313075 -4.4513635 25500  6 ADDVALUE
700  48.4313076 -4.4513636 25600  5 ADDVALUE
800  48.4313077 -4.4513637 25700  4 ADDVALUE
900  48.4313078 -4.4513638 25800  3 ADDVALUE
1000 48.4313079 -4.4513639 25900  2 ADDVALUE
1100 48.4313080 -4.4513690 26000  1 ADDVALUE
// Extract the ticks with the NAME funtion, put them in a list and push it onto the stack
NAME
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
100  48.4313071 -4.4513631 25100 10 ADDVALUE
200  48.4313072 -4.4513632 25200  9 ADDVALUE
300  48.4313073 -4.4513633 25300  8 ADDVALUE
400  48.4313074 -4.4513634 25400  7 ADDVALUE
500  48.4313075 -4.4513635 25500  6 ADDVALUE
700  48.4313076 -4.4513636 25600  5 ADDVALUE
800  48.4313077 -4.4513637 25700  4 ADDVALUE
900  48.4313078 -4.4513638 25800  3 ADDVALUE
1000 48.4313079 -4.4513639 25900  2 ADDVALUE
1100 48.4313080 -4.4513690 26000  1 ADDVALUE
// Extract the ticks with the NAME funtion, put them in a list and push it onto the stack
NAME
'test name' == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}
