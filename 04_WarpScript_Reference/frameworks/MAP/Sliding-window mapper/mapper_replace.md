---
title: "mapper.replace"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Replace value with a constant"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","201-framework-map","205-mapper_replace.html.md"]
category: "reference"
---
 
This *mapper* function replaces windows with at least one value with a constant. The location and elevation returned are those associated with the most recent value in the sliding window.

Stack:

    TOP:  {"c":"","l":{},"a":{},"v":[[100,10],[101,9],[102,8],[103,7],[104,6],[105,5],[106,4],[107,3],[108,2],[109,1]]}

WarpScript commands:

    // Setting a mapper.replace function to put value 42
    42 mapper.replace 
    // Sliding window of 1 (0 pre and 0 post), no options
    0 0 0 
    // Let's map
    5 ->LIST 
    MAP

Stack: 

    TOP: [{"c":"","l":{},"a":{},"v":[[100,42],[101,42],[102,42],[103,42],[104,42],[105,42],[106,42],[107,42],[108,42],[109,42]]}]


## Let's play with it ##


{% raw %}
<warp10-warpscript-widget>// Create a new GTS and add some values
NEWGTS 
100 NaN NaN NaN 10 ADDVALUE
101 NaN NaN NaN  9 ADDVALUE
102 NaN NaN NaN  8 ADDVALUE
103 NaN NaN NaN  7 ADDVALUE
104 NaN NaN NaN  6 ADDVALUE
105 NaN NaN NaN  5 ADDVALUE
106 NaN NaN NaN  4 ADDVALUE
107 NaN NaN NaN  3 ADDVALUE
108 NaN NaN NaN  2 ADDVALUE
109 NaN NaN NaN  1 ADDVALUE
// Setting a mapper.replace function to put value 42
42 mapper.replace 
// Sliding window of 1 (0 pre and 0 post), no options
0 0 0 
// Let's map
5 ->LIST 
MAP
</warp10-warpscript-widget>
{% endraw %}    

## Unit test ##

{% raw %}
<warp10-warpscript-widget>// Create a new GTS and add some values
NEWGTS 
100 NaN NaN NaN 10 ADDVALUE
101 NaN NaN NaN  9 ADDVALUE
102 NaN NaN NaN  8 ADDVALUE
103 NaN NaN NaN  7 ADDVALUE
104 NaN NaN NaN  6 ADDVALUE
105 NaN NaN NaN  5 ADDVALUE
106 NaN NaN NaN  4 ADDVALUE
107 NaN NaN NaN  3 ADDVALUE
108 NaN NaN NaN  2 ADDVALUE
109 NaN NaN NaN  1 ADDVALUE
// Setting a mapper.replace function to put value 42
42 mapper.replace 
// Sliding window of 1 (0 pre and 0 post), no options
0 0 0 
// Let's map
5 ->LIST 
MAP
VALUES LIST-> 
1 == ASSERT   // values list size
LIST-> DROP
42 == ASSERT  42 == ASSERT  42 == ASSERT  42 == ASSERT  42 == ASSERT
42 == ASSERT  42 == ASSERT  42 == ASSERT  42 == ASSERT  42 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}  