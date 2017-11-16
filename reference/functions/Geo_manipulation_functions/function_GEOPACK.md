---
title: "GEOPACK"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Encode a geo zone into a compact representation."
categoryTree: ["reference","functions"]
category: "reference"
---


The `GEOPACK` function converts a geo zone create by `GEO.WKT` into a compact form suitable for integrating into a script or macro.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'POLYGON ((-4.574435 48.641404, -4.565680 48.641404, -4.565680 48.636101, -4.574435 48.636101, -4.574435 48.641404 ))'
0.1 true GEO.WKT
GEOPACK
</warp10-warpscript-widget>
{% endraw %}      
