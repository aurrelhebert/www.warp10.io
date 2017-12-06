---
title: "MAKEGTS"
layout: function
desc: "Builds a GTS from arrays."
categoryTree: ["reference","functions"]
category: "reference"

---

The `MAKEGTS` function builds a GTS from arrays.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// TIMESTAMPS
[ 1479477641973000 1479391241973000 1479304841973000 ] 
// LATITUTE
[ 48.4000000 48.4000000 48.4000000 ]
// LONGITUDE
[ -4.4833300 -4.4833300 -4.4833300 ] 
// ELEVATION
[ 59000 59000 59000 ] 
// VALUES
[ 41 42 43 ] 
MAKEGTS
</warp10-warpscript-widget>
{% endraw %}  