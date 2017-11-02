---
title: "]"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Closes an open list."
categoryTree: ["reference","functions"]
category: "reference"
---
 
Closes a currently open list and pushes it onto the stack. The elements on the stack are those up to the first mark encountered. The mark is discarded.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">MARK
0 1 2 ]

[ 3 4 5 ]
</warp10-warpscript-widget>
{% endraw %}    
