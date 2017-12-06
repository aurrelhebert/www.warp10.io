---
title: "WarpScript data manipulation API"
layout: "function"
isPage: "true"
categoryTree: ["apis"]
oldPath: ["20-warpscript.html.md"]
category: "apis"
---


The [WarpScript](../reference/concepts) data manipulation library can be used via the Warp10 API (*Synapse*).


The HTTP endpoint used by the WarpScript API is `https://API_ENDPOINT/api/vX/exec`, where `API_ENDPOINT` is a
[valid  endpoint]({{ site.baseurl}}/apis) for the public Warp10 API and `vX`is the version of the API you want to use (currently `v0`).
The WarpScript API **must** be accessed using the *POST* method.


#### Request Header ####

No special headers are required.

#### Request Body ####

The request body contains the *WarpScript* script to execute.

#### Example ####

    POST /api/v0/exec/warpscript HTTP/1.1
    Host: host

    //
    // This is an WarpScript Script
    //

    // Egress token to use
    'TOKEN_VALUE' 'token' STORE

    [
      $token                          // read token
      '~class.*'                      // Class name selector
      { 'foo' '=bar' }                // Labels selector
      '2013-01-01T00:00:00.000000Z'   // start timestamp
      '2014-01-01T00:00:00.000000Z'   // end timestamp
    ]
    FETCH

#### Response ####

The response body contains a JSON array whose elements are the different levels of the WarpScript stack, the first element being the top of the stack.

Elements which cannot be represented in JSON (such as functions) will be represented as *null*.
