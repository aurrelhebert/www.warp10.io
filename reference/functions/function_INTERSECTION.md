---
title: "INTERSECTION"
layout: function
desc: "Computes the intersection of two sets."
category: reference
categoryTree: ["reference","functions"]
---

Computes the `INTERSECTION` of two sets.

## Example ##
Initial stack:

    TOP: [ 'foo' 'bar' 'bob' ]
    1: [ 'foo' 'bar' 'alice' ]

WarpScript commands:

    INTERSECTION

Stack:

    TOP: [ 'bar' 'foo' ] 

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Converts the two LISTS into SETS
[ 'foo' 'bar' 'alice' ] ->SET
[ 'foo' 'bar' 'bob' ] ->SET
// Compute the intersection
INTERSECTION
// convert back the SET into LIST
SET->
</warp10-warpscript-widget>
{% endraw %}    
