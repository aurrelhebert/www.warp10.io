---
title: "mapper.mean.circular"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Pushes onto the stack a mapper suitable for computing the circular mean of values"
categoryTree: ["reference","frameworks"]
category: "reference"
---

This function will push a *mapper* onto the stack which can then be used to compute the circular mean of all the values found in each sliding window. The associated location is the centroid of all the encountered locations. The associated elevation is the mean of the encountered elevations.

The *mapper* function produced by `mapper.mean.circular` can only be applied to values of type **LONG** or **DOUBLE**, when applied to **STRING** or **BOOLEAN** it does not return any value.

If any tick is undefined, no value will be returned. Use `mapper.mean.circular.exclude-nulls` if your sliding windows may contain nulls.

The `mapper.mean.circular` function expects a positive, finite, numeric period on top of the stack, this period will be used to determine the span of circular values, use for example 360.0 if you wish to compute the circular mean of degree angles.

Similar functions exist for both the `BUCKETIZE` and `REDUCE` frameworks, they are:

`reducer.mean.circular`
`reducer.mean.circular.exclude-nulls`
`buckerizer.mean.circular`
`buckerizer.mean.circular.exclude-nulls`

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "degangles" RENAME 
0 NaN NaN NaN 1.0 ADDVALUE
1 NaN NaN NaN 359.0 ADDVALUE
2 NaN NaN NaN 181.0 ADDVALUE
3 NaN NaN NaN 1.0 ADDVALUE
[ SWAP 360.0 mapper.mean.circular 1 0 0 ] MAP
</warp10-warpscript-widget>
{% endraw %}    
