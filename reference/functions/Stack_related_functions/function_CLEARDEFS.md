---
title: "CLEARDEFS"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Clear redefined WarpScript functions."
categoryTree: ["reference","functions"]
category: "reference"
---


The `CLEARDEFS` function allows you to clear all [redefined WarpScript functions]({{ site.baseurl }}/reference/functions/function_DEF).

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">//
// We will add a check for a secret password in function NOW
//

<% 42 == ASSERT NOW %> 'NOW' DEF

//
// To use 'NOW' you must now push 42 on top of the stack
//
42 NOW

CLEARDEFS
NOW
</warp10-warpscript-widget>
{% endraw %} 
