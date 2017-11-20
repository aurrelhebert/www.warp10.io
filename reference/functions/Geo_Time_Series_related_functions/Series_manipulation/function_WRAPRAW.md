---
title: "WRAPRAW"
layout: function
desc: "Efficiently encode a Geo Time Series or a list thereof into byte arrays."
category: reference
---

`WRAPRAW` efficiently encodes a Geo Time Series or a list thereof into byte arrays. This function is handy when you want to provide data without giving away an access token. The wrapped GTS can later be unwrapped using [UNWRAP]({{ site.baseurl}}/reference/functions/function_UNWRAP). The sister function [WRAP]({{ site.baseurl}}/reference/functions/function_WRAP) encodes Geo Time Series in a similar way but leaves on the stack strings instead of byte arrays.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS
'class' RENAME
{ 'label' 'value' } RELABEL
1 100
<% DUP DUP DUP DUP ADDVALUE %>
FOR
WRAPRAW
DUP
UNWRAP
</warp10-warpscript-widget>
{% endraw %}    
