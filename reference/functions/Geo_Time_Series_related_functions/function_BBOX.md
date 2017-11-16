---
title: "BBOX"
layout: "function"
desc: "Computes the bounding box of a Geo Time Series"
categoryTree: ["reference","functions"]
category: "reference"
---
 
The `BBOX` function will scan a Geo Time Series to determine the bounding box of the locations present in the series.

It pushes onto the stack an array containing the latitude and longitude of the lower left and upper right corners of the computed bounding box.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS
0 48.0 -4.5 NaN 0 ADDVALUE
1 48.2 -4.4 NaN 1 ADDVALUE

BBOX
</warp10-warpscript-widget>
{% endraw %}    

## Unit Test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS
0 48.0 -4.5 NaN 0 ADDVALUE
1 48.2 -4.4 NaN 1 ADDVALUE

BBOX

LIST-> DROP

-4.400000022724271 == ASSERT
48.19999999366701 == ASSERT
-4.500000067055225 == ASSERT
47.99999998882413 == ASSERT
</warp10-warpscript-widget>
{% endraw %}    
