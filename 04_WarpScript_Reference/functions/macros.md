---
title: "Macros"
layout: "function"
isPage: "true"
link: "/warpscript/macro"
desc: "Macros allow users to define new functions combining existing WarpScript functions and operations"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","30-logic-structures","10-macros.html.md"]
category: "reference"
---


Macros allow users to define new functions combining existing WarpScript functions and operations. 
User-defined macros can then be passed as arguments to other WarpScript functions (like [IFT]({{ site.baseurl}}/reference/functions/function_IFT) 
or [FOR]({{ site.baseurl}}/reference/functions/function_FOR)), stored as variables with [STORE]({{ site.baseurl}}/reference/functions/function_STORE), or evaluated using 
[EVAL]({{ site.baseurl}}/reference/functions/function_EVAL).

Macros are declared with the `<% YOUR_MACRO_HERE %>` syntax.

## Example ##

In WarpScript you have an [ABS]({{ site.baseurl}}/reference/functions/function_ABS) function to calculate the absolute value of a number, 
and [MAX]({{ site.baseurl}}/reference/functions/function_MAX) to compute the maximum of two numbers. But what about a function `MAX_ABS` 
to get the maximum of the absolute value of two numbers? 

Well, `MAX_ABS` doesn't exist, but you can create it easily using a macro:

WarpScript commands:

    // Function to calculate the max absolute value of two parameters on the stack
    <% 
      ABS     // Absolute value of first parameter
      SWAP    // Swapping to get 2nd parameter on top
      ABS     // Absolute value of 2nd parameter
      MAX     // Max of those two absolute values
    %>

    // Then we store the macro on a MAX_ABS variable
    'MAX_ABS' STORE
    
    // Let's calculate the MAX_ABS of -7 and 8
    -7
    8
    $MAX_ABS EVAL  // To evaluate a function you can use $name EVAL
    
    // Let's calculate the MAX_ABS of -1 and -5
    -1
    -5
    @MAX_ABS      // To evaluate a function you can alse use @name


Stack:

    TOP:  5
    1:    8

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Function to calculate the max absolute value of two parameters on the stack
<% 
ABS     // Absolute value of first parameter
SWAP    // Swapping to get 2nd parameter on top
ABS     // Absolute value of 2nd parameter
MAX     // Max of those two absolute values
%>
// Then we store the macro on a MAX_ABS variable
'MAX_ABS' STORE
// Let's calculate the MAX_ABS of -7 and 8
-7
8
$MAX_ABS EVAL  // To evaluate a function you can use $name EVAL
// Let's calculate the MAX_ABS of -1 and -5
-1
-5
@MAX_ABS      // To evaluate a function you can alse use @name
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Function to calculate the max absolute value of two parameters on the stack
<% 
ABS     // Absolute value of first parameter
SWAP    // Swapping to get 2nd parameter on top
ABS     // Absolute value of 2nd parameter
MAX     // Max of those two absolute values
%>
// Then we store the macro on a MAX_ABS variable
'MAX_ABS' STORE
// Let's calculate the MAX_ABS of -7 and 8
-7
8
$MAX_ABS EVAL  // To evaluate a function you can use $name EVAL
// Let's calculate the MAX_ABS of -1 and -5
-1
-5
@MAX_ABS      // To evaluate a function you can alse use @name
5 == ASSERT
8 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}    