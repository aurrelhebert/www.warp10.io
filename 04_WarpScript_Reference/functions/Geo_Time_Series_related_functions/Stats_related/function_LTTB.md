---
title: "LTTB"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Downsamples a Geo Time Series using 'Least Triangle Three Bucket'"
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `LTTB` function downsamples a Geo Time Series by applying the *Leat Triangle Three Bucket* algorithm as described in this [thesis](http://skemman.is/stream/get/1946/15343/37285/3/SS_MSthesis.pdf). The function considers buckets based on the number of values. See [`TLTTB`]({{ site.baseurl }}/reference/functions/function_TLTTB) for time based buckets.

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
50 LTTB
</warp10-warpscript-widget>
{% endraw %}        
