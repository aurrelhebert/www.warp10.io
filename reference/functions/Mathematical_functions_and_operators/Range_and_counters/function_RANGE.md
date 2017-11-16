---
title: "RANGE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Pushes onto the stack a list of integers in the given range."
categoryTree: ["reference","functions"]
category: "reference"
---
 
Pushes onto the stack a list of integers in the given range (start included, end excluded). 

The function expects the following elements on the stack:

      3: [
      2: start step
      1: end step
    TOP: ]

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
[ 1 10 ] RANGE
</warp10-warpscript-widget>
{% endraw %}    
