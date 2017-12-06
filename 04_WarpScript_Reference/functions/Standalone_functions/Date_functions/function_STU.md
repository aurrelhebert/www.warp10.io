---
title: "STU"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Push onto the stack a the number of time units in a second"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","15-standalone","150-function_STU.html.md"]
category: "reference"
---
 

`STU` pushes onto the stack the number of time units in a second. This allows WarpScript scripts to be compatible with any platform, regardless of their configured time units (millisecond, microsecond, nanosecond).


## Example ##

Initial empty stack

WarpScript commands:

    STU

Stack: 

    TOP: 1000000 // If the platform is configured with microsecond as the time unit

## Find out what this platform's time unit is ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">STU
</warp10-warpscript-widget>
{% endraw %}    
