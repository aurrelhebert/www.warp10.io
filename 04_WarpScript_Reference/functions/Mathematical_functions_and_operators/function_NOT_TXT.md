---
title: "NOT"
layout: function
desc: "Negates the boolean on the stack."
category: earlyaccess
---

The `NOT` operator is a synonymous for [`!`]({{ site.baseurl }}/reference/functions/function_NOT). It consumes a boolean value *x* from the top of the stack and pushes back the result of appying the *NOT* logical function, *NOT x*, i.e. for a *true* input value it returns *false*, for a *false* one it returns *true*.

## Example ##

WarpScript commands:

    true 
    NOT
    'a' 'b' == 
    NOT

Stack: 

    TOP: true
    1: false

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">true NOT
'a' 'b' ==    // it returns false
NOT                             // and we apply NOT to get true
</warp10-warpscript-widget>
{% endraw %}    

