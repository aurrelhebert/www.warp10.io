---
title: "BREAK"
layout: "function"
isPage: "true"
desc: "Break out of the current loop"
categoryTree: ["reference","functions"]
category: "reference"
---


The `BREAK` function breaks out of the current loop. It takes no argument.

> If used outside a loop, an error is thown


## Example ##

WarpScript commands:

    // Find the first number divisible by 5 in a list

    <%
      'number' STORE
      $number
      <% 5 % 0 == %>  // Condition : number modulo 5 == 0
      <% $number BREAK  %>     // Then BREAK
      IFT
    %>
    'BREAK_ON_MOD_5' STORE

    [ 1 2 3 4 5 6 7 8 9 10 ] // The list
    $BREAK_ON_MOD_5
    FOREACH


Stack:

    TOP:  5

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Find the first number divisible by 5 in a list

<%
  'number' STORE
  $number
  <% 5 % 0 == %>  // Condition : number modulo 5 == 0
  <% $number BREAK  %>     // Then BREAK
  IFT
%>
'BREAK_ON_MOD_5' STORE

[ 1 2 3 4 5 6 7 8 9 10 ] // The list
$BREAK_ON_MOD_5
FOREACH
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Find the first number divisible by 5 in a list

<%
  'number' STORE
  $number
  <% 5 % 0 == %>  // Condition : number modulo 5 == 0
  <% $number BREAK  %>     // Then BREAK
  IFT
%>
'BREAK_ON_MOD_5' STORE

[ 1 2 3 4 5 6 7 8 9 10 ] // The list
$BREAK_ON_MOD_5
FOREACH
// assertions
5 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}            
