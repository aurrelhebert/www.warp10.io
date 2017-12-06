---
title: "BITCOUNT"
layout: function
desc: "Computes the length of a bitset and the number of bits set."
categoryTree: ["reference","functions"]
category: "reference"

---

The `BITCOUNT` function consume a bitset on the stack and push back the bitset length and the number of bits set to true (cardinality).
The cardinality is on the top.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Converts a binary string
'0010110001000101' BIN->
// into a bitset
BYTESTOBITS
// Get the bit count
BITCOUNT
// The expected bit length is 15 (on the top)
// The expected cardinality is 6 (on the top)
</warp10-warpscript-widget>
{% endraw %}  