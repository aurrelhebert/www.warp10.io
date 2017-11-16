---
title: "RSASIGN"
layout: function
desc: "Sign data using RSA and a hash algorithm."
category: reference
---

The `RSASIGN` function sign data using [RSA](https://en.wikipedia.org/wiki/RSA_(cryptosystem)) cryptosystem and a hash algorithm.

Algorithms are those supported by BouncyCastle. More information [here](http://stackoverflow.com/questions/8778531/bouncycastle-does-not-find-algorithms-that-it-provides).

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Data to sign
'These are not the droids you are looking for' 'UTF-8' ->BYTES

// Sign algorithm used
'SHA512WithRSAEncryption'

// Expect a Private key only
{
  'modulus' '164133450757710382968912915165051196881624669604703246280679784983820484318045655166954408023359951705031335503213227203085909362902834272131213868643767612636690902660796727383038573535788124162637672291952165381690816449044903562458715031741315160286534573066564512718882445462667253464773985205507695181381'
  'algorithm' 'RSA'
  'exponent' '53568347653081389330106675263341353687198370948780377563346269159667038628656708478678729461969541867256006981964066841548365841882316241277162571263516064258258986612132679136884859639305399187094246811599007259767495181399279755621148639319026601057592295101499275146643124242709955874350522265660336149223'
}
RSAPRIVATE

RSASIGN
// Hex representation of the signature
->HEX
</warp10-warpscript-widget>
{% endraw %}  