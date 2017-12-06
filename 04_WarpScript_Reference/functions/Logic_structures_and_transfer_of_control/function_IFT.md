---
title: "IFT"
layout: "function"
isPage: "true"
link: "/warpscript/function_IFT"
desc: "Implement the if-then conditional"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","30-logic-structures","20-function_IFT.html.md"]
category: "reference"
---
 

The `IFT` function implements an *if-then* conditional. 

It takes two [macros]({{ site.baseurl}}/reference/functions/macros) as arguments, `macro1` and `macro2`, that are popped out of the stack.
`macro1` is the condition to evaluate, it MUST leave a boolean on top of the stack. 
The boolean is consumed, and if true, `macro2` is evaluated.


## Example ##


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// The condition, is 7 >= 4 ?
<% 7 4 >= %>
// If the condition is true, add some values to the stack
<% 'a' 'b' 'c' %>
// Now the IFT evaluates the condition and as it's true, it will put 'a', 'b' and 'c' onto the stack
IFT
</warp10-warpscript-widget>
{% endraw %}


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// The condition, is 7 >= 4 ?
<% 7 4 >= %>
// If the condition is true, add some values to the stack
<% 'a' 'b' 'c' %>
// Now the IFT evaluates the condition and as it's true, it will put 'a', 'b' and 'c' onto the stack
IFT
'c' == ASSERT   'b' == ASSERT   'a' == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}      
