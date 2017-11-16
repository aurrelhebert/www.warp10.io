---
title: "DURATION"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Transform an ISO8601 duration into microsecondes"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","15-standalone","150-function_DURATION.html.md"]
category: "reference"
---
 

The `DURATION` function pushes onto the stack the number of time units (microsencondes) described by the 
[ISO8601 duration](http://en.wikipedia.org/wiki/ISO_8601#Durations) on top of the stack.

### Tips ###

As Wikipedia explains:

~~~
Durations are a component of time intervals and define the amount of intervening time in a time interval. They should only be used as part of a time interval as prescribed by the standard. Time intervals are discussed in the next section.

Durations are represented by the format P[n]Y[n]M[n]DT[n]H[n]M[n]S or P[n]W as shown to the right. In these representations, the [n] is replaced by the value for each of the date and time elements that follow the [n]. Leading zeros are not required, but the maximum number of digits for each element should be agreed to by the communicating parties. The capital letters P, Y, M, W, D, T, H, M, and S are designators for each of the date and time elements and are not replaced.

- P is the duration designator (historically called "period") placed at the start of the duration representation.
- Y is the year designator that follows the value for the number of years.
- M is the month designator that follows the value for the number of months.
- W is the week designator that follows the value for the number of weeks.
- D is the day designator that follows the value for the number of days.
- T is the time designator that precedes the time components of the representation.
- H is the hour designator that follows the value for the number of hours.
- M is the minute designator that follows the value for the number of minutes.
- S is the second designator that follows the value for the number of seconds.

For example, "P3Y6M4DT12H30M5S" represents a duration of "three years, six months, four days, twelve hours, thirty minutes, and five seconds".
~~~

## Example ##

Initial stack:

    TOP: "P2D5H37M10S"  // Two days, five hours, thrity seven minutes and ten seconds

WarpScript commands:

    DURATION

Stack: 

    TOP: 193030000000

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'P12S' // Twelve seconds
DURATION
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'P12S' // Twelve seconds
DURATION
12000000 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
