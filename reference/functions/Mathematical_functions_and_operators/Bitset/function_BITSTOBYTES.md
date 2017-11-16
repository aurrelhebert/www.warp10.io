---
title: "BITSTOBYTES"
layout: function
desc: "Converts a bitset into a byte array."
categoryTree: ["reference","functions"]
category: "reference"

---

The `BITSTOBYTES` Converts a bitset into a byte array.


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// converts a string into byte array
'42' 'UTF-8' ->BYTES
// converts it into a bitset
BYTESTOBITS
// converts it back into a byte array
BITSTOBYTES
// converts a bytes array into String
'UTF-8' BYTES->
</warp10-warpscript-widget>
{% endraw %}  