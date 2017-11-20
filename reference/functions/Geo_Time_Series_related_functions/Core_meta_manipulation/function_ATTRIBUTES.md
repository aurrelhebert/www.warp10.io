---
title: "ATTRIBUTES"
layout: function
isPage: "true"
desc: "Retrieves the attributes of a GTS."
categoryTree: ["reference","functions"]
category: reference
signature: "gts ATTRIBUTES { attributes }"
---

The `ATTRIBUTES` function is used to retrieve the attributes of a GTS. An attributes corresponds to a tag for a specific serie. The attribute system allow the user to add some information that can change to a serie.
This function takes a GTS on top of the stack and push back a Map including all its attributes. 

```
gts ATTRIBUTES { attributes }
```

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Create a new GTS
NEWGTS 
'test name'
RENAME
// Add some attributes to the serie
{ 'myAttribute' '42' 'AnOtherAttribute' 'foo' }
SETATTRIBUTES
// Extract the GTS attributes
ATTRIBUTES
</warp10-warpscript-widget>
{% endraw %}
