---
title: "LOAD"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Pushes onto the stack the value of the symbol whose name is on the stack."
category: "reference"
categoryTree: ["reference","functions"]
---
 

The `LOAD` function pushes onto the stack the value associated with the symbol name present on top of the stack. It is an alternative to `$symbol`.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42 'foo' STORE
'foo' LOAD
</warp10-warpscript-widget>
{% endraw %}    

