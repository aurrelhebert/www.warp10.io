---
title: "SWITCH"
layout: "function"
isPage: "true"
link: "/warpscript/function_SWITCH"
desc: "Implement a switch-like conditional"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","30-logic-structures","20-function_SWITCH.html.md"]
category: "reference"
---


The `SWITCH` function implements a *switch*-like conditional.
It takes a variable number of arguments from the top of the stack:


* 2N+2: condition [macro]({{ site.baseurl}}/reference/functions/macros) for case 1
* 2N+1: exec [macro]({{ site.baseurl}}/reference/functions/macros) for case 1
* ...
* 4: condition [macro]({{ site.baseurl}}/reference/functions/macros) for case N
* 3: exec [macro]({{ site.baseurl}}/reference/functions/macros) for case N
* 2: default [macro]({{ site.baseurl}}/reference/functions/macros)
* 1: number of cases


## Example ##

In this example store value on top of the stack in a variable for more clarity. Conditional is then applied.

Stack:

    TOP:  3

WarpScript commands:

    'value' STORE
    <% $value 4 % 3 == %> // Condition 1
      <% 'number modulo 4 = 3' %> // exec 1
    <% $value 4 % 2 == %> // Condition 2
      <% 'number modulo 4 = 2' %> // exec 2
    <% $value 4 % 1 == %> // Condition 3
      <% 'number modulo 4 = 1' %> // exec 3
    <% 'number modulo 4 = 0' %> // default
    3
    SWITCH

Stack:

    TOP:  "number % 4 = 3"

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
<%
  'value' STORE
  <% $value 4 % 3 == %> // Condition 1
    <% 'number modulo 4 = 3' %> // exec 1
  <% $value 4 % 2 == %> // Condition 2
    <% 'number modulo 4 = 2' %> // exec 2
  <% $value 4 % 1 == %> // Condition 3
    <% 'number modulo 4 = 1' %> // exec 3
  <% 'number modulo 4 = 0' %> // default
  3
  SWITCH
%> 'MOD4' STORE
7 @MOD4
8 @MOD4
9 @MOD4
10 @MOD4
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
<%
  'value' STORE
  <% $value 4 % 3 == %>
    <% 'number modulo 4 = 3' %>
  <% $value 4 % 2 == %>
    <% 'number modulo 4 = 2' %>
  <% $value 4 % 1 == %>
    <% 'number modulo 4 = 1' %>
  <% 'number modulo 4 = 0' %>
  3
  SWITCH
%> 'MOD4' STORE

7 @MOD4
8 @MOD4
9 @MOD4
10 @MOD4
'number modulo 4 = 2' == ASSERT
'number modulo 4 = 1' == ASSERT
'number modulo 4 = 0' == ASSERT
'number modulo 4 = 3' == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}            
