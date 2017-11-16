---
title: "Z->"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Decomposes a Z-Value."
categoryTree: ["reference","functions"]
category: "reference"
---
 
The `Z->` function decomposes [Z-Value](https://en.wikipedia.org/wiki/Z-order_curve) into individual components. It expects a bit width on top of the stack, a nuber of components to extract and a byte array containing the Z-Value.

The result is a list of extracted LONG values.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'cb20' HEX->
3 4 Z->
</warp10-warpscript-widget>
{% endraw %}        
