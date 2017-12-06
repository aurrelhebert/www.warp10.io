---
title: "QROTATE"
layout: function
desc: "Rotate a vector by a quaternion"
categoryTree: ["reference","functions"]
category: "reference"

---

The `QROTATE` function rotates a vector by a quaternion. QROTATE consumes on the stack a quaternion ans a vector (x y z with z being on top) push back the result vector of the rotation by the quaternion (z being on top)


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">

0.0 //X
0.0 //Y
1.0 //Z
// rotate by 90 degrees about y axis
0.7071 0.0 0.7071 0.0 ->Q
QROTATE
</warp10-warpscript-widget>
{% endraw %} 