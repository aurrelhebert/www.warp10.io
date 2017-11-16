---
title: "SHA1"
layout: function
desc: "Message Digest of a byte array with the cryptographic hash function SHA1."
category: reference
---

The `SHA1` function digests a byte array on the stack with the cryptographic hash function [SHA-1](https://en.wikipedia.org/wiki/SHA-1). 

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Converts a string to digest into byte array
'something to hash' 'UTF-8' ->BYTES
// apply SHA-1 cryptographic hash function
SHA1
// hex representation of the SHA-1 message digest
->HEX
</warp10-warpscript-widget>
{% endraw %}  