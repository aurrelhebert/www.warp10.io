---
title: "mapper.hour"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Return the hour of the tick for which it is computed"
categoryTree: ["reference","frameworks","framework-map"]
oldPath: ["20-frameworks","201-framework-map","201-single-value-mappers","279-mapper_hour.html.md"]
category: "reference"
---
 

This *mapper* function returns the hour of the tick for which it is computed.

The `mapper.hour` function can be applied to values of any type.


## Example ##

Stack:

    TOP:  [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[1380000000003189,42],[1418910910000000,123],[1419220920000000,211],[1421530930000000,132]]}]

WarpScript commands:

    // arguments are: GTS or [GTS], (timezone) mapper, prewindow, postwindow, occurences
    [ SWAP 'UTC' mapper.hour 0 0 0 ] MAP

Stack: 

    TOP:  [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[1380000000003189,5],[1418910910000000,13],[1419220920000000,4],[1421530930000000,21]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
1380000000003189 NaN NaN NaN  42.0 ADDVALUE
1418910910000000 NaN NaN NaN 123.0 ADDVALUE
1419220920000000 NaN NaN NaN 211.0 ADDVALUE
1421530930000000 NaN NaN NaN 132.0 ADDVALUE
1 ->LIST
// arguments are: GTS or [GTS], (timezone) mapper, prewindow, postwindow, occurences
[ SWAP 'UTC' mapper.hour 0 0 0 ] MAP
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget>NEWGTS "toto" RENAME 
{ 'label0' '42' } RELABEL
1380000000003189 NaN NaN NaN  42.0 ADDVALUE
1418910910000000 NaN NaN NaN 123.0 ADDVALUE
1419220920000000 NaN NaN NaN 211.0 ADDVALUE
1421530930000000 NaN NaN NaN 132.0 ADDVALUE
1 ->LIST
// arguments are: GTS or [GTS], (timezone) mapper, prewindow, postwindow, occurences
[ SWAP 'UTC' mapper.hour 0 0 0 ] MAP
VALUES LIST-> DROP
LIST-> DROP
21 == ASSERT
4 == ASSERT
13 == ASSERT
5 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}