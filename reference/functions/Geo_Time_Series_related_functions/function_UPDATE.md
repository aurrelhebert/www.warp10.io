---
title: "UPDATE"
layout: "function"
desc: "Pushes datapoints to the Warp 10 backend."
category: "reference"
---
 
Updates Geo Time Series in the Warp 10 backend by pushing their datapoints.

This function expects on top of the stack a write token which will be used to authenticate with the Warp 10 backend. Below the token it expects to find a Geo Time Series or a list thereof. All datapoints from those Geo Time Series will be pushed to the Warp 10 backend.

As a safety measure, only Geo Time Series on which the `RENAME` function has been applied may be updated. If you wish to keep the same name, do `DUP NAME RENAME` on your Geo Time Series prior to calling `UPDATE`.
