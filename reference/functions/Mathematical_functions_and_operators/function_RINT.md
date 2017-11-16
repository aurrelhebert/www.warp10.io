---
title: "RINT"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Return the DOUBLE closest to the value and equal to a mathematical integer"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","9160-function_RINT.html.md"]
category: "reference"
---
 

The `RINT` function consumes a numeric parameter from the top of the stack and pushes back the DOUBLE the closest to the parameter and equal to a mathematical integer. Ties are rounded to the closest even integer.


## Example ##

Initial stack:

    TOP: 42.42


WarpScript commands:

    RINT

Stack: 

    TOP: 42.0


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42.42 
RINT
42.75
RINT
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42.42 
RINT
42.0 == ASSERT
42.75
RINT
43.0 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
