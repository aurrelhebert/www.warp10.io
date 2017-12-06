---
title: "NOTAFTER"
layout: function
desc: "Checks that the current time is not after the provided timestamp. Fails otherwise."
category: reference
---

The `NOTAFTER` function checks that the current time is not after the provided timestamp (long or [ISO8601](http://en.wikipedia.org/wiki/ISO_8601) string representation).
Fails otherwise. 


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// timestamp 1 second in the futur 
NOW 1 s + 
// the current timestamp is not after
NOTAFTER

// work with ISO dates
'2300-10-08T05:03:17.705487Z'
NOTAFTER
</warp10-warpscript-widget>
{% endraw %}  