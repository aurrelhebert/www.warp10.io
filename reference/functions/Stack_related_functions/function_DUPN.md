---
title: "DUPN"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Duplicates the N top of the stack"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","40-stack-manipulation","200-function_DUPN.html.md"]
category: "reference"
---
 

The `DUPN` function duplicates the top `N` elements of the stack after having consumed `N` which is on the top of the stack when calling `DUPN`.


## Example ##

Initial stack:

    TOP: foo
    1:   hello
    2:   world
    3:   2

WarpScript commands:

    DUPN

Stack:

    TOP: foo
    1:   hello
    2:   world
    3:   hello
    4:   world



## Tips ##

As the [`DUP`]({{ site.baseurl}}/reference/functions/function_DUP) function, `DUPN` duplicates the references of the `N` elements on the top of the stack, 
it doesn't copy the elements. 
If you apply `DUPN` to a GTS you will have two references to the same GTS object on the stack.

If you want to make a deep copy of a GTS, i.e. if you want copy the content and 
not only the reference, you can use the [`CLONE`]({{ site.baseurl}}/reference/functions/function_clone) function.     

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'foo'
'bar'
2
DUPN
</warp10-warpscript-widget>
{% endraw %}
