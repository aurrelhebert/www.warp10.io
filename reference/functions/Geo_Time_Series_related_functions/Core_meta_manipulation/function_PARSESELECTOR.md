---
title: "PARSESELECTOR"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Parse a Geo Time Series selector into a class selector and a labels selection MAP"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","800-function_PARSESELECTOR.html.md"]
category: "reference"
---


The `PARSESELECTOR` function parses a GTS Selector in a String and push the class selector and labels selector onto the stack.

## Example ##

WarpScript commands:

    'com.cityzendata.tutorial.sensors.temperature{sensorId=01}' PARSESELECTOR


Response stack:


    TOP: {"sensorId":"=01"}
    1:   com.cityzendata.tutorial.sensors.temperature


## Tips ##

It can be used to simplify calls to the [`FETCH`]({{ site.baseurl}}/reference/functions/function_FETCH) function.

Instead of doing the fetch passing the class selector and the labels selectors as individual WarpScript commands, as in the
[`FETCH`]({{ site.baseurl}}/reference/functions/function_FETCH) example:

    [
      'READ_TOKEN'
      'com.cityzendata.tutorial.sensors.temperature'
      { 'sensorId' '=01' }
      '2014-01-05T00:00:00.000Z'
      '2014-01-05T23:59:59.999Z'
    ]
    FETCH

You can use *PARSESELECTOR* to simplify the sintax:

    [
      'READ_TOKEN'
      'com.cityzendata.tutorial.sensors.temperature{sensorId=01}' PARSESELECTOR
      '2014-01-05T00:00:00.000Z'
      '2014-01-05T23:59:59.999Z'
    ]
    FETCH


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'com.cityzendata.tutorial.sensors.temperature{sensorId=01}' PARSESELECTOR
</warp10-warpscript-widget>
{% endraw %}    
