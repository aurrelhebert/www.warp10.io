---
title: "JSON->"
layout: function
isPage: "true"
link: "/warpscript/functions"
desc: "Parses a string as JSON and pushes the result onto the stack."
categoryTree: ["reference","functions"]
category: reference
---

The `JSON->` function parses a string as JSON from the top of the stack and pushes the result onto the stack.

## Example ##

WarpScript commands:

    '{"JSON": "STRING"}'
    JSON->

Stack: 

    TOP: {"JSON":"STRING"}

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
<'
{"menu": {
  "id": "file",
  "value": "File",
  "popup": {
    "menuitem": [
      {"value": "New", "onclick": "CreateNewDoc()"},
      {"value": "Open", "onclick": "OpenDoc()"},
      {"value": "Close", "onclick": "CloseDoc()"}
    ]
  }
}}}
'>
JSON->
</warp10-warpscript-widget>
{% endraw %}    