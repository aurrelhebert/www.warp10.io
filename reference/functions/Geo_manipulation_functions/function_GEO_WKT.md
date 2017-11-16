---
title: "GEO.WKT"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Converts a Well Known Text String into a GeoXP Shape suitable for geo filtering"
categoryTree: ["reference","functions"]
category: "reference"
---


The `GEO.WKT` function converts a [Well Known Text](http://en.wikipedia.org/wiki/Well-known_text) (WKT) string into a geographical zone (geo zone) suitable for geo filtering.

It takes three parameters from the stack:

1. the WKT string
1. an error percentage
1. a boolean `inside`


## Example ##


WarpScript commands:

    'POLYGON ((-4.574435 48.641404, -4.565680 48.641404, -4.565680 48.636101, -4.574435 48.636101, -4.574435 48.641404 ))'
    0.1 true GEO.WKT

## Notes ##

The `GEO.WKT` function creates a geo zone that is an inner object for WarpScript, executing it alone will generate a `null` result as no output is generated. To see `GEO.WKT` in action you must use the generated geo zone for some kind of filtering, for example by using the [`mapper.geo.within`]({{ site.baseurl }}/reference/frameworks/mapper_geo_within) or [`mapper.geo.outside`]({{ site.baseurl }}/reference/frameworks/mapper_geo_outside). Here we show an example with `mapper.geo.within`.

Coordinates in WarpScript are usually given in standard order: *(latitude, longitude, altitude)*. The WKT syntax uses a different coordinate convention, each point is defined by *(longitude, latitude)*.


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[
    NEWGTS 'test' RENAME
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
    0.1 true GEO.WKT mapper.geo.within

    0
    0
    0
] MAP
</warp10-warpscript-widget>
{% endraw %}      
