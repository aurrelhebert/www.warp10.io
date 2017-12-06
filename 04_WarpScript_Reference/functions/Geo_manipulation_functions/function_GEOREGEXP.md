---
title: "GEOREGEXP"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Produces a regexp from a GeoXPShape"
categoryTree: ["reference","functions"]
category: "reference"
---


The `GEOREGEXP` function produces a regexp from a GeoXPShape. It takes one parameter from the stack: a GeoXPShape. Then pushes back on the stack the regexp value as String. 


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">

// Let's define a square geo zone around the Ile Vierge, near the coastline of Brittany (France)
'POLYGON ((-4.574435 48.641404, -4.565680 48.641404, -4.565680 48.636101, -4.574435 48.636101, -4.574435 48.641404 ))'
0.1 true GEO.WKT

// Get its Reg Exp
GEO.REGEXP

</warp10-warpscript-widget>
{% endraw %}      
