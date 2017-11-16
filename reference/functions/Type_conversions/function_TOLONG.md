---
title: "TOLONG"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Convert a number to long"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","750-function_TOLONG.html.md"]
category: "reference"
---
 

The `TOLONG` function consumes a parameter (string, boolean, number) from the top of the stack and pushes back its conversion to long, if it is possible.

The boolean *true* is converted to 1 and *false* to 0.

Direct conversion from double to long is not possible using `TOLONG`, you should use one of the rounding functions 
([`ROUND`]({{ site.baseurl}}/reference/functions/function_ROUND), [`CEIL`]({{ site.baseurl}}/reference/functions/function_CEIL), [`FLOOR`]({{ site.baseurl}}/reference/functions/function_FLOOR)).   

When conversion is not possible (e.g. `'a' TOLONG`) we get an error.


## Example ##

WarpScript commands:

    '42'
    TOLONG
    true
    TOLONG

Stack: 

    TOP: 1.0
    1:   42.0


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'42'
TOLONG
true
TOLONG
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'42'
TOLONG
true
TOLONG
1 == ASSERT
42 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
