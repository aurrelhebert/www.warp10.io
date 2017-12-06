---
title: "Fetch API"
layout: "function"
isPage: "true"
categoryTree: ["apis"]
oldPath: ["30-fetch.html.md"]
category: "apis"
---


The Fetch API allows to recover raw GTS data in a extremely quick and efficient way.


The HTTP endpoint used by the Fetch API is `https://API_ENDPOINT/api/vX/fetch`, where `API_ENDPOINT` is a
[valid  endpoint]({{ site.baseurl}}/apis) for the Warp 10 instance and `vX`is the version of the API you want to use (currently `v0`).
The Fetch API **must** be accessed using the *GET* method.


#### Request Header ####


To be authenticated you need to add a `X-Warp10-Token` header with your **read** token.

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
        <td>A valid read token</td>
      </tr>
    </tbody>
  </table>
</div>
</div>  

As modifying request headers can be difficult with certain HTTP clients, there is a fallback authentication mode: if headers can't be used, the token can be passed in a request parameter `token`.

#### Request parameters ####

The Fetch API request asks for the following parameters:

* `selector`: the selector is a string that allow us to select one or several GTS. Its composed of the concatenation of a classname selector and a labels selector.

  The class name selector is a string which represents an exact match if it starts with an '=', or a regular expression that the class name must match if it starts with '~'.

  The labels selector is a string delimited by curly brackets (`{}`) with a list of comma separated label selectors. Each of these label selectors is composed of the label name and the value of the associated selector. Those selectors can also be exact matches if they start with '=' or a regular expression if they start with '~'.

  Example:

  `~com.cityzendata.test.*{freq~2.*,steps=100}`

  It selects all GTS whose classnames begin with *com.cityzendata.test* and whose label *steps* has a value of 100 and whose label *freq* begins with 2.

* `format`: the format of the response data. Current available formats are:

  * `text`
  * `fulltext`

* `dedup`: if this parameter is true, sequences of successive datapoints with the same locations and value are compressed in the response, giving only the first and the last datapoints in the sequence.

  Example:

  * Response to request without `dedup`:

      1434590504758000// com.cityzendata.test.sinusoide{steps=100,.app=com.cityzendata.drill.test} 42
      1434590288758000// com.cityzendata.test.sinusoide{steps=100,.app=com.cityzendata.drill.test} 42
      1434590072758000// com.cityzendata.test.sinusoide{steps=100,.app=com.cityzendata.drill.test} 42
      1434589856758000// com.cityzendata.test.sinusoide{steps=100,.app=com.cityzendata.drill.test} 42
      1434589640758000// com.cityzendata.test.sinusoide{steps=100,.app=com.cityzendata.drill.test} 43
      1434589424758000// com.cityzendata.test.sinusoide{steps=100,.app=com.cityzendata.drill.test} 44

  * Response to request with `dedup`

      1434590504758000// com.cityzendata.test.sinusoide{steps=100,.app=com.cityzendata.drill.test} 42
      1434589856758000// com.cityzendata.test.sinusoide{steps=100,.app=com.cityzendata.drill.test} 42
      1434589640758000// com.cityzendata.test.sinusoide{steps=100,.app=com.cityzendata.drill.test} 43
      1434589424758000// com.cityzendata.test.sinusoide{steps=100,.app=com.cityzendata.drill.test} 44


* Fetching interval parameters: either

  * `start` and `stop`: the start and end timestamps defining the interval of the GTS to fetch. They are both in [ISO8601](http://en.wikipedia.org/wiki/ISO_8601) format, *i.e.* **YYYY-MM-DDTHH:MM:SS.SSSSSSZ**. Only those readings whose timestamps lie between those two timestamps (most recent inclusive, oldest exclusive) will be retained.  

  Or

  * `now` and `timespan`: instead of the basic interval search, with the start and end timestamps in ISO8601 format, you can use two alternative formats for the interval parameters:

    1. If you want to fetch readings whose timestamps lie in a specific timespan before a timestamp (for example all the readings in the last minute) you can use the end timestamp (in microseconds since the Unix epoch) as `now` parameter and the timespan (in microseconds) as `timespan`.

    1. If you want to recover the last `n` readings before a given instant, you can use the instant timestamp (in microseconds since the Unix epoch) as `now` parameter and `-n` as `timespan`.


#### Example ####

    GET /api/v0/fetch?now=1435091737000000&timespan=-10&selector=com.cityzendata.test.sinusoide{steps=100} HTTP/1.1
    Host: host

#### Response ####

The format of the response depends on the `format` parameter of the request.

* `fulltext`

  The *fulltext* format uses the [GTS Input Format]({{ site.baseurl}}/apis/gts-input-format) as output format.

  Example:

      1434590504758000// com.cityzendata.test.sinusoide{steps=100,.app=com.cityzendata.drill.test} -0.6133061918698982
      1434590288758000// com.cityzendata.test.sinusoide{steps=100,.app=com.cityzendata.drill.test} 0.9228427144511169
      1434590072758000// com.cityzendata.test.sinusoide{steps=100,.app=com.cityzendata.drill.test} 0.1301889411087915
      1434589856758000// com.cityzendata.test.sinusoide{steps=100,.app=com.cityzendata.drill.test} -0.9909979074466949
      1434589640758000// com.cityzendata.test.sinusoide{steps=100,.app=com.cityzendata.drill.test} 0.38860822449533416
      1434589424758000// com.cityzendata.test.sinusoide{steps=100,.app=com.cityzendata.drill.test} 0.7875576742396682
      1434589208758000// com.cityzendata.test.sinusoide{steps=100,.app=com.cityzendata.drill.test} -0.8009024241854527
      1434588992758000// com.cityzendata.test.sinusoide{steps=100,.app=com.cityzendata.drill.test} -0.36827736651082893
      1434588776758000// com.cityzendata.test.sinusoide{steps=100,.app=com.cityzendata.drill.test} 0.993699252984253
      1434588560758000// com.cityzendata.test.sinusoide{steps=100,.app=com.cityzendata.drill.test} -0.15193398008971615

* `text`

  The *text* format uses a less verbose version of the  [GTS Input Format]({{ site.baseurl}}/apis/gts-input-format) as output format.
  In this format the data for each GTS is grouped and classname and labels are only written in the first line of each group.

  Example:

      1434590504758000// com.cityzendata.test.sinusoide{steps=100,.app=com.cityzendata.drill.test} -0.6133061918698982
      =1434590288758000// 0.9228427144511169
      =1434590072758000// 0.1301889411087915
      =1434589856758000// -0.9909979074466949
      =1434589640758000// 0.38860822449533416
      1434590504758000/48.44348858110607:-4.407284064218402/ com.cityzendata.drill.test.sinusoide{location=true,steps=100,.app=com.cityzendata.drill.test} -0.6133061918698982
      =1434590288758000/48.44348858110607:-4.407284064218402/ 0.9228427144511169
      =1434590072758000/48.44348858110607:-4.407284064218402/ 0.1301889411087915
      =1434589856758000/48.44348858110607:-4.407284064218402/ -0.9909979074466949
      =1434589640758000/48.44348858110607:-4.407284064218402/ 0.38860822449533416
