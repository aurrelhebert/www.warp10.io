---
title: "->HHCODE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Converts lat/lon to an Helical Hyperspatial Code (HHCode)."
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `->HHCODE` function generates an [HHCode](https://en.wikipedia.org/wiki/HHCode) from a latitude and longitude as floating point degrees. The generated HHCode is a String of hexadecimal numbers. It can be converted to a LONG via `FROMHEX` or to a byte array via `HEX->`.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">48.00 -4.565
->HHCODE
DUP
FROMHEX
</warp10-warpscript-widget>
{% endraw %}        
