---
title: "EVALSECURE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Evaluates the secured script on top of the stack"
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `EVALSECURE` function evaluates the statements contained in the [secured scripts]({{ site.baseurl}}/reference/functions/securedscripts) at the top of the stack.
In the example the secured script contains the statements '3 DROPN' will be evaluated wich call the function [`DROPN`]({{ site.baseurl }}/reference/functions/function_DROPN) with a parameter equals to 3. 

Stack:

    
    TOP: 'PaymNOufBVMAKDKAv2NM5T44nDEs1zLJg5VZG_owYc8_stv4_smI7uU5ixi9RZIj'
    1:   'a'
    2:   'b'
    3:   'c'
    4:   'd'

WarpScript commands:
    
    EVALSECURE

Stack:

    
    TOP: 'd'

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'d' 'c' 'b' 'a' 
'PaymNOufBVMAKDKAv2NM5T44nDEs1zLJg5VZG_owYc8_stv4_smI7uU5ixi9RZIj'
EVALSECURE
</warp10-warpscript-widget>
{% endraw %}
