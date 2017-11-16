---
title: "ps"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Convert a timestamp expressed in picoseconds to the time unit used by the platform"
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `ps` function consumes a timestamp expressed in picoseconds from the top of the stack and pushes back its conversion in the time unit used by the platform.

## Example ##

WarpScript commands:

    1 ps

Stack: 

    TOP: 0.000001 // If the platform is configured with microsecond as the time unit


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">1 ps
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">1 ps
1e-12 STU * == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
