---
title: "}"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Closes an open list."
categoryTree: ["reference","functions"]
category: "reference"
---
 
Closes a currently open map and pushes it onto the stack. The key / value pairs of the map are pairs of elements popped off of the stack up to the first mark encountered. The mark is discarded.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">MARK
'a' 0 'b' 1 }

{ 'c' 2 'd' 3 }
</warp10-warpscript-widget>
{% endraw %}    
