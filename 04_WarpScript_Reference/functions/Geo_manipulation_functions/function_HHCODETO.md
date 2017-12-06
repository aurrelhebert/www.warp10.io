---
title: "HHCODE->"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Converts an HHCode to a lat/lon."
categoryTree: ["reference","functions"]
category: "reference"
---
 
The `HHCODE->` function decomposes an [HHCode](https://en.wikipedia.org/wiki/HHCode) into a latitude and longitude. The HHCode can be a LONG, a STRING or a byte array.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">''
HHCODE->
</warp10-warpscript-widget>
{% endraw %}        
