---
title: "ADDMONTHS"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Adds a certain number of months to a timestamp."
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `ADDMONTHS` function modifies a timestamp or tselements list by adding a specified number of months to it. When modifying a timestamp, an optional timezone can be specified so the computation is performed using it instead of `UTC`.

Timezone names are the ones defined in [Joda Time](http://joda-time.sourceforge.net/timezones.html).

This function will take into account leap years and, when working with timestamps, possible daylight saving time change.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'2016-10-30T12:00:00Z' TOTIMESTAMP
'Europe/Paris' 1 ADDMONTHS
'Europe/Paris' ISO8601

'2016-10-30T12:00:00Z' TOTIMESTAMP
->TSELEMENTS
1 ADDMONTHS
</warp10-warpscript-widget>
{% endraw %}        
