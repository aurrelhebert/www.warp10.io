---
title: "TOBOOLEAN"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Converts number or string to boolean"
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `TOBOOLEAN` function consumes a parameter (string, number) from the top of the stack and pushes back its conversion to boolean, if it is possible.

When conversion is not possible (e.g. `'' TOBOOLEAN`) we get an error.


## Example ##

WarpScript commands:

    '42' TOBOOLEAN
    0 TOBOOLEAN
    1 TOBOOLEAN

Stack: 

    TOP: true
    1:   false
    2:   true    

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
'42' TOBOOLEAN // non null string is true
0 TOBOOLEAN
1 TOBOOLEAN
</warp10-warpscript-widget>
{% endraw %}    


