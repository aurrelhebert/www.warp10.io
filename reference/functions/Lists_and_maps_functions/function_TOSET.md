---
title: "->SET"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Converts the list on top of the stack into a set"
categoryTree: ["reference","functions"]
category: "reference"
---
 
The `->SET` function converts a LIST on top of the stack into a SET. 

SETs are not viewable, `null` will be return if it remains on the stack  

## Example ##

WarpScript commands:

    [ 4 3 2 ] ->SET

Stack:

    TOP: null (stack object not viewable)

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
[ 4 3 2 ] ->SET
</warp10-warpscript-widget>
{% endraw %}    
