---
title: "PARSE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Parse a STRING into a set of Geo Time Series"
categoryTree: ["reference","functions"]
category: "reference"
---
 
The `PARSE` function parses an input STRING containing datapoints in the Geo Time Series [input format]({{ site.baseurl }}/apis/gts-input-format/) and pushes onto the stack the parsed Geo Time Series.


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}"><'
// class{label=value} 42.0
0// class-1{label=value}{attribute=value} 42
=1// 43
'>
PARSE
</warp10-warpscript-widget>
{% endraw %}    
