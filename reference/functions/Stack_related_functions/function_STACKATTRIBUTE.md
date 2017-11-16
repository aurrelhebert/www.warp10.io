---
title: "STACKATTRIBUTE"
layout: function
desc: "Extract the stack attributes and push them on top of the stack"
categoryTree: ["reference","functions"]
category: "reference"

---

The `STACKATTRIBUTE` function extracts a stack attribute and push it on top of the stack.

The list a all attributes available in a warpscript stack are available [here](https://github.com/cityzendata/warp10-platform/blob/master/warp10/src/main/java/io/warp10/script/WarpScriptStack.java). 

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Generate operations
1 10 <% DROP %> FOR
// retrieve attribute of number of operations executed 
// from the beginning of this script
'stack.ops'
STACKATTRIBUTE
</warp10-warpscript-widget>
{% endraw %} 