---
title: "DEF"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Define or redefine a WarpScript function."
categoryTree: ["reference","functions"]
oldPath: ["30-functions","30-logic-structures","15-function_STORE.html.md"]
category: "reference"
---
 

The `DEF` function allows you to define new WarpScript functions or redefine existing ones for the duration of your script execution.

The function expects on the stack a macro which will be used as the content of the newly defined function, and a name under which to define the new function.

When redefining a function, if the function being redefined is used within the macro, the code which will be executed is the current one, as the binding of function to code is done at the time when the macro is defined and not when it is executed.

You may therefore add limits to the use of an existing function by rewrapping it in a macro which will be associated with the original function name.

To remove redefined functions see [CLEARDEFS]({{ site.baseurl }}/reference/functions/function_CLEARDEFS).

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">//
// We will add a check for a secret password in function NOW
//

<% 42 == ASSERT NOW %> 'NOW' DEF

//
// To use 'NOW' you must now push 42 on top of the stack
//

42 NOW
</warp10-warpscript-widget>
{% endraw %}    
