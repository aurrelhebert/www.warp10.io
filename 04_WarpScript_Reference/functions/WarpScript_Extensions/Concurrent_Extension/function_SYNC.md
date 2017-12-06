---
title: "SYNC"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Execute a macro in a synchronized manner inside of a CEVAL call."
categoryTree: ["reference","functions"]
category: "reference"
---
 
The `SYNC` function executes a macro within a macro currently executing concurrently with others (via [CEVAL]({{ site.baseurl}}/reference/functions/function_STOP)) after ensuring a mutual exclusion between all `SYNC` invocations currently executing among the macros run by `CEVAL`.

`SYNC` expects a macro on top of the stack.

The `SYNC` function is part of the `io.warp10.script.ext.concurrent.ConcurrentWarpScriptExtension`, this extenstion MUST be specified in the `warpscript.extensions` configuration parameter for it to be available.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[
<% '42' <% '43' %> SYNC %>
<% 42 <% 43 %> SYNC %>
] 2 CEVAL
</warp10-warpscript-widget>
{% endraw %}        
