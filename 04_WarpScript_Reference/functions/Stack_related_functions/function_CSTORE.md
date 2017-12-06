---
title: "CSTORE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Conditionnaly store the element below the top of the stack under the symbol name on top of the stack"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","30-logic-structures","15-function_STORE.html.md"]
category: "reference"
---
 

The `CSTORE` function stores the element below the top of the stack under the symbol name on top of the stack if this symbol does not yet exist. The stored symbol can later be pushed onto the top of the stack by invoking `$symbol`.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42 'foo' STORE
// Now we have a variable 'foo'
// With a value of 42'
$foo

//
// If we attempt to store something in 'foo' again using
// CSTORE it will not update the value
//

0 'foo' CSTORE

// We still have 42

$foo

</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42 'foo' STORE
$foo 42 == ASSERT
0 'foo' CSTORE
$foo 42 == ASSERT
</warp10-warpscript-widget>
{% endraw %}            

