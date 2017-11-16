---
title: "RSAGEN"
layout: function
desc: "Generates a RSA key pair."
category: reference
---

The `RSAGEN` function generates a [RSA](https://en.wikipedia.org/wiki/RSA_(cryptosystem)) key pair.
For explanation about RSA Keygen parameters please refer to this [nabble](http://bouncy-castle.1462172.n4.nabble.com/Questions-about-RSAKeyGenerationParameters-td1463186.html)

Key parameters of public and private keys are pushed on the stack.
The public key parameters are on the top of the stack.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Exponent
'18798739827293729372983789372893792873982739287'
// Key length
1024
RSAGEN
</warp10-warpscript-widget>
{% endraw %}  