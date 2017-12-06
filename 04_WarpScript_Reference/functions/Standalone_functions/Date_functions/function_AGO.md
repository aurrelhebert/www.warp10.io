---
title: "AGO"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Computes a timestamp from an offset in time units."
categoryTree: ["reference","functions"]
category: "reference"
---
 
The `AGO` function is a handy shortcut which enables you to compute timestamps by specifying an offset from the current time.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Let's comput the timestamp for 1 day ago
1 d AGO
// This is equivalent to
1 d NOW SWAP -
// Note that the two result vary due to the elapsed time between invocation of the two functions
</warp10-warpscript-widget>
{% endraw %}    
