---
title: "QDIVIDE"
layout: function
desc: "Divide a quaternion q by a quaternion r"
categoryTree: ["reference","functions"]
category: "reference"

---

The `QDIVIDE` divides a quaternion q by a quaternion r and push back the result of multiplying them.


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// rotate by 180 degrees about y axis
0.0 0.0 1.0 0.0 ->Q
// divide by 90 degrees about y axis
0.7071 0.0 0.7071 0.0 ->Q
QDIVIDE
Q->
// the expected Quaternion representing 90 degrees about y axis
</warp10-warpscript-widget>
{% endraw %} 