---
title: "SUBLIST"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Create a sub-LIST keeping only certain elements"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","20-lists-and-maps","910-function_SUBLIST.html.md"]
category: "reference"
---
 

The `SUBLIST` function requires two parameters: an argument list and a base list.
It creates a new list with the elements of the base list whose indices are in the argument list.

If the argument list contains two indices `[a,b]` then `SUBLIST`
returns the list of elements from index `a` to index `b` (included). 
If the argument list contains more than two indices, the result of `SUBLIST` 
contains all the elements at the specified indices, with possible duplicates.

Negative indices are considered to be calculated from the end of the list.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Normal use, with more than two elements in the argument list
[ 'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' ]
[ 0 2 4 -4 -2 ]
SUBLIST
// Range use, with two elements `[a,b]` with `a <= b` 
[ 'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' ]
[ 0 2 ] 
SUBLIST
</warp10-warpscript-widget>
{% endraw %}

## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Normal use, with more than two elements in the argument list
[ 'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' ]
[ 0 2 4 -4 -2 ]
SUBLIST
LIST-> 5 == ASSERT // We get a list with 5 elements
'i' == ASSERT
'g' == ASSERT
'e' == ASSERT
'c' == ASSERT
'a' == ASSERT
// Range use, with two elements `[a,b]` with `a <= b` 
[ 'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' ]
[ 0 2 ] 
SUBLIST
LIST-> 3 == ASSERT // We get a list with 3 elements
'c' == ASSERT
'b' == ASSERT
'a' == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}
