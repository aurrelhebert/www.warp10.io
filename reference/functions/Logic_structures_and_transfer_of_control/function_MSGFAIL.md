---
title: "MSGFAIL"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Halt execution of the script, returning the message on top of the stack."
categoryTree: ["reference","functions"]
oldPath: ["30-functions","30-logic-structures","16-function_FAIL.html.md"]
category: "reference"
---
 

The `MSGFAIL` function stops the execution of WarpScript code by throwing an exception. The exception message will be that on top of the stack when `MSGFAIL` is called.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'Sorry about that' MSGFAIL
</warp10-warpscript-widget>
{% endraw %}

  
