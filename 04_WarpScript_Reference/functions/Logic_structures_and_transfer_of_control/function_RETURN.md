---
title: "RETURN"
layout: "function"
isPage: "true"
link: "/warpscript/function_RETURN"
desc: "Immediately exit the macro being executed."
categoryTree: ["reference","functions"]
category: "reference"
---

Immediately exit the macro being executed.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}"><%
  <%
    // We return before pushing 1 onto the stack
    RETURN
    1
  %> EVAL
  // After we've exited the above macro, we will continue executing the current one
  0
%> EVAL
</warp10-warpscript-widget>
{% endraw %}    
