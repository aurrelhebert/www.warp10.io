---
title: "RSAPUBLIC"
layout: function
desc: "Produce a RSA public key from a parameter map."
category: reference
---

The `RSAPUBLIC` function produces a [RSA](https://en.wikipedia.org/wiki/RSA_(cryptosystem)) public key from a parameter map.


### Key Parameter map ###

    {"modulus":"164...","algorithm":"RSA","exponent":"187..."}


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Public key generated with RSAGEN
{ 
  'modulus' '164133450757710382968912915165051196881624669604703246280679784983820484318045655166954408023359951705031335503213227203085909362902834272131213868643767612636690902660796727383038573535788124162637672291952165381690816449044903562458715031741315160286534573066564512718882445462667253464773985205507695181381' 
  'algorithm' 'RSA' 
  'exponent' '18798739827293729372983789372893792873982739287' 
}
RSAPUBLIC
// The public key is on the top of the stack, but not displayable in JSON
</warp10-warpscript-widget>
{% endraw %}  