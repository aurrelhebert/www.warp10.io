---
title: "OPTDTW"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Find the N optimal matches for a query sequence using Dynamic Time Warping."
categoryTree: ["reference","functions"]
category: "reference"
---
 
The `OPTDTW` function finds the top subsequence matches in a sequence for a given query sequence. The function uses [Dynamic Time Warping](https://en.wikipedia.org/wiki/Dynamic_time_warping) to assess the subsequence similarity with the query.

The function expects the number of top matches to return on top of the stack then two numerical sequences, a 'query' sequence, thr shortest, and a 'data' sequence in which to find matches. Use 0 as the number of matches to return to return them all.

The function returns a list of matches, each match being a pair of (index, distance).

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
[]
0 360 <% 360.0 / 2 PI * * SIN +! %> FOR
[]
45 60 <% 360.0 / 2 PI * * SIN +! %> FOR
0
OPTDTW
</warp10-warpscript-widget>
{% endraw %}        
