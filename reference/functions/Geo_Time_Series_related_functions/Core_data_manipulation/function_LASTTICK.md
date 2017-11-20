---
title: "LASTTICK"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Push onto the stack the timestamp of the last tick of a Geo Time Series"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","820-function_LASTTICK.html.md"]
category: "reference"
---


The `LASTTICK` function pushes on the stack the last tick of the GTS on top of the stack.

If the GTS does not have values, `Long.MAX_VALUE` is pushed.


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
[
  '60VgNqxhAaCdS6_uOLtZNMGWAbGpS5xmPL4gAbC_QbCjRbBiS5KhR5KmNMGpRaJQ.cV3Aa4kR.WZQqBiO54oNFWnOLtnQr88O.7kBGQisxjnVyLaxkgLbUEd_RTgYDIS.Gg..4N.5A.06sg7.........1hWN6aUdSEjkD0Vqg...XAzOwylS22pDFB3Ou3RAhi1lSTt70mIuq.T_8BbJjMFUGqJ7zXuKLt637GYU6kSJBc2mZ4LOVlaKZBtPL1.ILO67BVs95RMgVmmoHOLD5KB2zM6P6m2RfmFjQ.PP62V5mYbYgOMc37ctkfN1K2DFbTFRK1D.pAca4VViRo3qSLcdWp.pcBXVyktZsbVR.B.PIcrpcc0...L_.NG..'
]
UNWRAP
0 GET
LASTTICK
</warp10-warpscript-widget>
{% endraw %}    

## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS
'test name'
RENAME
{ 'label0' '42' 'label1' 'foo' }
RELABEL
100  NaN NaN NaN 10 ADDVALUE
200  NaN NaN NaN  9 ADDVALUE
300  NaN NaN NaN  8 ADDVALUE
400  NaN NaN NaN  7 ADDVALUE
500  NaN NaN NaN  6 ADDVALUE
100  NaN NaN NaN 10 ADDVALUE
200  NaN NaN NaN  9 ADDVALUE
LASTTICK
500 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}
