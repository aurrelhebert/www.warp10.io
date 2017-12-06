---
title: "**"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "For parameters a' and 'b', it calculates 'a' raised to the power 'b"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","9206-function_POW.html.md"]
category: "reference"
---
 

The `**` operator consumes two parameters, a base *b* and an exponent *n*, from the top of the stack and pushes back the result raising *b* to the *n* power, i.e. *b<sup>n</sup>*.

The two parameters must be of numeric types.


## Example ##

WarpScript commands:

    2 10 **

Stack: 

    TOP: 1024


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">2 10 **
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">2 10 **
1024 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
