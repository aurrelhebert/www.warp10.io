---
title: "+"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Add two parameters"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","9201-function_ADD.html.md"]
category: "reference"
---
 

The `+` operator consumes two parameters from the top of the stack and pushes back the result of adding them.

The meaning of *adding* depends on the type of parameter:

* If both parameters are numbers, the result is the sum of both numbers
* If both parameters are strings, the result is the concatenation of both strings
* If the first parameter is a list, the `+` operator clones the lists and appends the second parameter to the cloned list
* If both parameters are macros, the result is a macro concatenating the two others

in any other case `+` with throw an exception.



## Example ##

WarpScript commands:

    40 2 + 
    'Hello ' 'world' +
    [ 'a' 'b' ] 'c' +

Stack: 

    TOP: ["a","b","c"]
    1:   "Hello world"
    2:   42

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">40 2 + 
'Hello ' 'world' +
[ 'a' 'b' ] 'c' +
</warp10-warpscript-widget>
{% endraw %}    
