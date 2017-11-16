---
title: "MSTU"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Push onto the stack a the number of time units in a millisecond"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","15-standalone","150-function_MSTU.html.md"]
category: "reference"
---
 

`MSTU` pushes onto the stack the number of time units in a millisecond. This allows WarpScript scripts to be compatible with any platform, regardless of their configured time units (millisecond, microsecond, nanosecond).


## Example ##

Initial empty stack

WarpScript commands:

    MSTU

Stack: 

    TOP: 1000 // If the platform is configured with microsecond as the time unit

## Find out what this platform's time unit is ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">MSTU
</warp10-warpscript-widget>
{% endraw %}    
