---
title: "SUBSTRING"
layout: function
desc: "Extracts a substring from a string."
category: reference
---

Extract a substring from a string, either by specifiying the start index (0 based) or the start index (0 based) and a length."

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'GOOD BAD' 0 4 SUBSTRING
'BAD GOOD' 4 SUBSTRING
</warp10-warpscript-widget>
{% endraw %}    

## Unit Test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'GOOD BAD' 0 4 SUBSTRING
'GOOD' == ASSERT
'BAD GOOD' 4 SUBSTRING
'GOOD' == ASSERT
</warp10-warpscript-widget>
{% endraw %}    
