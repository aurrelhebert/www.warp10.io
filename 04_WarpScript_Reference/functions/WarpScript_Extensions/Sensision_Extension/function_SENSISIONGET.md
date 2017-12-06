---
title: "SENSISION.GET"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Set a value for a Sensision metric."
categoryTree: ["reference","functions"]
category: "reference"
---
 
The `SENSISION.GET` function enables you to retrieve the current value of a Sensision metric.

The function expects an exact Geo Time Series selector or a label map and a class name on the stack.

The function will push on the stack a Geo Time Series with the current value of the specified metric.

The `SENSISION.GET` function is part of the `io.warp10.script.ext.sensision.SensisionWarpScriptExtension`, this extenstion MUST be specified in the `warpscript.extensions` configuration parameter for it to be available.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
'warp.revision' { 'component' 'egress' } SENSISION.GET
'warp.revision{component=egress}' SENSISION.GET
</warp10-warpscript-widget>
{% endraw %}        
