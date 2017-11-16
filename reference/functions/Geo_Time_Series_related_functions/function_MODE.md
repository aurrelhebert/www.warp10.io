---
title: "MODE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Compute the mode(s) for a given GTS"
categoryTree: ["reference","functions"]
category: "reference"
signature: ""
---
 

The `MODE` function computes the mode(s) for a given GTS or a GTS List. Foreach GTS pushes back on the stack a list containing their mode(s).


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
[
    // Create a new GTS with some values 
    NEWGTS 
    'test name'
    RENAME
    { 'label0' '42' 'label1' 'foo' }
    RELABEL
    300  NaN NaN NaN  8 ADDVALUE
    400  NaN NaN NaN  7 ADDVALUE
    500  NaN NaN NaN  6 ADDVALUE
    700  NaN NaN NaN  42 ADDVALUE
    800  NaN NaN NaN  42 ADDVALUE
    900  NaN NaN NaN  3 ADDVALUE
    1100 NaN NaN NaN  1 ADDVALUE

    // Create a second GTS with some values 
    NEWGTS 
    'test name'
    RENAME
    { 'label0' '42' 'label1' 'foo' }
    RELABEL
    100  NaN NaN NaN 1 ADDVALUE
    700  NaN NaN NaN  42 ADDVALUE
    800  NaN NaN NaN  42 ADDVALUE
    1100 NaN NaN NaN  1 ADDVALUE
]

// Compute the MODE of both GTS
MODE
</warp10-warpscript-widget>
{% endraw %}