---
title: "URLDECODE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Decode an URL encoded string"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","15-standalone","250-function_URLDECODE.html.md"]
category: "reference"
---
 

The `URLDECODE` function decodes an [URL Encoded]() string using UTF-8 as the encoding.

It consumes a string from the top of the stack and pushes back the URL Decoded version of the string. 

## Example ##


WarpScript commands:

    '%C3%A0+%C3%A1+%C3%A3+%C3%A8+%C3%A9+%E1%BA%BD+%C3%AC+%C3%AD+%C4%A9+%C3%B2+%C3%B3+%C3%B5'
    URLDECODE

Stack: 

    TOP: "à á ã è é ẽ ì í ĩ ò ó õ"

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'%C3%A0+%C3%A1+%C3%A3+%C3%A8+%C3%A9+%E1%BA%BD+%C3%AC+%C3%AD+%C4%A9+%C3%B2+%C3%B3+%C3%B5'
URLDECODE
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'%C3%A0+%C3%A1+%C3%A3+%C3%A8+%C3%A9+%E1%BA%BD+%C3%AC+%C3%AD+%C4%A9+%C3%B2+%C3%B3+%C3%B5'
URLDECODE
'à á ã è é ẽ ì í ĩ ò ó õ' == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %} 
