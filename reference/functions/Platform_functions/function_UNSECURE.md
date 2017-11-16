---
title: "UNSECURE"
layout: "function"
link: "/warpscript/functions"
desc: "Retrieve the original script from a secure script."
category: "reference"
---

The `UNSECURE` function retrieve the original script from a [secured scripts]({{ site.baseurl}}/reference/functions/securedscripts).

In the example the secured script contains the statements '3 DROPN' protected with the [SECUREKEY]({{ site.baseurl}}/reference/functions/function_SECUREKEY) 'SecretKeyDoc'


## Example ##

Stack:

    
    TOP: 'PaymNOufBVMAKDKAv2NM5T44nDEs1zLJg5VZG_owYc8_stv4_smI7uU5ixi9RZIj'
    1:   'SecretKeyDoc' SECUREKEY

WarpScript commands:
    
    UNSECURE

Stack:

    
    TOP: '3 DROPN'

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
'SecretKeyDoc' SECUREKEY
'PaymNOufBVMAKDKAv2NM5T44nDEs1zLJg5VZG_owYc8_stv4_smI7uU5ixi9RZIj'
UNSECURE
</warp10-warpscript-widget>
{% endraw %}