---
title: "CLEARSYMBOLS"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Clear all symbols name of the stack."
categoryTree: ["reference","functions"]
category: "reference"
---


The `CLEARSYMBOLS` function clears all symbols defined with the function [STORE]({{ site.baseurl }}/reference/functions/function_STORE).

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">//
// create a symbol
NOW 'now' STORE

// the symbol now is defined
'now' DEFINED true == ASSERT

//clear symbols table
CLEARSYMBOLS

// the symbol now is not defined
'now' DEFINED false == ASSERT



</warp10-warpscript-widget>
{% endraw %} 
