---
title: "AESWRAP"
layout: function
desc: "Wrap a byte array or String with AES cypher"
category: reference
categoryTree: ["reference","functions"]
signature: "'string' or 'bytesarray' AESWRAP 'bytesarray'"
---

Wraps a byte array or String with the [AES WRAP](https://www.ietf.org/rfc/rfc3394.txt) and pushes back the encrypted data into an bytes array.


AESWRAP adds a 64bits [nonce](https://en.wikipedia.org/wiki/Cryptographic_nonce) on order to be protected against AES block determinism ([AES WRAP](https://www.ietf.org/rfc/rfc3394.txt) have a fixed IV) 


The function expects the following elements on the stack:

    1: string or byte array (data to wrap)
    TOP: key (AES key, byte array containing a 128, 192 or 256 bits)

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
'My secret message'  // Data to cypher 
'0123456789ABCDEF0123456789ABCDEF' HEX-> // AES KEY
AESWRAP
// byte array content is not converted into JSON
// converted into hex string for the example
->HEX
'My secret message'  // Data to cypher 
'0123456789ABCDEF0123456789ABCDEF' HEX-> // AES KEY
AESWRAP
// byte array content is not converted into JSON
// converted into hex string for the example
->HEX
//Wrap the same content 2 times will never product the same result 
</warp10-warpscript-widget>
{% endraw %}   