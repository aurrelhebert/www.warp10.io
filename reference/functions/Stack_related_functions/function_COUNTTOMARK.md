---
title: "COUNTTOMARK"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
categoryTree: ["reference","functions"]
desc: "Counts the number of elements on the stack up to but excluding the first mark encountered."
category: "reference"
---
 
Counts the number of elements on the stack up to but excluding the first mark encountered. Neither the mark nor the elements on top of it are removed from the stack.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">MARK
0
1
2
COUNTTOMARK
</warp10-warpscript-widget>
{% endraw %}    
