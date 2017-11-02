---
title: "AESUNWRAP"
layout: function
desc: "Unwrap wrapped byte array "
category: reference
categoryTree: ["reference","functions"]
signature: "'bytesarray' AESUNWRAP 'bytesarray'"
---

Unwraps a byte array with the [AES WRAP](https://www.ietf.org/rfc/rfc3394.txt) and pushes back the decrypted data into an bytes array.


AESUNWRAP removes the a 64bits [nonce](https://en.wikipedia.org/wiki/Cryptographic_nonce) added by AESWRAP warpscript function


The function expects the following elements on the stack:

    1: byte array (data to unwrap)
    TOP: key (AES key, byte array containing a 128, 192 or 256 bits)

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
'b43e1e4f6adfa18dc35465a2e12a2c824daf2ffafd0a947b7766a33045a76a676463b8e0b1c112de' HEX-> // Wrapped data
'0123456789ABCDEF0123456789ABCDEF' HEX-> // AES KEY
AESUNWRAP
// CONVERT UNWRAP DATA  INTO STRING
'UTF-8' BYTES->
</warp10-warpscript-widget>
{% endraw %}   