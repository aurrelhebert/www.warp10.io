---
title: "MSORT"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Sort a MAP"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","20-lists-and-maps","25-function_MSORT.html.md"]
category: "reference"
---
 

The function `MSORT` inspects the top of the stack. If it is a MAP, it sorts the MAP according to its keys if it was a LinkedHashMap.


## Example ##

Initial stack:

    TOP: {"b":0,"d":34,"a":21,"z":42,"x":-1}

WarpScript commands:

    MSORT

Stack:

    TOP: {"a":21,"b":0,"d":34,"x":-1,"z":42}


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">{ 'b' 0 'd' 34 'a' 21 'z' 42 'x' -1 }
MSORT
</warp10-warpscript-widget>
{% endraw %}

## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">{ 'b' 0 'd' 34 'a' 21 'z' 42 'x' -1 }
MSORT 
KEYLIST LIST-> DROP     //Expand the key list and drops its size
'z' == ASSERT 'x' == ASSERT 'd' == ASSERT 'b' == ASSERT 'a' == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}
