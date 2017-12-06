---
title: "IFTE"
layout: "function"
isPage: "true"
link: "/warpscript/function_IFTE"
desc: "Implement the if-then-else conditional"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","30-logic-structures","20-function_IFTE.html.md"]
category: "reference"
---
 

The `IFTE` function implements an *if-then-else* conditional. 

It takes three [macros]({{ site.baseurl}}/reference/functions/macros) as arguments, `macro1`, `macro2` and `macro3`, that are popped out of the stack.
`macro1` is the condition to evaluate, it MUST leave a boolean on top of the stack. 
The boolean is consumed, and if true, `macro2` is evaluated, else `macro3` is evaluated.


## Example ##


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// The condition, is 7 <= 4 ?
<% 7 4 <= %>
// If the condition is true, add some values to the stack
<% 'a' 'b' 'c' %>
// Else we put a 'false' value
<% 'd' 'e' 'f' %>
// Now the IFT evaluates the condition and as it's true, it will put 'a', 'b' and 'c' onto the stack
IFTE</warp10-warpscript-widget>
{% endraw %}

## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// The condition, is 7 <= 4 ?
<% 7 4 <= %>
// If the condition is true, add some values to the stack
<% 'a' 'b' 'c' %>
// Else we put a 'false' value
<% 'd' 'e' 'f' %>
// Now the IFT evaluates the condition and as it's true, it will put 'a', 'b' and 'c' onto the stack
IFTE
'f' == ASSERT   'e' == ASSERT   'd' == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}      
