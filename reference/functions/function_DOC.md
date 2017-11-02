---
title: "DOC"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Defines the documentation string for a macro."
categoryTree: ["reference","functions"]
category: "reference"
---
 
This function sets the string on top of the stack as the documentation for the macro being defined. This doc string can later be retrieved by invoking `DOCMODE` prior to calling the macro.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}"><%
<'
I am a multiline documentation
string for the macro
'>
DOC

NOW
%></warp10-warpscript-widget>
{% endraw %}    
