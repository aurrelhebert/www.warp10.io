---
title: "CORRELATE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Compute correlation between Geo Time Series"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","863-function_CORRELATE.html.md"]
category: "reference"
---
 


The `CORRELATE` function allows you to compute correlation between one base Geo Time Series and a set of others. By putting the base GTS in the set of others, cross correlation can be computed.

## Parameters ##

Initial stack:


    TOP-2: The base Geo Time Series
    TOP-1: A list of Geo Time Series against which to compute the correlation
    TOP: A list of time offsets for which the correlation will be computed (expressed in time units of the Warp instance)

All Geo Time Series must be bucketized with an identical bucketspan.

WarpScript commands:

    CORRELATE

Stack: 

    TOP: A list of synthetic Geo Time Series whose timestamps are the offsets from the initial offset list and the values are the computed correlations. There is one GTS per GTS in the list at TOP-1.

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
    //
    // Create a COSINE GTS
    //
    NEWGTS 'cos' RENAME
    1 360
    <% 'i' STORE $i NaN NaN NaN $i TORADIANS COS ADDVALUE %>
    FOR
    'cos' STORE $cos
    [ SWAP bucketizer.last 0 1 0 ] BUCKETIZE LIST-> DROP
    //
    // Create a SINE GTS
    //
    NEWGTS 'sin' RENAME
    1 360
    <% 'i' STORE $i NaN NaN NaN $i  50 + TORADIANS SIN ADDVALUE %>
    FOR
    'sin' STORE $sin
    [ SWAP bucketizer.last 0 1 0 ] BUCKETIZE
    //
    // Generate the list of offsets for correlation
    //
    [ 0 360 <%  %> FOR ]
    //
    // Compute correlation
    //
    CORRELATE 'correlation' RENAME
    // put SINE/COSINE on the stack so they can be displayed 
    $cos $sin
</warp10-warpscript-widget>
{% endraw %}
