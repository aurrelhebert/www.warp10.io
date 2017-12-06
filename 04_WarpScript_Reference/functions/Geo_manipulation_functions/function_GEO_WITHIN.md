---
title: "GEO.WITHIN"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Checks if a Geo Time Series has all its points within a shape."
categoryTree: ["reference","functions"]
category: "reference"
---

Checks if a Geo Time Series has all its points within a shape.

The `GEO.WITHIN` function expects the following parameters on the stack:

      1: [ Geo Time Series ]
    TOP: Geo Shape

It will produce a boolean or a list of booleans indicating whether or not the Geo Time Series has all its points within the shape.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS 'test' RENAME
    10  48.630 -4.57 0 '(48.630, -4.57)' ADDVALUE
    20  48.632 -4.57 0 '(48.632, -4.57)' ADDVALUE
    30  48.634 -4.57 0 '(48.634, -4.57)' ADDVALUE
    40  48.636 -4.57 0 '(48.636, -4.57)' ADDVALUE
    50  48.637 -4.57 0 '(48.637, -4.57)' ADDVALUE
    60  48.638 -4.57 0 '(48.638, -4.57)' ADDVALUE
    70  48.640 -4.57 0 '(48.640, -4.57)' ADDVALUE
    80  48.642 -4.57 0 '(48.642, -4.57)' ADDVALUE
    90  48.644 -4.57 0 '(48.644, -4.57)' ADDVALUE
    100 48.646 -4.57 0 '(48.646, -4.57)' ADDVALUE


    // Let's define a square geo zone around the Ile Vierge, near the coastline of Brittany (France)
    'POLYGON ((-4.574435 48.641404, -4.565680 48.641404, -4.565680 48.636101, -4.574435 48.636101, -4.574435 48.641404 ))'
    0.1 true GEO.WKT

    GEO.WITHIN
</warp10-warpscript-widget>
{% endraw %}      
