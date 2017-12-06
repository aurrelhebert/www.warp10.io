---
title: "->Z"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Builds a z-value."
categoryTree: ["reference","functions"]
category: "reference"
---
 
The `->Z` function builds a [Z-Value](https://en.wikipedia.org/wiki/Z-order_curve) from a list of positive LONG values. The function expects a bitwidth from 1 to 63 on top of the stack and a below it a list of positive LONG values.

The result is a Z-Value in a byte array, right padded with 0 bits.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[ 0b1010 0b1111 0b0000 ] 4 ->Z
->BIN
</warp10-warpscript-widget>
{% endraw %}        
