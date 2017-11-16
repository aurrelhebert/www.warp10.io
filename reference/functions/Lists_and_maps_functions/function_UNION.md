---
title: "UNION"
layout: function
desc: "Performs the union of two sets."
categoryTree: ["reference","functions"]
category: "reference"
---

Computes the `UNION` of two SETS.

## Example ##

Initial stack:

    TOP: [ 'foo' 'bar' 'bob' ]
    1: [ 'foo' 'bar' 'alice' ]

WarpScript commands:

    UNION

Stack:

    TOP: [ 'bar' 'bob' 'foo' 'alice' ] 

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Converts the two LISTS into SETS
[ 'foo' 'bar' 'alice' ] ->SET
[ 'foo' 'bar' 'bob' ] ->SET
// Compute the difference
UNION
// convert back the SET into LIST
SET->
</warp10-warpscript-widget>
{% endraw %}    
