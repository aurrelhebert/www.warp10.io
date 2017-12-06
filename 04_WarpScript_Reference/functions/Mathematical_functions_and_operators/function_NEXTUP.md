---
title: "NEXTUP"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Returns the DOUBLE  adjacent to the argument in the direction of positive infinity"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","9170-function_NEXTUP.html.md"]
category: "reference"
---
 

The `NEXTUP` function consumes a numeric parameter from the top of the stack and pushes back the next DOUBLE in the direction of positive infinity.


## Example ##

Initial stack:

    TOP:  42.42


WarpScript commands:

    NEXTUP

Stack: 

    TOP: 42.42000000000001


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42.42 
NEXTUP
42
NEXTUP
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42.42 
NEXTUP
42.42000000000001 == ASSERT
42
NEXTUP
42.00000000000001 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
