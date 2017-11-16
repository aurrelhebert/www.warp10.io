---
title: "MATCHER"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Builds a compiled object form a regular expression."
categoryTree: ["reference","functions"]
category: "reference"
---
 
The `MATCHER` function will compile a regular expression into an efficient object which can be used by [MATCH]({{ site.baseurl }}/reference/functions/function_MATCH).

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'abc def ghi jkl'
'([^ ].*) ([^ ].*) [^ ].* [^ ].*' MATCHER
MATCH
</warp10-warpscript-widget>
{% endraw %}    

