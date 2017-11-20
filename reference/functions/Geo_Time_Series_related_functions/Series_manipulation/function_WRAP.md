---
title: "WRAP"
layout: function
desc: "Efficiently encode a Geo Time Series or a list thereof into strings."
category: reference
---

`WRAP` efficiently encodes a Geo Time Series or a list thereof into strings. This function is handy when you want to provide data without giving away an access token. The wrapped GTS can later be unwrapped using [UNWRAP]({{ site.baseurl}}/reference/functions/function_UNWRAP). The sister function [WRAPRAW]({{ site.baseurl}}/reference/functions/function_WRAPRAW) encodes Geo Time Series in a similar way but leaves on the stack byte arrays instead of strings.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS
'class' RENAME
{ 'label' 'value' } RELABEL
1 100
<% DUP DUP DUP DUP ADDVALUE %>
FOR
WRAP
DUP
UNWRAP
</warp10-warpscript-widget>
{% endraw %}    
