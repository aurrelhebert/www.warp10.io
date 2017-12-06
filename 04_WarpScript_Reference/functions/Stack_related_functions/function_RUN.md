---
title: "RUN"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Executes the macro whose name is on the stack."
category: "reference"
---
 
The `RUN` function executes the macro whose name appears on the stack. This is handy for executing macros whose name may vary according to situations in your script.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}"><%
NOW
%> 'foo' STORE
'foo' RUN
</warp10-warpscript-widget>
{% endraw %}    

