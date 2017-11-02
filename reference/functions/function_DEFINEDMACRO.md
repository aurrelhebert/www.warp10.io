---
title: "DEFINEDMACRO"
layout: function
desc: "Checks if a macro is defined and pushes true or false on the stack accordingly."
categoryTree: ["reference","functions"]
category: reference
---

The `DEFINEDMACRO` checks if a macro is defined and pushes true or false on the stack accordingly.


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Define a macro with the name 'mymacro'
<% NOW %> 'mymacro' STORE
 
// push true on the stack if 'mymacro' is defined
// false otherwise
'mymacro' DEFINEDMACRO
</warp10-warpscript-widget>
{% endraw %}  