---
title: "CLEARTOMARK"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
categoryTree: ["reference","functions"]
desc: "Removes elements from the stack up to and including the first mark encountered."
category: "reference"
---
 
Removes elements from the stack up to and including the first mark encountered.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">0
1
2
MARK
3
4
5
CLEARTOMARK
</warp10-warpscript-widget>
{% endraw %}    
