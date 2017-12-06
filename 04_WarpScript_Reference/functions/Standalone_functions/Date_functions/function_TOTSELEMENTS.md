---
title: "->TSELEMENTS"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Replaces the timestamp with an array of its elements"
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `->TSELEMENTS`function applies to a timestamp. It replaces the timestamp with an array of
its *elements*. The array contains the following `LONG` values in this order:

    [ year month day_of_month hour minute second microseconds day_of_year day_of_week week_of_year ]

`->TSELEMENTS` can optionally use a timezone on top of the stack. Timezone names are the ones defined in [Joda Time](http://joda-time.sourceforge.net/timezones.html). If there is no timezone, it is considered UTC.


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
1434568904758000 ->TSELEMENTS
1434568904758000 'America/Los_Angeles' ->TSELEMENTS
</warp10-warpscript-widget>
{% endraw %}    
     
