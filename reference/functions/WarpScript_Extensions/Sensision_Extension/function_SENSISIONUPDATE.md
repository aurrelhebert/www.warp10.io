---
title: "SENSISION.UPDATE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Update a value for a numerical Sensision metric."
categoryTree: ["reference","functions"]
category: "reference"
---
 
The `SENSISION.UPDATE` function enables you to update a value for a numerical Sensision metric. The updated metric will be available through the Sensision endpoint of the Warp 10 instance.

This function expects a list of arguments on top of the stack. The list can contain three or four parameters. See the example below.

The `SENSISION.UPDATE` function is part of the `io.warp10.script.ext.sensision.SensisionWarpScriptExtension`, this extenstion MUST be specified in the `warpscript.extensions` configuration parameter for it to be available.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
//
// Update a metric value
//
[ 'metric-class' { 'label-name' 'label-value' } 1 ] SENSISION.UPDATE

//
// A TTL can also be specified (in ms)
//
[ 'ephemeral-metric-class' { 'label-name' 'label-value' } -1 1000 ] SENSISION.UPDATE
</warp10-warpscript-widget>
{% endraw %}        
