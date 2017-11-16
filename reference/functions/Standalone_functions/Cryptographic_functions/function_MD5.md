---
title: "MD5"
layout: function
desc: "Message Digest of a byte array with the cryptographic hash function MD5."
category: reference
---

The `MD5` function digests a byte array on the stack with the cryptographic hash function [MD5](https://en.wikipedia.org/wiki/MD5). 

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Converts a string to digest into byte array
'something to hash' 'UTF-8' ->BYTES
// apply MD5 cryptographic hash function
MD5
// hex representation of the MD5 message digest
->HEX
</warp10-warpscript-widget>
{% endraw %}  