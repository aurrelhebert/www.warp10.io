---
title: "DOCMODE"
layout: function
desc: "Turns on documentation mode."
categoryTree: ["reference","functions"]
category: reference
---

Turns on documentation mode which has the effect of not executing macros which have docstrings but instead push their docstring onto the stack. Macros which do not have docstrings will be executed normally.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}"><%
<'
   I'm the docstring...
'>
   DOC

NOW
%> 'macro' DEF
macro
DOCMODE
macro
</warp10-warpscript-widget>
{% endraw %}    
