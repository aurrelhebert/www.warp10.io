---
title: "RSAVERIFY"
layout: function
desc: "Sign data using RSA and a hash algorithm."
category: reference
---

The `RSAVERIFY` function verify a signature generated with [RSA](https://en.wikipedia.org/wiki/RSA_(cryptosystem)) cryptosystem and a hash algorithm.

Algorithms are those supported by BouncyCastle. More information [here](http://stackoverflow.com/questions/8778531/bouncycastle-does-not-find-algorithms-that-it-provides).

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Data to verify
'These are not the droids you are looking for' 'UTF-8' ->BYTES

// signature
'ce0c3ebd3e1dcf2ec00c9cd3207ca6ab4f5a8d0c1c040ef74a6b43369361977d3664a4f1cf4d7a3c0626c646cc6f31bf75b93093ae28cced716b2a2fc4f042cf998f4d94dc50a1105d1ce30af5deb4ffbae0646c5e2b7436da99dfc6885968568a7c8d84d256e9f0a69f30d881243bcb6e5e10ea62497a9a140799e59d87ce81' HEX->

// Sign algorithm used
'SHA512WithRSAEncryption'

// Expect a Public key
{ 
  'modulus' '164133450757710382968912915165051196881624669604703246280679784983820484318045655166954408023359951705031335503213227203085909362902834272131213868643767612636690902660796727383038573535788124162637672291952165381690816449044903562458715031741315160286534573066564512718882445462667253464773985205507695181381' 
  'algorithm' 'RSA' 
  'exponent' '18798739827293729372983789372893792873982739287' 
}
RSAPUBLIC

RSAVERIFY

// push if the signature is verified or not (true/false)

</warp10-warpscript-widget>
{% endraw %}  