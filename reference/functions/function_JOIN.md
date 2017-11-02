---
title: "JOIN"
layout: "function"
isPage: "true"
desc: "Join N strings with the given separator"
category: "reference"
categoryTree: ["reference","functions"]
---
## JOIN ##

Join N strings with the given separator.

``` 'str1' ... 'strn' 'sep' n JOIN 'str' ```


The `JOIN` function joins N strings with the given separator. It takes two arguments: the number of elements to join that it needs to take from the top of the stack and the separator used to join the strings


## Example ##

Initial stack:

    4:    'str1'
    3:    'str2'
    2:    'str3'
    TOP:  'str4'


WarpScript commands:

    '-' 4 JOIN

Stack:

    TOP:  'str1-str2-str3-str4'

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
'a' 'b' 'c' 'd' 'e'
'-' 5 JOIN
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
'a' 'b' 'c' 'd' 'e'
'-' 5 JOIN
// assertions
"a-b-c-d-e" == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}            
