---
title: Pushing data
layout: function
isPage: true
oldPath: 20-pushing-data.html.md.eco
category: howto
---


Data is sent into the platform via HTTP [POST](http://en.wikipedia.org/wiki/POST_(HTTP)) requests to the Warp 10 API.

The HTTP endpoint used to send data is `https://API_ENDPOINT/api/vX/update`, where `API_ENDPOINT` is the URL of a Warp 10 platform and `vX`is the version of the API you want to use (currently `v0`).

The Warp 10 API MUST be accessed using the *POST* method.

All requests MUST be authenticated, as described below.

HTTP status codes are used to indicate the request action that happened during the process (sucess, redirection, client error, server error). The following status are common:


<div class="panel panel-default">
<div class="panel-body">
  <table class="table">
    <thead>
      <tr>
        <th>Code</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>200</td>
        <td>Successful request. Body will contain a JSON hash of response data</td>
      </tr>
      <tr>
        <td>400</td>
        <td>Error: details in response body</td>
      </tr>
      <tr>
        <td>401</td>
        <td>Authentication error: response body will contain an explanation</td>
      </tr>
      <tr>
        <td>403</td>
        <td>Forbidden: app disabled or over message quota</td>
      </tr>
    </tbody>
  </table>
</div>  
</div>



## Update POST request ##

```
   POST /api/v0/update
```

### Headers ###

To be authentified you need to add a `X-Warp10-Token` header with your **write** token.

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

### Body ###

In the body of the POST request you put the Geo Time Series in the [GTS input format]({{ site.baseurl }}/apis/gts-input-format), one reading by line.

```
   TS/LAT:LON/ELEV NAME{LABELS} VALUE
```


GTS Input Format cheat sheet:


<div class="panel panel-default">
<div class="panel-body"><table class="table">
    <thead>
      <tr>
        <th>Parameter</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>TS</code></td>
        <td>Timestamp of the reading, in time unit of the system (by default in <b>microseconds</b>) since the Unix Epoch</td>
      </tr>
      <tr>
        <td><code>LAT:LON</code></td>
        <td>*Optional* geographic coordinates of the reading, using [WGS84](http://en.wikipedia.org/wiki/WGS84)</td>
      </tr>
      <tr>
        <td><code>ELEV</code></td>
        <td>*Optional* elevation of the reading, in millimeters</td>
      </tr>
      <tr>
        <td><code>NAME</code></td>
        <td>Class name of the reading as a [URL encoded](http://en.wikipedia.org/wiki/Percent-encoding) UTF-8 character string. The encoding of character `{` (Unicode *LEFT CURLY BRACKET*, *0x007B*) is MANDATORY.</td>
      </tr>
       <tr>
        <td><code>LABELS</code></td>
        <td>Comma separated list of labels, using the syntax `key=value` where both `key` and `value` are URL encoded UTF-8 character strings. If a key or value contains `,` (Unicode COMMA, 0x002C),`}` (Unicode RIGHT CURLY BRACKET, 0x007D) or `=` (Unicode EQUALS SIGN, 0x003D), those characters MUST be encoded.</td>
      </tr>
      <tr>
        <td><code>VALUE</code></td>
        <td>The value of the reading. It can be of one of four types: `LONG`, `DOUBLE`, `BOOLEAN`, `STRING`</td>
      </tr>
    </tbody>
  </table>
</div>
</div>  


## Successful response ##

The GTS points have been received and stored into the platform.

## Example ##

```
    POST /api/v0/update HTTP/1.1
    Host: host
    X-Warp10-Token: TOKEN
    Content-Type: text/plain

    1380475081000000// foo{label0=val0,label1=val1} 123
    /48.0:-4.5/ bar{label0=val0} 3.14
    1380475081123456/45.0:-0.01/10000000 foobar{label1=val1} T
```


## Example using *curl* ##

```
    curl -H 'X-Warp10-Token: TOKEN_WRITE' --data-binary @METRICS_FILE 'https://API_ENDPOINT/api/v0/update'
```

Where `TOKEN_WRITE` is a valid write token for the platform, `METRICS_FILE` is text file where every line is a GTS input format
and `API_ENDPOINT` is a [valid  endpoint]({{ site.baseurl }}/apis/endpoints) for the public Warp 10 API.

Here you have sample `METRICS_FILE`:

```
    1382441207762000/51.501988:0.005953/ some.sensor.model.humidity{xbeeId=XBee_40670F0D,moteId=53,area=1} 79.16
    1382441237727000/51.501988:0.005953/ some.sensor.model.humidity{xbeeId=XBee_40670F0D,moteId=53,area=1} 75.87
    1382441267504000/51.501988:0.005953/ some.sensor.model.humidity{xbeeId=XBee_40670F0D,moteId=53,area=1} 74.46
    1382441267504000/51.501988:0.005953/ some.sensor.model.humidity{xbeeId=XBee_40670F0D,moteId=53,area=1} 73.55
    1382441297664000/51.501988:0.005953/ some.sensor.model.humidity{xbeeId=XBee_40670F0D,moteId=53,area=1} 72.30
    1382441327765000/51.501988:0.005953/ some.sensor.model.humidity{xbeeId=XBee_40670F0D,moteId=53,area=1} 70.73
    1382441327765000/51.501988:0.005953/ some.sensor.model.humidity{xbeeId=XBee_40670F0D,moteId=53,area=1} 69.50
    1382441357724000/51.501988:0.005953/ some.sensor.model.humidity{xbeeId=XBee_40670F0D,moteId=53,area=1} 68.24
    1382441387792000/51.501988:0.005953/ some.sensor.model.humidity{xbeeId=XBee_40670F0D,moteId=53,area=1} 66.66
    1382441387792000/51.501988:0.005953/ some.sensor.model.humidity{xbeeId=XBee_40670F0D,moteId=53,area=1} 65.73
```
