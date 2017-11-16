---
title: "SHA256HMAC"
layout: function
desc: "Computes a Hash-based Message Authentication Code (HMAC) that uses a key in conjunction with a SHA-256 cryptographic hash function."
category: reference
---

The `SHA256HMAC` function computes a Hash-based Message Authentication Code [HMAC](https://en.wikipedia.org/wiki/Hash-based_message_authentication_code) that uses a key in conjunction with a [SHA-256](https://en.wikipedia.org/wiki/SHA-2) cryptographic hash function.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Converts a string to authenticate into byte array
'message to be authenticated' 'UTF-8' ->BYTES
// Secret key into byte array
'secret authentication key' 'UTF-8' ->BYTES
// compute SHA256-HASHMAC
SHA256HMAC
// hex representation of the MAC (message authentication code)
->HEX
</warp10-warpscript-widget>
{% endraw %}  