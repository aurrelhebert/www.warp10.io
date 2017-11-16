---
title: "BITGET"
layout: function
desc: "Gets a bit in a bits set."
categoryTree: ["reference","functions"]
category: "reference"

---

The `BITGET` function gets a bit in a bits set.
The bit index starts at 0 from the left.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Converts a binary string
'0010110001000011' BIN->
// convert it into a bitset
BYTESTOBITS
// Get the bit at the index 2 (value 1)
2
BITGET
</warp10-warpscript-widget>
{% endraw %}  