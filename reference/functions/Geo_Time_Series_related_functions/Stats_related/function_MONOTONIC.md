---
title: "MONOTONIC"
layout: "function"
desc: "Modifies the values of a Geo Time Series so it is monotonous."
category: "reference"
---
 
Produces a new Geo Time Series from an input one by modifying the value so the result is monotonous. This is technically applying a ratchet effect on values.

The `MONOTONIC` function expects a boolean on top of the stack and a Geo Time Series or list thereof below the boolean. The boolean indicates whether the result should be monotonically increasing (false) or decreasing (true).

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS
1 10 <% DUP DUP DUP DUP ADDVALUE %> FOR
DUP false MONOTONIC
SWAP true MONOTONIC
</warp10-warpscript-widget>
{% endraw %}    

## Unit Test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS
1 10 <% DUP DUP DUP DUP ADDVALUE %> FOR
DUP false MONOTONIC
VALUES LIST-> DROP
10 1 <% 1 - %> <% == ASSERT %> FORSTEP

true MONOTONIC
VALUES LIST-> DROP
1 10 <% DROP 1 == ASSERT %> FOR
</warp10-warpscript-widget>
{% endraw %}    
