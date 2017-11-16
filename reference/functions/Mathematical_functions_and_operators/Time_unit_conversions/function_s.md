---
title: "s"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Convert a timestamp expressed in seconds to the time unit used by the platform"
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `s` function consumes a timestamp expressed in seconds from the top of the stack and pushes back its conversion in the time unit used by the platform.

## Example ##

WarpScript commands:

    1 s

Stack: 

    TOP: 1000000 // If the platform is configured with microsecond as the time unit


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">1 s
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">1 s
1 STU * == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
