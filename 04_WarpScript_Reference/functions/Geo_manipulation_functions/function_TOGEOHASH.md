---
title: "->GEOHASH"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Converts lat/lon to a GeoHash."
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `->GEOHASH` function generates a [GeoHash](https://en.wikipedia.org/wiki/Geohash) from a latitude and longitude as floating point degrees or a [HHCode](https://en.wikipedia.org/wiki/HHCode) expressed as a long. The generated GeoHash is a String.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">48.00 -4.565
->GEOHASH


</warp10-warpscript-widget>
{% endraw %}        
