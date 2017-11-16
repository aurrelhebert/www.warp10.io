---
title: "REPLACEALL"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Replaces all substrings of the input string that matches the given regular expression with the given replacement."
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `REPLACEALL` function replaces all substrings of the input string that matches the given regular expression with the given replacement.


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
'These is not the droids you is looking for' // input
'(is)' // regexp
'are'  // replacement
REPLACE
</warp10-warpscript-widget>
{% endraw %}    