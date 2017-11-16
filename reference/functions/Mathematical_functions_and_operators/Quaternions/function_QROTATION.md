---
title: "QROTATION"
layout: function
desc: "Extract the axis and angle of the rotation represented by the quaternion on the stack."
categoryTree: ["reference","functions"]
category: "reference"

---

The `QROTATION` extracts the axis and angle of the rotation represented by the quaternion on the stack.


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// rotate by 180 degrees about y axis
0.0 0.0 1.0 0.0 ->Q
QROTATION
// Extract the rotation (180)
// Extract the axis (0 1 0 -z-y-x-)

</warp10-warpscript-widget>
{% endraw %} 