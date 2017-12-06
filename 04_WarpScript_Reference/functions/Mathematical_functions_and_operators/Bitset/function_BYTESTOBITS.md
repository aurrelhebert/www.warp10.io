---
title: "BYTESTOBITS"
layout: function
desc: "Converts a byte array into a bitset."
categoryTree: ["reference","functions"]
category: "reference"

---

The `BYTESTOBITS` Converts a byte array into a bitset.


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Converts a binary string
'0010110001000011' BIN->
// convert it into a bitset
BYTESTOBITS
// bytes array are not displayable on the stack
</warp10-warpscript-widget>
{% endraw %}  