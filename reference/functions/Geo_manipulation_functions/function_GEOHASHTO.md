---
title: "GEOHASH->"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Converts a GeoHash to a lat/lon."
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `GEOHASH->` function decomposes a [GeoHash](https://en.wikipedia.org/wiki/Geohash) into a latitude and longitude.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'gbsc045u7b93'
GEOHASH->
</warp10-warpscript-widget>
{% endraw %}        
