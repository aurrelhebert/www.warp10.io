---
title: "REPLACE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Replaces the first substring of the input string that matches the given regular expression with the given replacement."
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `REPLACE` function replaces the first substring of the input string that matches the given regular expression with the given replacement.


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
'These are not the strings you are looking for' // input
'(string)' // regexp
'droid'    // replacement
REPLACE
</warp10-warpscript-widget>
{% endraw %}    