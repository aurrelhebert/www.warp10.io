---
title: "DUP"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Duplicates the top of the stack"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","40-stack-manipulation","200-function_DUP.html.md"]
category: "reference"
---


The `DUP` function duplicates the element on the top of the stack.


## Example ##

WarpScript commands:

    123
    DUP


Stack:


    TOP: 123
    1:   123

## Tips ##

`DUP` duplicates the reference on the top of the stack, it doesn't copy the content.
If you apply `DUP` to a GTS you will have two references to the same GTS object on the stack.

If you want to make a deep copy of a GTS, i.e. if you want copy the content and
not only the reference, you can use the [`CLONE`]({{ site.baseurl}}/reference/functions/function_clone) function.

## A simple example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">123
DUP
</warp10-warpscript-widget>
{% endraw %}

An example of reference duplication:

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">

    // Let's recover a GTS with two elements
    [
      '60VgNqxhAaCdS6_uOLtZNMGWAbGpS5xmPL4gAbC_QbCjRbBiS5KhR5KmNMGpRaJQ.cV3Aa4kR.WZQqBiO54oNFWnOLtnQr88O.7kBGQisxjnVyLaxkgLbUEd_RTgYDIS.Gg..4N.51sUXkV.........9q4VTOy_oyz.s52Pk..17jxbnv4oBEJt.kGb.MEwlSNT....4YkG..''
    ]
    UNWRAP

    // Let's extract the GTS from the list
    0 GET
    //Let's clone it
    DUP

    // Let's add values to the GTS in  top of the stack
    NOW NaN NaN NaN 42
    ADDVALUE

</warp10-warpscript-widget>
{% endraw %}
