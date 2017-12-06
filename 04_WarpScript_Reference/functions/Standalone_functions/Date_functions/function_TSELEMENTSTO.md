---
title: "TSELEMENTS->"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Converts various timestamp's elements into a timestamp for a given timezone"
category: "reference"
---

The `TSELEMENTS->`function applies to a timestamp's elements. It replaces the an array of
its *elements* into a timestamp.
    
`TSELEMENTS->` can optionally use a timezone on top of the stack. Timezone names are the ones defined in [Joda Time](http://joda-time.sourceforge.net/timezones.html). If there is no timezone, it is considered UTC.


## Example ##


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
[ 2016 11 16 2 46 0 956663 321 3 46 ]
'America/Los_Angeles'
TSELEMENTS->
</warp10-warpscript-widget>
{% endraw %}    
