---
title: "ns"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Convert a timestamp expressed in nanoseconds to the time unit used by the platform"
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `ns` function consumes a timestamp expressed in nanoseconds from the top of the stack and pushes back its conversion in the time unit used by the platform.

## Example ##

WarpScript commands:

    1 ns

Stack: 

    TOP: 0.001 // If the platform is configured with microsecond as the time unit


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">1 ns
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">1 ns
 1e-9 STU * == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
