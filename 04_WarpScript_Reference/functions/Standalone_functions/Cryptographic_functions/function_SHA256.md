---
title: "SHA256"
layout: function
desc: "Message Digest of a byte array with the cryptographic hash function SHA256."
category: reference
---

The `SHA256` function digests a byte array on the stack with the cryptographic hash function [SHA-256](https://en.wikipedia.org/wiki/SHA-2). 

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Converts a string to digest into byte array
'something to hash' 'UTF-8' ->BYTES
// apply SHA-256 cryptographic hash function
SHA256
// hex representation of the SHA-256 message digest
->HEX
</warp10-warpscript-widget>
{% endraw %}  