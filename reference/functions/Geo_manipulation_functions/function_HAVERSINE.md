---
title: "HAVERSINE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Computes distance between two locations using the Haversine formula."
categoryTree: ["reference","functions"]
category: "reference"
---
 
Computes the distance in meters between two locations using the [Haversine formula](https://en.wikipedia.org/wiki/Haversine_formula).

The function expects the following elements on the stack:

      3: lat1
      2: lon1
      1: lat2
    TOP: lon2

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">48.0
-4.5
48.4409698
-4.4019117
HAVERSINE
</warp10-warpscript-widget>
{% endraw %}    
