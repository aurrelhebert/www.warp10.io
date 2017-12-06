---
title: "RESTORE"
layout: "function"
desc: "Restores the stack context."
category: "reference"
---
 
This function restores the stack context to that contained in the object on top of the stack (previously create by a call to `SAVE`).

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
