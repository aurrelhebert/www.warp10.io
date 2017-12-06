---
title: "COPYGEO"
layout: function
isPage: "true"
desc: "Forces the location elements of a GTS onto others."
categoryTree: ["reference","functions"]
category: reference
signature: "[ gts ] gts COPYGEO [ gts ]"
---

The `COPYGEO` function forces the location elements of a GTS onto others. `COPYGEO` expects two parameters on the stack. First a GTS or a gts list have to be pushed. Those serie(s) will have their location overwritten by the one of the GTS pushed as the second parameter on the stack (only when a tick exists in the second serie, otherwise it kept default location).

```
[ gts ] gts COPYGEO [ gts ]
```

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Create a new GTS with ten values 
NEWGTS 
'test name'
RENAME
{ 'label0' '42' 'label1' 'foo' }
RELABEL
100  NaN NaN NaN 10 ADDVALUE
200  NaN NaN NaN  9 ADDVALUE
300  NaN NaN NaN  8 ADDVALUE
400  NaN NaN NaN  7 ADDVALUE
500  NaN NaN NaN  6 ADDVALUE
700  NaN NaN NaN  5 ADDVALUE
800  NaN NaN NaN  4 ADDVALUE
900  NaN NaN NaN  3 ADDVALUE
// As this tick doesn't exist in the second serie, its location are kept in result
1000 0 0 NaN  2 ADDVALUE
1100 NaN NaN NaN  1 ADDVALUE

// Create a GTS with locations
NEWGTS 
'geo'
RENAME
{ 'label0' '0' 'label1' 'bar' }
RELABEL
100  0.0 1.0 NaN 0 ADDVALUE
200  1.0 0.0 NaN 0 ADDVALUE
500  2.0 0.0 NaN 0 ADDVALUE
// As this tick doesn't exist in the first serie, it's not inserted
600  0.0 2.0 NaN 0 ADDVALUE
800  1.0 1.2 NaN 0 ADDVALUE

// Apply the function
COPYGEO
</warp10-warpscript-widget>
{% endraw %}   