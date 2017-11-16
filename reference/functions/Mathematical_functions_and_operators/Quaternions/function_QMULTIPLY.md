---
title: "QMULTIPLY"
layout: function
desc: "Multiply a quaternion q by a quaternion r"
categoryTree: ["reference","functions"]
category: "reference"

---

The `QMULTIPLY` multiply a quaternion q by a quaternion r and push back the result of multiplying them.


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// rotate by 90 degrees about y axis
0.7071 0.0 0.7071 0.0 ->Q
0.7071 0.0 0.7071 0.0 ->Q
QMULTIPLY
Q->
// the expected Quaternion  0 0 1 0

</warp10-warpscript-widget>
{% endraw %} 