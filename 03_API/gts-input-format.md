---
title: "Geo Time Series input format"
layout: "function"
isPage: "true"
categoryTree: ["apis"]
oldPath: ["90-gts-input-format.html.md"]
category: "apis"
---


The Warp10 Platform can be fed data via an [Ingress](ingress) endpoint.

The [Ingress](ingress) endpoint has an HTTP or HTTPS URL of the form `http://host:port/api/vX/update` where **X** is the version of the API being used.

This endpoint MUST be called using the HTTP method [POST](http://en.wikipedia.org/wiki/POST_(HTTP)).

#### Request Body ####

The body of the call contains the readings which should be pushed into the platform, one per line.

Each line has the following format:

```
   TS/LAT:LON/ELEV NAME{LABELS} VALUE
```

where each element has the following syntax and meaning:

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
          <td>
             Timestamp of the reading, in <b>microseconds</b> since the Unix Epoch. <br />
             If omitted, the time of the data ingestion will be used as the time of the reading
          </td>
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
          <td>
            Class name of the reading as a [URL encoded](http://en.wikipedia.org/wiki/Percent-encoding) UTF-8 character string. <br >
            The encoding of character `{` (Unicode *LEFT CURLY BRACKET*, *0x007B*) is MANDATORY.
          </td>
        </tr>
         <tr>
          <td><code>LABELS</code></td>
          <td>
            Comma separated list of labels, using the syntax `key=value` where both `key` and `value` are URL encoded UTF-8 character strings. <br !>
            If a key or value contains `,` (Unicode COMMA, 0x002C),`}` (Unicode RIGHT CURLY BRACKET, 0x007D) or `=` (Unicode EQUALS SIGN, 0x003D), those characters MUST be encoded.
        </td>
        </tr>
        <tr>
          <td><code>VALUE</code></td>
          <td>The value of the reading. It can be of one of four types: *LONG*, *DOUBLE*, *BOOLEAN*, *STRING*</td>
        </tr>
      </tbody>
    </table>
  </div>
</div>  
  



### Additional details about`VALUE`  ###

A *LONG* value is represented as a sequence of digits optionally prefixed with a '+' or '-' sign. The values that can be represented span from -2^63 to 2^63-1.

    1234567890

A *DOUBLE* value is represented as a sequence of digits, a mandatory decimal separator ('.'), and a mandatory sequence of digits following the separator. The values that can be represented are those representable in the 64 bits [IEEE754 double precision floating point format](http://en.wikipedia.org/wiki/Double_precision_floating-point_format).

    3.14159265359

A *BOOLEAN* value is represented as either **T** (for *true*) or **F** (for *false*).

    T

Lastly, a *STRING* value is represented as a URL encoded UTF-8 character string enclosed in single quotes.

    'caf%C3%A9'


### Request Headers ###

The Warp10 ingress token MUST be passed as the value of the `X-Warp10-Token` HTTP header.

If the request body is compressed, the `Content-Type` header MUST be set to the value `application/gzip`.

### Example ###

    POST /api/v0/update HTTP/1.1
    Host: host
    X-Warp10-Token: TOKEN
    Content-Type: text/plain

    1380475081000000// foo{label0=val0,label1=val1} 123
    /48.0:-4.5/ bar{label0=val0} 3.14
    1380475081123456/45.0:-0.01/10000000 foobar{label1=val1} T

