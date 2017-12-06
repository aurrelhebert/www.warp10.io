---
title: "URLENCODE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "URL Encode a string"
category: "reference"
---
 
The `URLENCODE` function encodes a string using URL encoding and the UTF-8 charset.

It consumes the string from the top of the stack and pushes back the URL encoded version of the string. 

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'à á ã è é ẽ ì í ĩ ò ó õ'
URLENCODE
</warp10-warpscript-widget>
{% endraw %}    
