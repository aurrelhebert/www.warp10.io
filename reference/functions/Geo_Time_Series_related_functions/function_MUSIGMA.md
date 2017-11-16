---
title: "MUSIGMA"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Calculate the mean and the standard deviation of a Geo Time Series"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","870-function_MUSIGMA.html.md"]
category: "reference"
---
 

The `MUSIGMA` function calculates the mean and the standard deviation of a GTS. It consumes two parameters from the top of the stack: a boolean (to choose if Bessel correction should be applied on the standard deviation) and a numeric GTS, and it  pushes onto the stack its mean (*mu*) and its standard deviation (sigma).


## Example ##

Initial stack:

    TOP: {"c":"test name","l":{"label0":"42","label1":"foo"},"a":{},"v":[[100,10],[200,9],[300,8],[400,7],[500,6]]}


WarpScript commands:

    true
    MUSIGMA

Stack: 

    TOP: 1.5811388300841898
    1:   8


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Create a new GTS with five values 
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
true
MUSIGMA
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Create a new GTS with five values 
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
true
MUSIGMA
1.5811388300841898 == ASSERT  // Sigma with Bessel correction
8 == ASSERT           // Mean
// Create a new GTS with five values 
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
false
MUSIGMA
1.4142135623730951 == ASSERT  // Sigma without Bessel correction
8 == ASSERT           // Sigma
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
