---
title: "QCONJUGATE"
layout: function
desc: "Compute the conjugate of a quaternion."
categoryTree: ["reference","functions"]
category: "reference"

---

The `QCONJUGATE` computes the conjugate of a [quaternion](https://en.wikipedia.org/wiki/Quaternion) and push back the `quaternion conjugate` into a long.


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// rotate by 180 degrees about y axis
0.0 0.0 1.0 0.0 ->Q
// conjugate it
QCONJUGATE
Q->
</warp10-warpscript-widget>
{% endraw %} 