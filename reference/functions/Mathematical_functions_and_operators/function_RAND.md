---
title: "RAND"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Push on the stack a random number between 0 and 1"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","9100-function_RAND.html.md"]
category: "reference"
---
 

The `RAND` function pushes onto the stack a random number between 0 and 1.

## Example ##

WarpScript commands:

    RAND

Stack: 

    TOP: 0.4264232960224979


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">RAND
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">RAND
RAND
!= ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
