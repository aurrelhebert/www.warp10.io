---
title: "TLTTB"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Downsamples a Geo Time Series using time based 'Least Triangle Three Bucket'"
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `TLTTB` function downsamples a Geo Time Series by applying the *Leat Triangle Three Bucket* algorithm as described in this [thesis](http://skemman.is/stream/get/1946/15343/37285/3/SS_MSthesis.pdf). It differs from [`LTTB`]({{ site.baseurl }}}/reference/functions/function_LTTB) in that it considers time based buckets instead of value based buckets.

The function expects a threshold (a LONG) on top of the stack. This threshold is the target number of datapoints.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
NEWGTS
1 1000
<%
  'i' STORE $i NaN NaN NaN $i 360.0 / 2 PI * * SIN ADDVALUE
%>
FORi
50 TLTTB
</warp10-warpscript-widget>
{% endraw %}        
