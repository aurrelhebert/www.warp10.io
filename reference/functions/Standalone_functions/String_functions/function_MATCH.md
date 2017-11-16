---
title: "MATCH"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Apply a regular expression to a string"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","15-standalone","250-function_MATCH.html.md"]
category: "reference"
---
 

The `MATCH` function applies a regular expression (*regexp*) to a string. 

It consumes two parameters from the top of the stack: the regexp pattern and the string to test matching with.

If the string doesn't match the regexp, the function return an empty list. If it matches, the function will return a
list of every matching group.

Instead of using a regular expression string, you can also use the result of [MATCHER]({{ site.baseurl }}/reference/functions/function_MATCHER) for improved performance.

## Example ##


WarpScript commands:

    'abc def ghi jkl'
    '([^ ].*) ([^ ].*) [^ ].* [^ ].*'
    MATCH

Stack: 

    TOP: ["abc def ghi jkl","abc","def"]


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'abc def ghi jkl'
'([^ ].*) ([^ ].*) [^ ].* [^ ].*'
MATCH
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'abc def ghi jkl'
'([^ ].*) ([^ ].*) [^ ].* [^ ].*'
MATCH
LIST-> DROP                     // Expand the list and drop its size
'def' == ASSERT                 // 3rd matching group: the 2nd () groups
'abc' == ASSERT                 // 2nd matching group: the 1nd () groups
'abc def ghi jkl' == ASSERT     // 1st matching group: the global string
'unit test successful'
</warp10-warpscript-widget>
{% endraw %} 

