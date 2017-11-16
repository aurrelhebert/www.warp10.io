---
title: "->Q"
layout: function
desc: "Converts 4 double to a unit quaternion."
categoryTree: ["reference","functions"]
category: "reference"

---

The `->Q` function consume on the stack 4 doubles (w x y z with z being on top) representing a [quaternion](https://en.wikipedia.org/wiki/Quaternion) and push back quaternion representation into a long. 

Each quaternion dimension is encoded with 16bits.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// rotate by 90 degrees about y axis
0.7071 // w
0.0    // x
0.7071 // y
0.0    // z
->Q
</warp10-warpscript-widget>
{% endraw %} 