---
title: "ADDDAYS"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Adds a certain number of days to a timestamp."
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `ADDDAYS` function modifies a timestamp or tselements by adding a specified number of days to it. When modifying a timestamp, an optional timezone can be specified so the computation is performed using it instead of `UTC`.

Timezone names are the ones defined in [Joda Time](http://joda-time.sourceforge.net/timezones.html).

This function will take into account leap years and, when working with timestamps, possible daylight saving time change.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'2016-10-30T12:00:00Z' TOTIMESTAMP
'Europe/Paris' 1 ADDDAYS
'Europe/Paris' ISO8601

'2016-10-30T12:00:00Z' TOTIMESTAMP
->TSELEMENTS
2 ADDDAYS
</warp10-warpscript-widget>
{% endraw %}        
