---
title: "TSELEMENTS"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Replaces the timestamp with an array of its elements"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","15-standalone","100-function_TSELEMENTS.html.md"]
category: "reference"
---
 

The `TSELEMENTS`function applies to a timestamp. It replaces the timestamp with an array of
its *elements*. 

Alias of [-&gt;TSELEMENTS]({{ site.baseurl }}/reference/functions/function_TOTSELEMENTS) function.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">1434568904758000 TSELEMENTS
1434568904758000 'America/Los_Angeles' TSELEMENTS
</warp10-warpscript-widget>
{% endraw %}    
