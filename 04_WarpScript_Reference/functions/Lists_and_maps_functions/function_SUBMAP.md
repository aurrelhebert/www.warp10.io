---
title: "SUBMAP"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Create a sub-MAP keeping only certain pairs key-value"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","20-lists-and-maps","910-function_SUBMAP.html.md"]
category: "reference"
---
 

The `SUBMAP` function requires two parameters: an argument list and a base map.
It creates a new map with the key-value pairs from the base map whose keys are in the argument list.


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">{ 'a' 0 'b' 1 'c' 2 'd' 3 'e' 4 'f' 5 'g' 6 'h' 7 'i' 8 'j' 9 }
[ 'a' 'c' 'e' 'g' 'i' ]
SUBMAP
</warp10-warpscript-widget>
{% endraw %}

## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">{ 'a' 0 'b' 1 'c' 2 'd' 3 'e' 4 'f' 5 'g' 6 'h' 7 'i' 8 'j' 9 }
[ 'a' 'c' 'e' 'g' 'i' ]
SUBMAP
DUP SIZE 5 == ASSERT      // The new map has 5 elements
VALUELIST LIST-> DROP     // We expand the list and drop the list size
8 == ASSERT
6 == ASSERT
4 == ASSERT
2 == ASSERT
0 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}
