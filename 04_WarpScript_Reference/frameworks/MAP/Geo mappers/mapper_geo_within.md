---
title: "mapper.geo.within"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Filters the GTS, keeping only the points inside a geo zone"
categoryTree: ["reference","frameworks","framework-map"]
oldPath: ["20-frameworks","201-framework-map","202-geo-mappers","100-mapper_geo_within.html.md"]
category: "reference"
---


This *mapper* filters the GTS, keeping only the points inside a geographical zone (geo zone). The geo zone can be defined in [WKT](http://en.wikipedia.org/wiki/Well-known_text) format by using the [GEO.WKT]({{ site.baseurl}}/reference/functions/function_GEO_WKT) function. 

## Example ##

Stack:

    TOP:  [{"c":"test","l":{},"a":{},"v":[[10,48.62999996636063,-4.570000022649765,0,"(48.630, -4.57)"],[20,48.63199997227639,-4.570000022649765,0,"(48.632, -4.57)"],[30,48.63399997819215,-4.570000022649765,0,"(48.634, -4.57)"],[40,48.63599998410791,-4.570000022649765,0,"(48.636, -4.57)"],[50,48.63699998706579,-4.570000022649765,0,"(48.637, -4.57)"],[60,48.63799999002367,-4.570000022649765,0,"(48.638, -4.57)"],[70,48.639999995939434,-4.570000022649765,0,"(48.640, -4.57)"],[80,48.64199995994568,-4.570000022649765,0,"(48.642, -4.57)"],[90,48.64399996586144,-4.570000022649765,0,"(48.644, -4.57)"],[100,48.6459999717772,-4.570000022649765,0,"(48.646, -4.57)"]]}]

WarpScript commands:



    // Let's define a square geo zone around the Ile Vierge, near the coastline of Brittany (France)
    // https://www.google.fr/maps/@48.6390219,-4.5672251,13z
    'POLYGON ((-4.574435 48.641404, -4.565680 48.641404, -4.565680 48.636101, -4.574435 48.636101, -4.574435 48.641404 ))'
    0.1 true GEO.WKT

    mapper.geo.within // Generate a geo.mapper.within with that geo zone
    0 0 0         // Sliding window of 1 (0 pre and 0 post), no options
    5 ->LIST
    MAP

Stack:

    TOP: [{"c":"test","l":{},"a":{},"v":[[50,48.63699998706579,-4.570000022649765,0,"(48.637, -4.57)"],[60,48.63799999002367,-4.570000022649765,0,"(48.638, -4.57)"],[70,48.639999995939434,-4.570000022649765,0,"(48.640, -4.57)"]]}]


## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS 'test' RENAME
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
&nbsp;
// Let's define a square geo zone around the Ile Vierge, near the coastline of Brittany (France)
'POLYGON ((-4.574435 48.641404, -4.565680 48.641404, -4.565680 48.636101, -4.574435 48.636101, -4.574435 48.641404 ))'
0.1 true GEO.WKT
&nbsp;
mapper.geo.within 0 0 0
5 ->LIST MAP
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget>NEWGTS 'test' RENAME
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
&nbsp;
// Let's define a square geo zone around the Ile Vierge, near the coastline of Brittany (France)
'POLYGON ((-4.574435 48.641404, -4.565680 48.641404, -4.565680 48.636101, -4.574435 48.636101, -4.574435 48.641404 ))'
0.1 true GEO.WKT
&nbsp;
mapper.geo.within 0 0 0
5 ->LIST MAP
&nbsp;
0 GET VALUES 'values' STORE
&nbsp;
$values SIZE 3 == ASSERT
$values 0 GET '(48.637, -4.57)' == ASSERT
$values 1 GET '(48.638, -4.57)' == ASSERT
$values 2 GET '(48.640, -4.57)' == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
