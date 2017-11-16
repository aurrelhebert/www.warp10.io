---
title: "ISODURATION"
layout: function
desc: "Convert a number of time units into an ISO8601 duration string."
category: reference
categoryTree: ["reference","functions"]
signature: "time_units ISODURATION 'duration'"
---

Convert a number of time units into an [ISO8601](http://en.wikipedia.org/wiki/ISO_8601) duration string.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
86486486400 ISODURATION 
</warp10-warpscript-widget>
{% endraw %}