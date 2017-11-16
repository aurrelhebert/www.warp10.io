---
title: "SWAP"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Swap the two two elements of the stack"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","40-stack-manipulation","500-function_SWAP.html.md"]
category: "reference"
---
 

The `SWAP` function swaps the top two elements of the stack.

## Example ##

Initial stack:

    TOP: foo
    1:   bar

WarpScript commands:

    SWAP

Stack: 

    TOP: bar
    1:   foo

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'foo'
'bar'
SWAP
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'foo'
'bar'
SWAP
'foo' == ASSERT
'bar' == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
