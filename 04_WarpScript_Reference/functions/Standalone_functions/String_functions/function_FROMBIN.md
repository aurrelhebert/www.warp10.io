---
title: "FROMBIN"
layout: function
desc: "Converts a binary representation of a long into a long."
category: reference
categoryTree: ["reference","functions"]
---

Converts the binary representation on top of the stack into the corresponding long.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'1111000' FROMBIN
</warp10-warpscript-widget>
{% endraw %}    

## Unit Test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'11110110011' FROMBIN
1971 == ASSERT
</warp10-warpscript-widget>
{% endraw %}    
