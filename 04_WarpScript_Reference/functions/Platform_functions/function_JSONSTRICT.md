---
title: "JSONSTRICT"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Generate a JSON version of the stack"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","70-platform","10-function_JSONSTRICT.html.md"]
category: "reference"
---
 

In strict JSON format the [`NaN`]({{ site.baseurl}}/reference/functions/function_NaN) and  `Infinite` values aren't allowed and they are replaced by `null`.

The `JSONSTRICT` function configures the stack to send results in strict [JSON](http://json.org/) format.


## Warning ##

By default, Warp10 platform  uses the [`JSONLOOSE`]({{ site.baseurl }}/reference/functions/function_JSONLOOSE) format.

## Example ##

WarpScript commands:

    JSONSTRICT
    NaN

Stack (in JSON):

    TOP: null


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">JSONSTRICT
NaN
</warp10-warpscript-widget>
{% endraw %}    
