---
title: "FFTAP"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Computes a Fast Fourier Transform on a GTS, returning amplitude and phase."
categoryTree: ["reference","functions"]
category: "reference"
---
 
The `FFTAP` function computes a [Fast Fourier Transform](https://en.wikipedia.org/wiki/Fast_Fourier_transform) on a Geo Time Series or a list thereof it expects on top of the stack.

The result of the `FFTAP` execution is a list of two Geo Time Series and a frequency scale factor per input GTS. The first resulting GTS contains the amplitude of the coefficient at that frequency and the second the associated phase. The scale factor is equal to `X/(n * bucketspan)` where `n` is the number of elements in the origin GTS and `X` is the number of time units per second. The ticks of those Geo Time Series are indices from 0 to the number of values in the original series minus one. The frequency associated with each tick is `tick * factor`, with the exception of tick 0 which is `n * factor`.

`FFTAP` can only be applied to bucketized numerical Geo Time Series which contains a number of values which is a power of 2.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS
1 512
<% 'k' STORE $k 1000 * 500 + NaN NaN NaN $k 180.0 / DUP SIN SWAP 100 * COS + ADDVALUE %>
FOR
DUP
[ SWAP bucketizer.last 0 1000 0 ] BUCKETIZE
FFTAP
</warp10-warpscript-widget>
{% endraw %}        
