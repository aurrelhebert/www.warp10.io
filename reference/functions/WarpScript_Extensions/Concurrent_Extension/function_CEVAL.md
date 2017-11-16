---
title: "CEVAL"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Execute macros concurrently."
categoryTree: ["reference","functions"]
category: "reference"
---
 
The `CEVAL` function allows you to execute macros in a concurrent way on a pool of threads.

The function expects a parallelism level (a LONG) on top of the stack.

Below the parallelism level, a list of macros is expected.

All macros will be executed with the maximum parallelism level specified. Each macro is executed on its own stack. The context of the global stack is replicated to each of those stacks so each macro will have access to the existing symbols and the redefined functions. Any modification to the symbol table or redifined functions done in a concurrent macro will not be reflected in the global stack afterwards.

Each macro is invoked with its index in the list on top of the stack.

Upon termination of each macro, the content of their respective stacks is put into a list, with the top of the stack at index 0, and those lists are merged into a global list which is then pushed onto the stack. The resulting list for each macro appears at the index of the macro in the original macro list.

Beware that no synchronization is implicitely performed between the concurrent macros. If you require synchronization between macros, for example because you are modifying a list accessible by all macros via a symbol, you MUST use the [SYNC]({{ site.baseurl}}/reference/functions/function_SYNC) function.

If one of the macros fail, an attempt to interrupt the other running macros will be done and the failure will be propagated to the other macros. For the time being, a call to [`STOP`]({{ site.baseurl}}/reference/functions/function_STOP) or [`RETURN`]({{ site.baseurl}}/reference/functions/function_WRAPRAW) in one of the macros will stop all of them.

Use of `CEVAL` is not available from within a macro currently executing in a `CEVAL` call.

The `CEVAL` function is part of the `io.warp10.script.ext.concurrent.ConcurrentWarpScriptExtension`, this extenstion MUST be specified in the `warpscript.extensions` configuration parameter for it to be available.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[
<% '42' '43' %>
<% 42 43 %>
] 2 CEVAL
</warp10-warpscript-widget>
{% endraw %}        
