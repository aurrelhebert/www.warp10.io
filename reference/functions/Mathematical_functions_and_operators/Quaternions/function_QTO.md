---
title: "Q->"
layout: function
desc: "Converts 4 double to a unit quaternion."
categoryTree: ["reference","functions"]
category: "reference"

---

The `Q->` function consume on the stack a [quaternion](https://en.wikipedia.org/wiki/Quaternion) representation into a long and push back the quaternion into 4 doubles (w x y z with z being on top).

Each quaternion dimension is encoded with 16bits.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// rotate by 90 degrees about y axis
-2701737564586279000
Q->
</warp10-warpscript-widget>
{% endraw %} 