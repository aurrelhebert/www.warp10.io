---
title: "SENSISION.EVENT"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Emits a Sensision event."
categoryTree: ["reference","functions"]
category: "reference"
---
 
The `SENSISION.EVENT` function enables you to emit a Sensision event. The emitted event will be available through the Sensision event endpoint of the Warp 10 instance.

This function expects a list of three arguments on top of the stack. The arguments in the list are, in this order, the class name, the labels map and the value. Understand that the value will be converted to a String, so it's safer to use a String value in the argument list to ensure your value is correctly converted.

The `SENSISION.EVENT` function is part of the `io.warp10.script.ext.sensision.SensisionWarpScriptExtension`, this extenstion MUST be specified in the `warpscript.extensions` configuration parameter for it to be available.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
[ 'metric-class' { 'label-name' 'label-value' } 'event-value' ] SENSISION.EVENT
</warp10-warpscript-widget>
{% endraw %}        
