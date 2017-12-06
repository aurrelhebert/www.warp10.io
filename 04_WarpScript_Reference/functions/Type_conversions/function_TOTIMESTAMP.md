---
title: "TOTIMESTAMP"
layout: function
isPage: "true"
link: "/warpscript/functions"
desc: "Converts an ISO8601 date/time string into a number of time units."
categoryTree: ["reference","functions"]
category: reference
---

The `TOTIMESTAMP` function consumes a string parameter (date + time + time zone) from the top of the stack and pushes back its conversion to a number of time units since the [Unix Epoch](https://en.wikipedia.org/wiki/Unix_time).

The supported format is [ISO8601](http://en.wikipedia.org/wiki/ISO_8601) and are: 

  * yyyy-mm-dddThh:mm:ss.ssssssZ 
  * yyyy-mm-dddThh:mm:ss+hh:mm

As the string are URL encoded, the symbol `+` have to be replaced by `%2B`, otherwise a `space` will replace the `+` in the string.

## Example ##

WarpScript commands:

    '2016-01-19T16:07:37Z'
    TOTIMESTAMP

    '2016-01-19T16:07:37%2B02:00'
    TOTIMESTAMP

Stack: 

    TOP: 1453212457000000
    1: 1453219657000000


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
'2016-01-19T16:07:37Z'
TOTIMESTAMP

'2016-01-19T16:07:37%2B02:00'
TOTIMESTAMP
</warp10-warpscript-widget>
{% endraw %}    
