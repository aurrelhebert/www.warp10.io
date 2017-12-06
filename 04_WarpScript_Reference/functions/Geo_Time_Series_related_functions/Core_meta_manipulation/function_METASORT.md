---
title: "METASORT"
layout: "function"
desc: "Sorts a list of Geo Time Series according to their metadata (class + labels)."
category: "reference"
---
 
Sorts a list of Geo Time Series according to their metadata (class + labels). The function expects a list of metadata names as input, specifying the elements to use for sorting (class and labels) and the order in which to use them. Specify either the name of the label to use or NULL to use the class name.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS
'aaa' RENAME { 'label1' 'b' 'label2' 'a' } RELABEL
NEWGTS 'bbb' RENAME { 'label1' 'a' 'label2' 'b' } RELABEL
2 ->LIST

[ NULL 'label1' ] METASORT
DUP
[ 'label2' ] METASORT
</warp10-warpscript-widget>
{% endraw %}    
