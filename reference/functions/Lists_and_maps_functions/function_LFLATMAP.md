---
title: "LFLATMAP"
layout: function
desc: "Apply a macro on each element of a list"
category: reference
categoryTree: ["reference","functions"]
---

The `LMAP` function applies a macro on each element of a list, producing a list with each original element replaced by the flattened result of the macro execution

## Example ##

Initial stack:

    [ elem1 elem2 elem3 elem 4]


WarpScript commands:

    <% -1 * %> LFLATMAP


Stack:

    [ -elem1 -elem2 -elem3 -elem4 ]

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
[ 42 21 11 ]
<% -1 * %>
LFLATMAP
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
[ 42 21 11 ]
<% -1 * %>
LFLATMAP
</warp10-warpscript-widget>
{% endraw %}        
