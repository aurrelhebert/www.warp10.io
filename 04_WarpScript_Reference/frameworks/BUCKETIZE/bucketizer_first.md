---
title: "bucketizer.first"
layout: "function"
isPage: "true"
link: "/warpscript/framework_bucketize"
desc: "Return the first value of the interval"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","101-framework-bucketize","101-bucketizer_first.html.md"]
category: "reference"
---



The `bucketizer.first` function returns the first value of the interval to bucketize with its associated location and elevation.

The `bucketizer.first` function can be applied to values of any type.


## Example ##

Stack: 

    TOP: {"c":"testname","l":{"label0":"42","label1":"foo"},"a":{},"v":[[100,10],[200,9],[300,8],[400,7],[500,6],[600,5],[700,4],[800,42]]}

WarpScript commands:

    // arguments are: GTS or [GTS], bucketizer, lastbucket, bucketspan, bucketcount
    [ SWAP bucketizer.first 0 0 2 ] BUCKETIZE

Stack: 

    TOP: [{"c":"testname","l":{"label0":"42","label1":"foo"},"a":{},"v":[[800,6],[449,10]]}]


## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS 
'testname'
RENAME
{ 'label0' '42' 'label1' 'foo' }
RELABEL
100  NaN NaN NaN 10 ADDVALUE
200  NaN NaN NaN  9 ADDVALUE
300  NaN NaN NaN  8 ADDVALUE
400  NaN NaN NaN  7 ADDVALUE
500  NaN NaN NaN  6 ADDVALUE
600  NaN NaN NaN  5 ADDVALUE
700  NaN NaN NaN  4 ADDVALUE
800  NaN NaN NaN 42 ADDVALUE

// arguments are: GTS or [GTS], bucketizer, lastbucket, bucketspan, bucketcount
[ SWAP bucketizer.first 0 0 2 ] BUCKETIZE
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget>NEWGTS 
'testname'
RENAME
{ 'label0' '42' 'label1' 'foo' }
RELABEL
100  NaN NaN NaN 10 ADDVALUE
200  NaN NaN NaN  9 ADDVALUE
300  NaN NaN NaN  8 ADDVALUE
400  NaN NaN NaN  7 ADDVALUE
500  NaN NaN NaN  6 ADDVALUE
600  NaN NaN NaN  5 ADDVALUE
700  NaN NaN NaN  4 ADDVALUE
800  NaN NaN NaN 42 ADDVALUE

// arguments are: GTS or [GTS], bucketizer, lastbucket, bucketspan, bucketcount
[ SWAP bucketizer.first 0 0 2 ] BUCKETIZE
LIST-> DROP           // Exract the GTS from the list
VALUES LIST-> DROP    // Expand the list of values
10 == ASSERT  6 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}     