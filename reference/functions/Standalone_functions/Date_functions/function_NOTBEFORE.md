---
title: "NOTBEFORE"
layout: function
desc: "Checks that the current time is not before the provided timestamp. Fails otherwise."
category: reference
---

The `NOTBEFORE` function checks that the current time is not before the provided timestamp (long or [ISO8601](http://en.wikipedia.org/wiki/ISO_8601) string representation).
Fails otherwise. 


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// timestamp 1 second in the past 
NOW 1 s -
// the current timestamp is not before
NOTBEFORE

// work with ISO dates
'2015-10-08T05:03:17.705487Z'
NOTBEFORE
</warp10-warpscript-widget>
{% endraw %}  