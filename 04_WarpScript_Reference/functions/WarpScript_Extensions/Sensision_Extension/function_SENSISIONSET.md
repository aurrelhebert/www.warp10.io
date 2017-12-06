---
title: "SENSISION.SET"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Set a value for a Sensision metric."
categoryTree: ["reference","functions"]
category: "reference"
---
 
The `SENSISION.SET` function enables you to set a value for a Sensision metric. The set metric will be available through the Sensision endpoint of the Warp 10 instance.

This function expects a list of arguments on top of the stack. The list can contain three or four parameters. See the example below.

The `SENSISION.SET` function is part of the `io.warp10.script.ext.sensision.SensisionWarpScriptExtension`, this extenstion MUST be specified in the `warpscript.extensions` configuration parameter for it to be available.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
//
// Set a metric value
//
[ 'metric-class' { 'label-name' 'label-value' } 'metric-value' ] SENSISION.SET

//
// A TTL can also be specified (in ms)
//
[ 'ephemeral-metric-class' { 'label-name' 'label-value' } 'metric-value' 1000 ] SENSISION.SET
</warp10-warpscript-widget>
{% endraw %}        
