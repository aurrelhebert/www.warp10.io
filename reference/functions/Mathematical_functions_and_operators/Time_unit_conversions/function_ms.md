---
title: "ms"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Convert a timestamp expressed in milliseconds to the time unit used by the platform"
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `ms` function consumes a timestamp expressed in milliseconds from the top of the stack and pushes back its conversion in the time unit used by the platform.

## Example ##

WarpScript commands:

    1 ms

Stack: 

    TOP: 1000 // If the platform is configured with microsecond as the time unit


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">1 ms
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">1 ms
1 MSTU * == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
