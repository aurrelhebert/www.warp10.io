---
title: "STRICTMAPPER"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Wrap a mapper to add a condition onto the number of values in the input sliding window"
categoryTree: ["reference","frameworks"]
category: "reference"
---

The `STRICTMAPPER` function wraps a mapper function such that the wrapped mapper returns no value when the number of values of the sliding window is outside a given range.

## Syntax ##

```
mapper a b STRICTMAPPER
```

`STRICTMAPPER` consumes three parameters from the top of the stack:

`mapper` the mapper function

`a` the minimum (inclusive) number of values (a LONG)

`b` the minimum (inclusive) number of values (a LONG)



## Example ##

Initial stack:

    TOP: {"c":"","l":{},"a":{},"v":[[1,10],[2,10],[3,10],[4,10],[5,10],[6,10],[7,10],[8,10],[9,10]]}

WarpScript commands:

    [ SWAP mapper.sum 5 5 STRICTMAPPER 2 2 0 ] MAP


Stack: 

    TOP: [{"c":"","l":{},"a":{},"v":[[300,50],[400,50],[500,50],[600,50],[700,50]]}]


## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS 1 9 <% NaN NaN NaN 10 ADDVALUE %> FOR
[ SWAP mapper.sum 5 5 STRICTMAPPER 2 2 0 ] MAP
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget>NEWGTS 1 9 <% NaN NaN NaN 10 ADDVALUE %> FOR
[ SWAP mapper.sum 3 4 STRICTMAPPER 2 2 0 ] MAP 0 GET
DUP SIZE 4 == ASSERT
DUP 0 ATINDEX DUP 0 GET 1 == ASSERT 4 GET 30 == ASSERT
DUP 1 ATINDEX DUP 0 GET 2 == ASSERT 4 GET 40 == ASSERT
DUP 2 ATINDEX DUP 0 GET 8 == ASSERT 4 GET 40 == ASSERT
3 ATINDEX DUP 0 GET 9 == ASSERT 4 GET 30 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        