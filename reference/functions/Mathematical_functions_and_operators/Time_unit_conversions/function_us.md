---
title: "us"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Convert a timestamp expressed in microseconds to the time unit used by the platform"
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `us` function consumes a timestamp expressed in microseconds from the top of the stack and pushes back its conversion in the time unit used by the platform.

## Example ##

WarpScript commands:

    1 us

Stack: 

    TOP: 1 // If the platform is configured with microsecond as the time unit


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">1 us
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">1 us
0.001 MSTU * == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
