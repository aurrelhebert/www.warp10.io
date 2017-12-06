---
title: "REVBITS"
layout: function
desc: "Reverse the bits of the long on top of the stack."
category: reference
---

Reverse the bits of the long on top of the stack.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42
REVBITS
</warp10-warpscript-widget>
{% endraw %}    

## Unit Test ##

<<<<<<< HEAD
<warp10-warpscript-widget> 
4200000000000 REVBITS
2324125112598528 == ASSERT
'unit test successful'
</warp10-warpscript-widget>    
=======
{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}"> 6052837899185947000 REVBITS
42 == ASSERT
</warp10-warpscript-widget>
{% endraw %}    
>>>>>>> acb026da487212942ccff18f0ae6d64a8f469f88
