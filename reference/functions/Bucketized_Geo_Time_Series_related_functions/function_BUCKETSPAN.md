---
title: "BUCKETSPAN"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Extract bucketspan from a bucketized Geo Time Series"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","60-bucketized-gts","615-function_BUCKETSPAN.html.md"]
category: "reference"
---


The function `BUCKETSPAN` consumes a GTS off the stack and pushes its bucketspan onto the stack.

Note: when called on a non bucketized GTS instance, it returns 0.


## Example ##

Let's say that we have used the [`FETCH`]({{ site.baseurl}}/reference/functions/function_FETCH) function to recover a GTS and then the
[`BUCKETIZE`](framework.bucketize) framework to bucketize it with a bucketspan of 1 hour.

Initial stack:

    TOP: {"c":"com.cityzendata.tutorial.sensors.temperature","l":{".app":"doc.data","sensorId":"01"},
         "a":{},"v":[[1389139200000000,21.5],[1389135600000000,23.17],[1389132000000000,21.49],
         [1389128400000000,22.13],[1389124800000000,23.43],[1389121200000000,23.8],[1389117600000000,24.65],
         [1389114000000000,24.28],[1389110400000000,23.06],[1389106800000000,22.24],[1389103200000000,23.5],
         [1389099600000000,22.57],[1389096000000000,24.1],[1389092400000000,23.63],[1389088800000000,21.14],
         [1389085200000000,19.62],[1389081600000000,20.19],[1389078000000000,18.24],[1389074400000000,18.03],
         [1389070800000000,18.49],[1389067200000000,18.95],[1389063600000000,20.69],[1389060000000000,19.03],
         [1389056400000000,20.11],[1389052800000000,20.99],[1389049200000000,21.62],[1389045600000000,22.26],
         [1389042000000000,21.2],[1389038400000000,20],[1389034800000000,19.28],[1389031200000000,21.26],
         [1389027600000000,20.28],[1389024000000000,19.12],[1389020400000000,17.98],[1389016800000000,18.76],
         [1389013200000000,18.26],[1389009600000000,20.5],[1389006000000000,20.36],[1389002400000000,18.48],
         [1388998800000000,19.74],[1388995200000000,19.44],[1388991600000000,18.53],[1388988000000000,15.91],
         [1388984400000000,17.84],[1388980800000000,17.22],[1388977200000000,21.05],
         [1388973600000000,23.46],[1388970000000000,25.25],[1388966400000000,25.17],[1388962800000000,23.05]]}

WarpScript commands:

    BUCKETSPAN

Stack:

    TOP: 3600000000  

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">

    // Let's recover 30 points from a GTS

    [
      '60VgNqxhAaCdS6_uOLtZNMGWAbGpS5xmPL4gAbC_QbCjRbBiS5KhR5KmNMGpRaJQ.cV3Aa4kR.WZQqBiO54oNFWnOLtnQr88O.7kBGQisxjnVyLaxkgLbUEd_RTgYDIS.Gg..4N.5A.06sg7.........1hWN6aUdSEjkD0Vqg...XAzOwylS22pDFB3Ou3RAhi1lSTt70mIuq.T_8BbJjMFUGqJ7zXuKLt637GYU6kSJBc2mZ4LOVlaKZBtPL1.ILO67BVs95RMgVmmoHOLD5KB2zM6P6m2RfmFjQ.PP62V5mYbYgOMc37ctkfN1K2DFbTFRK1D.pAca4VViRo3qSLcdWp.pcBXVyktZsbVR.B.PIcrpcc0...L_.NG..'
    ]
    UNWRAP

    // And bucketize it with a bucket span of 1 hour
    [ SWAP bucketizer.max 0 3600000000 0 ] BUCKETIZE

    // Let's extract a GTS from the list
    0 GET

    // Let's apply BUCKETSPAN
    BUCKETSPAN

</warp10-warpscript-widget>
{% endraw %}
