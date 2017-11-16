---
title: "JSONLOOSE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Generate a loose JSON version (with NaN and Infinite values allowed) of the stack"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","70-platform","10-function_JSONLOOSE.html.md"]
category: "reference"
---
 

In strict JSON format the [`NaN`]({{ site.baseurl}}/reference/functions/function_NaN) and  `Infinite` values aren't allowed and they are replaced by `null`.

The `JSONLOOSE`function configures the stack to send results in a loose [JSON](http://json.org/) format where 
`NaN`and `Infinite` are valid values.

If the JSON parser you're using is strict, you should either configurate the [`JSONSTRICT`]({{ site.baseurl }}/reference/functions/function_JSONSTRICT) mode or dealing with 
`NaN`and `Infinite` values outside the parser.

## Warning ##

By default, Warp10 platform  uses the `JSONLOOSE` format.

## Example ##

WarpScript commands:

    JSONLOOSE
    NaN

Stack (in JSON):

    TOP: NaN


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">JSONLOOSE
NaN
</warp10-warpscript-widget>
{% endraw %} 
