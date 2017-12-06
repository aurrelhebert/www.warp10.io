---
title: "TEMPLATE"
layout: function
desc: "Fills a template with values contained in a map."
category: reference
---

Fills a template with values contained in a map. The template supports the syntax `{{ var }}` which will be replaced by the value associated with key `var` in the input map.

The `TEMPLATE` function expects the map of values on top of the stack and will operate on the string template below it.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'Hello {{ name }}, I am Warp {{ factor }} and I am {{ mood }}'
{ 'name' 'user' 'factor' 10 }
TEMPLATE
</warp10-warpscript-widget>
{% endraw %}    
