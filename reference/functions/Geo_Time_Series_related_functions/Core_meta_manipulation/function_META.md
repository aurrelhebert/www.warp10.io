---
title: "META"
layout: "function"
desc: "Sets the attributes of a list of Geo Time Series in the Warp 10 backend."
category: "reference"
---
 
Stores the attributes of a list of Geo Time Series in the Warp 10 backend.

This function expects on top of the stack a write token which will be used to authenticate with the Warp 10 backend and a Geo Time Series or a list thereof.

Every Geo Time Series to which `META` is applied must have a non empty name and attributes (possibly empty).

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS
'aaa' RENAME
{ 'label1' 'b' 'label2' 'a' } RELABEL
// Only GTS with attributes can be modified with META
{ 'attr1' 'val1' 'attr2' 'val2' } SETATTRIBUTES

'WRITE_TOKEN'
META
</warp10-warpscript-widget>
{% endraw %}    

