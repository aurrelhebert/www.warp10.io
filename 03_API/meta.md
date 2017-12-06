---
title: "Meta API"
layout: "function"
isPage: "true"
categoryTree: ["apis"]
category: "apis"
---


The Meta API allows you to set attributes on Geo Time Series. Attributes are key/value pairs which are attached to GTS like labels but which are mutable, meaning you can modify them during the lifetime of a series. Attributes are searched like labels when selecting GTS.

The HTTP endpoint used by the Meta API is `https://API_ENDPOINT/api/vX/meta`, where `API_ENDPOINT` is a
[valid  endpoint]({{ site.baseurl}}/apis) for the Warp 10 instance and `vX`is the version of the API you want to use (currently `v0`).
The Meta API **must** be accessed using the *POST* method.

#### Request Header ####


To be authenticated you need to add a `X-Warp10-Token` header with your **write** token.

<div class="panel panel-default">
<div class="panel-body">
  <table class="table">
    <thead>
      <tr>
        <th>Header</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>X-Warp10-Token</code></td>
        <td>A valid write token</td>
      </tr>
    </tbody>
  </table>
</div>
</div>  

#### Request body ####

The body of the request contains the GeoTimeSeries whose attributes should be modified in the following format:

```
class{labels}{attributes}
...
```

`class` and `labels` are used to identify the GTS to modify and `attributes` contain the comma separated list of attribute *name/value* pairs to set for the GTS.

If the `Content-Type` header is set to `application/gzip`, the request body is assumed to be compressed using GZip.

#### Example ####

    POST /api/v0/meta HTTP/1.1
    Host: host
    X-Warp10-Token: TOKEN

    class1{label1=val1,label2=val2}{attr1=val1,attr2=val2}
    class2{label=value}{attribtue=value}

#### Response ####

The Meta API does not return any content.
