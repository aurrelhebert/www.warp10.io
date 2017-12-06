---
title: "SPLIT"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Split a string in segments"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","15-standalone","250-function_SPLIT.html.md"]
category: "reference"
---
 

The `SPLIT` function split a string in segments given a delimiter. 

It consumes two parameters from the top of the stack: the delimiter and the string to test matching with. 
The delimiter must be a string of length 1, i.e. only one character.

The function will return a list with all the segments.

## Example ##


WarpScript commands:

    'abc def ghi jkl'
    ' '
    SPLIT

Stack: 

    TOP: ["abc","def","ghi","jkl"]


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'abc def ghi jkl'
' '
SPLIT
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'abc def ghi jkl'
' '
SPLIT
LIST-> DROP        // Expand the list and drop its size
'jkl' == ASSERT                 
'ghi' == ASSERT                 
'def' == ASSERT                
'abc' == ASSERT                 
'unit test successful'
</warp10-warpscript-widget>
{% endraw %} 

