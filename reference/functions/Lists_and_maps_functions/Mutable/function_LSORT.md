---
title: "LSORT"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Sort a LIST"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","20-lists-and-maps","25-function_LSORT.html.md"]
category: "reference"
---
 

The function `LSORT` inspects the top of the stack. If it is LIST, it sorts the LIST.


## Example ##

Initial stack:

    TOP: ["z","b","x","a","d"]

WarpScript commands:

    LSORT

Stack:

    TOP: ["a","b","d","x","z"]


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[ 'z' 'b' 'x' 'a' 'd' ]
LSORT
</warp10-warpscript-widget>
{% endraw %}

## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[ 'z' 'b' 'x' 'a' 'd' ]
LSORT
LIST-> DROP     //Expand the ordered LIST and drops its size
'z' == ASSERT 'x' == ASSERT 'd' == ASSERT 'b' == ASSERT 'a' == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}
