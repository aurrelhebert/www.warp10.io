---
title: "ROTATIONQ"
layout: function
desc: "Create a quaternion from an axis and rotation angle (in degrees)"
categoryTree: ["reference","functions"]
category: "reference"

---

The `ROTATIONQ` function consume on the stack 4 doubles (x y z angle with angle being on top) representing a rotation vector and push back quaternion representation into a long. 

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// rotate by 180 degrees about y axis
0.0 1.0 0.0
180.0
ROTATIONQ
// Quaternion into a long 
// convert it into w x y z
Q->
</warp10-warpscript-widget>
{% endraw %} 