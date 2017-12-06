---
title: "mapper.count"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Counts the number of values"
categoryTree: ["reference","frameworks"]
category: "reference"
---
 

This *mapper* function count the number of all values found in the sliding window. The associated location and elevation are those of the most recent tick of the window.

## Example ##

Stack:

    TOP:  [{"c":"GTS1","l":{"label0":"42"},"a":{},"v":[[10,5],[20,Nan],[30,5],[40,5]]},{"c":"GTS2","l":{"label0":"42"},"a":{},"v":[[05,8],[15,8],[25,NaN],[40,8]]}]

WarpScript commands:

    mapper.count
    // pre-window
    2
    // post-window
    0
    // occurrences
    0
    5 ->LIST
    MAP

Stack: 

    TOP: [{"c":"GTS1","l":{"label0":"42"},"a":{},"v":[[10,1],[20,2],[30,3],[40,3]]},{"c":"GTS2","l":{"label0":"42"},"a":{},"v":[[5,1],[15,2],[25,3],[35,3]]}]

## Let's play with it ##

<warp10-warpscript-widget>NEWGTS "GTS1" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN  5 ADDVALUE
20 NaN NaN NaN NaN ADDVALUE 
30 NaN NaN NaN 5 ADDVALUE 
40 NaN NaN NaN 5 ADDVALUE 
NEWGTS "GTS2" RENAME 
{ 'label0' '42' } RELABEL
05 NaN NaN NaN  8 ADDVALUE
15 NaN NaN NaN 8 ADDVALUE 
25 NaN NaN NaN NaN ADDVALUE 
35 NaN NaN NaN 8 ADDVALUE 
2 ->LIST 
mapper.count 
2
0
0
5 ->LIST
MAP
</warp10-warpscript-widget>    


## Unit test ##

<warp10-warpscript-widget>NEWGTS "GTS1" RENAME 
{ 'label0' '42' } RELABEL
10 NaN NaN NaN  5 ADDVALUE
20 NaN NaN NaN NaN ADDVALUE 
30 NaN NaN NaN 5 ADDVALUE 
40 NaN NaN NaN 5 ADDVALUE 
NEWGTS "GTS2" RENAME 
{ 'label0' '42' } RELABEL
05 NaN NaN NaN  8 ADDVALUE
15 NaN NaN NaN 8 ADDVALUE 
25 NaN NaN NaN NaN ADDVALUE 
35 NaN NaN NaN 8 ADDVALUE 
2 ->LIST 
mapper.count 
2
0
0
5 ->LIST
MAP
VALUES LIST->
2 == ASSERT
LIST-> DROP
3 == ASSERT
3 == ASSERT
2 == ASSERT
1 == ASSERT
LIST-> DROP
3 == ASSERT
3 == ASSERT
2 == ASSERT
1 == ASSERT
'unit test successful'
</warp10-warpscript-widget>    