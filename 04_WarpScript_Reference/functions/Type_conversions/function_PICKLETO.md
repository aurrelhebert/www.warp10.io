---
title: "PICKLE->"
layout: function
isPage: "true"
link: "/warpscript/functions"
desc: "Decodes Pickle content."
categoryTree: ["reference","functions"]
category: reference
---

The `PICKLE->` function decodes some [Pickle](https://en.wikipedia.org/wiki/Pickle_(Python)) encoded content contained in a byte array.

The conversion is done using [Pyrolite](https://github.com/irmen/Pyrolite).

## Example ##
{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
'80027d71002858060000005049434b4c4571015806000000535452494e477102752e'
HEX->
PICKLE->
</warp10-warpscript-widget>
{% endraw %}    
