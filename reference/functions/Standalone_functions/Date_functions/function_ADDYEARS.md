---
title: "ADDYEARS"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Adds a certain number of years to a timestamp."
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `ADDYEARS` function modifies a timestamp or tselements list by adding a specified number of years to it. When modifying a timestamp, an optional timezone can be specified so the computation is performed using it instead of `UTC`.

Timezone names are the ones defined in [Joda Time](http://joda-time.sourceforge.net/timezones.html).

This function will take into account leap years and, when working with timestamps, possible daylight saving time change.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NOW
1 ADDYEARS
ISO8601

NOW ->TSELEMENTS 1 ADDYEARS
</warp10-warpscript-widget>
{% endraw %}        
