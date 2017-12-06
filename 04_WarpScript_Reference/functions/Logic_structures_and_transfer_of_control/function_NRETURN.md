---
title: "NRETURN"
layout: "function"
isPage: "true"
link: "/warpscript/function_NRETURN"
desc: "Immediately exit N macros being executed."
categoryTree: ["reference","functions"]
category: "reference"
---

Immediately exit a certain number of macros being executed. The `NRETURN` function expects a number of levels on top of the stack.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}"><%
  <%
    <%
      <%
         3
         2 NRETURN
      %> EVAL
      // Since NRETURN was called with 2 as its parameter, the above macro and ours
      // will exit, thus not pushing 2 onto the stack
      2
    %> EVAL
    1
  %> EVAL
  0
%> EVAL
</warp10-warpscript-widget>
{% endraw %}    
