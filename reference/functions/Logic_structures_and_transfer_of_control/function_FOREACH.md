---
title: "FOREACH"
layout: "function"
isPage: "true"
link: "/warpscript/function_FOREACH"
desc: "Implement a foreach loop on a list or map"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","30-logic-structures","30-function_FOREACH.html.md"]
category: "reference"
---


The `FOREACH` function implements a *for* loop on a list or map.
It takes two arguments from the stack : the list or map
and a [macro]({{ site.baseurl}}/reference/functions/macros) to be executed at each iteration.

For each iteration *i* on a list, the *i-th* element on the list is put on top of the stack, 
and the exec macro is then called.

For each iteration *i* on a map, the *i-th* key and the *i-th* value of the map are put on top of the stack, 
and the exec macro is then called.


## Example ##

WarpScript commands:

        // Macro that squares the value on the top of the stack
        <% 2 **  %>
        'SQUARE' STORE

        // Map with 3 elements: {"1":-2,"3":-4,"5":-6}
        { 1 -2 3 -4 5 -6 }
        $SQUARE
        FOREACH

        // FOREACH takes two elements from the stack : the list or map to iterate from and the macro to apply to each element
        6 ->MAP


Stack:

    TOP:  {"1":4,"3":16,"5":36}

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// define macro
<% 2 **  %> 'SQUARE' STORE
// FOREACH loop
{ { 1 -2 3 -4 5 -6 } $SQUARE FOREACH }
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// define macro
<% 2 **  %> 'SQUARE' STORE
// FOREACH loop
{ { 1 -2 3 -4 5 -6 } $SQUARE FOREACH }
// assertions
36 == ASSERT    5 == ASSERT      16 == ASSERT
3 == ASSERT     4 == ASSERT      1 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}            
