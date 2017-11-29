---
title: "SET->"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Converts the list on top of the stack into a set"
categoryTree: ["reference","functions"]
category: "reference"
---
 
The `SET->` function Convert the set on top of the stack into a LIST. 

SETs are not viewable, `null` will be return if it remains on the stack  

## Example ##

WarpScript commands:

    'set object' SET->

Stack:

    TOP: [2 3 4]

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Converts a LIST into SET
[ 4 4 3 3 2 2 ] ->SET 
// Converts a SET into LIST
SET->
</warp10-warpscript-widget>
{% endraw %}    
