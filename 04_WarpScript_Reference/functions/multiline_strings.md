---
title: "Multiline strings"
layout: "function"
isPage: "true"
link: "/warpscript/macro"
desc: "Define strings spanning multiple lines."
category: "reference"
---

You can push simple strings onto the stack by enclosing the text to push in single quotes, but sometimes you want to define strings which span multiple lines. The WarpScript construct for this is `<' ... '>` where both start and end tags *MUST* appear on a line by themselves and at the very beginning of their line.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}"><'
foo
bar
'>
</warp10-warpscript-widget>
{% endraw %}    
