---
title: "RSAENCRYPT"
layout: function
desc: "Encrypt data using RSA keys"
category: reference
---

The `RSAENCRYPT` function encrypts data using  [RSA](https://en.wikipedia.org/wiki/RSA_(cryptosystem)) keys.


Expects a key produced by [RSAPRIVATE]({{ site.baseurl }}/reference/functions/function_RSAPRIVATE) or [RSAPUBLIC]({{ site.baseurl }}/reference/functions/function_RSAPUBLIC) on the top of the stack

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// data to encrypt
'my secret marty' 'UTF-8' ->BYTES
// Public key generated with RSAGEN
{ 
  'modulus' '164133450757710382968912915165051196881624669604703246280679784983820484318045655166954408023359951705031335503213227203085909362902834272131213868643767612636690902660796727383038573535788124162637672291952165381690816449044903562458715031741315160286534573066564512718882445462667253464773985205507695181381' 
  'algorithm' 'RSA' 
  'exponent' '18798739827293729372983789372893792873982739287' 
}
RSAPUBLIC
// Encrypt data with the public key 
RSAENCRYPT
// Hexa representation of encrypted data
->HEX
</warp10-warpscript-widget>
{% endraw %}  