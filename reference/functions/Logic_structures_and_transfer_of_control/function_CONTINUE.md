---
title: "CONTINUE"
layout: "function"
isPage: "true"
link: "/warpscript/function_CONTINUE"
desc: "Immediately start a new iteration in a running loop."
categoryTree: ["reference","functions"]
category: "reference"
---

Immediately stop executing the current iteration of an ongoing loop and start the next one.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">0 'i' STORE
0 'j' STORE
1 1000
<% DROP $i 1 + 'i' STORE CONTINUE $j 1 + 'j' STORE %>
FOR
$i
$j
</warp10-warpscript-widget>
{% endraw %}    
