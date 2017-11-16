---
title: "ISO8601"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Transform a timestamp into a date in ISO 8601 format"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","15-standalone","150-function_ISO8601.html.md"]
category: "reference"
---
 

The `ISO8601` function replaces the timestamp on the stack with an [ISO8601](http://en.wikipedia.org/wiki/ISO_8601) string representation of its instant.


## Example ##

Initial stack:

    TOP: 1412744597705487

WarpScript commands:

    ISO8601

Stack: 

    TOP: "2014-10-08T05:03:17.705487Z"

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NOW
ISO8601
</warp10-warpscript-widget>
{% endraw %}    
