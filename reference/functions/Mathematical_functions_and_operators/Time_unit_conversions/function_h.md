---
title: "h"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Convert a timestamp expressed in hours to the time unit used by the platform"
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `h` function consumes a timestamp expressed in hours from the top of the stack and pushes back its conversion in the time unit used by the platform.

## Example ##

WarpScript commands:

    1 h

Stack: 

    TOP: 3600000000 // If the platform is configured with microsecond as the time unit

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">1 h
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">1 h
60 60 1000 STU * * * == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
