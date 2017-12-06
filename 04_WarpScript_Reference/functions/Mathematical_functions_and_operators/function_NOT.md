---
title: "!"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Apply the logical function NOT"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","400-function_NOT.html.md"]
category: "reference"
---
 

The `!` function consumes a boolean value *x* from the top of the stack and pushes back the result of appying the *NOT* logical function, *NOT x*, i.e. for a *true* input value it returns *false*, for a *false* one it returns *true*.


## Example ##

WarpScript commands:

    true 
    !

Stack: 

    TOP: false


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">true !
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'a' 'b' ==    // it returns false
!                             // and we apply NOT to get true
true == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
