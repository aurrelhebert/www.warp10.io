---
title: "REXEC"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Executes some WarpScript on a remote Warp 10."
categoryTree: ["reference","functions"]
category: "reference"
---

The `REXEC` function executes some WarpScript code on a remote Warp 10 instance. The function expects the remote Warp 10 endpoint on top of the stack and will execute the WarpScript code in the STRING under it.

The statements `SNAPSHOT ->OPB64` are appended to the code which is remotely executed. The encoded snapshot is then pushed onto the local stack and the statements `OPB64-> 'UTF-8' BYTES-> EVAL` are executed, thus adding to the stack the same elements than those which were on the remote stack after the execution of the WarpScript code.

The `REXEC` function is only available if the `warpscript.rexec.enable` configuration parameter is set to `true`.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}"><'
NOW
'>
'http://warp.cityzendata.net/api/v0/exec'
REXEC
</warp10-warpscript-widget>
{% endraw %}      
