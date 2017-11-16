---
title: "SETATTRIBUTES"
layout: function
isPage: "true"
desc: "Set attributes of a GTS."
categoryTree: ["reference","functions"]
category: "reference"
signature: "gts { attributes }  SETATTRIBUTES gts"
---

The `SETATTRIBUTES` function is used to set the attributes of a GTS. An attributes corresponds to a tag for a specific serie. The attribute system allow the user to add some information that can change to a serie.
This function takes a GTS and a Map including the attributes to set on top of the stack and push back the same gts with those attributes added. 

```
gts { attributes }  SETATTRIBUTES gts
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
</warp10-warpscript-widget>
{% endraw %}