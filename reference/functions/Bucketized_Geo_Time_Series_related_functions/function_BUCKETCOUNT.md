---
title: "BUCKETCOUNT"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Extract bucketcount from a bucketized Geo Time Series"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","60-bucketized-gts","615-function_BUCKETCOUNT.html.md"]
category: "reference"
---


The function `BUCKETCOUNT` consumes a GTS off the stack and pushes its bucketcount onto the stack.

Note: when called on a non bucketized GTS instance, it returns 0.


## Example ##

Let's say that we have used the [`FETCH`]({{ site.baseurl}}/reference/functions/function_FETCH) function to recover a GTS and then the
[`BUCKETIZE`](framework.bucketize) framework to bucketize it to three buckets.

Initial stack:

    TOP: [{"c":"com.cityzendata.tutorial.sensors.temperature","l":{".app":"doc.data",
         "sensorId":"01"},"a":{},"v":[[1389139200000000,21.5],[1389138619999999,20.86],
         [1389138039999998,20.86]]}]

WarpScript commands:

    BUCKETCOUNT

Stack:

    TOP: 3    

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">

    // Let's recover 30 points from a GTS
    [
      '60VgNqxhAaCdS6_uOLtZNMGWAbGpS5xmPL4gAbC_QbCjRbBiS5KhR5KmNMGpRaJQ.cV3Aa4kR.WZQqBiO54oNFWnOLtnQr88O.7kBGQisxjnVyLaxkgLbUEd_RTgYDIS.Gg..4N.5A.06sg7.........1hWN6aUdSEjkD0Vqg...XAzOwylS22pDFB3Ou3RAhi1lSTt70mIuq.T_8BbJjMFUGqJ7zXuKLt637GYU6kSJBc2mZ4LOVlaKZBtPL1.ILO67BVs95RMgVmmoHOLD5KB2zM6P6m2RfmFjQ.PP62V5mYbYgOMc37ctkfN1K2DFbTFRK1D.pAca4VViRo3qSLcdWp.pcBXVyktZsbVR.B.PIcrpcc0...L_.NG..'
    ]
    UNWRAP

    // And bucketize it to 3 buckets
    [ SWAP bucketizer.max 0 0 3 ] BUCKETIZE

    // Let's extract the single GTS from the list
    0 GET

    // Let's apply BUCKETCOUNT
    BUCKETCOUNT

</warp10-warpscript-widget>
{% endraw %}
