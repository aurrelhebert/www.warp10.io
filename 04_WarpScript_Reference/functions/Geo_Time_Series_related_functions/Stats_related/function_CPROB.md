---
title: "CPROB"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Computes a conditional probability of each value in a Geo Time Series"
categoryTree: ["reference","functions"]
category: "reference"
---
 
The function `CPROB` generates a new Geo Time Series from an input Geo Time Series by computing a conditional probability.

The function expects a separator (a STRING of length 1) on top of the stack and expects the input Geo Time Series to have values of the form `given1<SEP>given2<SEP>....<SEP>event`. It will then emit `P(event|given1,given2,...)`.

If the separator is `NULL`, `CPROB` behaves like [`PROB`]({{site.baseurl}}/reference/functions/function_PROB).


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS
0 NaN NaN NaN '1,2,3' ADDVALUE
1 NaN NaN NaN '1,2,4' ADDVALUE
2 NaN NaN NaN '1,1,1' ADDVALUE
3 NaN NaN NaN '1,1,1' ADDVALUE
4 NaN NaN NaN '1,0,1' ADDVALUE
5 NaN NaN NaN '1,0,2' ADDVALUE
6 NaN NaN NaN '1,0,3' ADDVALUE
','
CPROB
</warp10-warpscript-widget>
{% endraw %}
