---
title: "LMAP"
layout: function
desc: "Apply a macro on each element of a list"
category: reference
categoryTree: ["reference","functions"]
---

The `LMAP` function applies a macro on each element of a list, producing a list with the element on top of the stack after each macro invocation.

The macro is called with a stack containing the list index on top and the element at that particular index below it.

Initial stack:

    [ elem1 elem2 elem3 elem 4]


WarpScript commands:

    <% -1 * %> LMAP


Stack:

    [ -elem1 -elem2 -elem3 -elem4 ]



## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
[ 42 21 11 ]
<% DROP -1 * %>
LMAP
</warp10-warpscript-widget>
{% endraw %}    
