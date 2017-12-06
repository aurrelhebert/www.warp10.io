---
title: "SAVE"
layout: "function"
desc: "Pushes on the stack its current context."
category: "reference"
---
 
This function pushes on the stack an object representing the current context of the stack. Context contains the symbol tables and the function redefinitions.

The object pushed onto the stack can later be used with `RESTORE`.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">0 'a' STORE
<% 'Hello' %> 'A' DEF
$a A
SAVE 'context' STORE
1 'a' STORE
<% 'Goodbye' %> 'A' DEF
$a A
$context RESTORE
$a A
</warp10-warpscript-widget>
{% endraw %}
