---
title: "IFFT"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Computes an Inverse Fast Fourier Transform."
categoryTree: ["reference","functions"]
category: "reference"
---
 
The `IFFT` function computes an Inverse [Fast Fourier Transform](https://en.wikipedia.org/wiki/Fast_Fourier_transform) of two Geo Time Series representing real and imaginary parts of FFT coefficients.

The result is the reconstructed Geo Time Series. The ticks of this reconstructed GTS are the coefficient indices. They must be multipled by the original bucketspan to space the ticks according to the decomposed Geo Time Series. The bucketspan is equal to `X / (n * factor)` where `X` is the number of time units in a second, `n` is the number of coefficients and `factor` is the scale factor returned by `FFT`.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS
1 512
<% 'k' STORE $k 1000 * 500 + NaN NaN NaN $k 180.0 / DUP SIN SWAP 100 * COS + ADDVALUE %>
FOR
DUP
[ SWAP bucketizer.last 0 1000 0 ] BUCKETIZE
FFT
// Extract Re,Im and scale factor
UNLIST UNLIST
// Store scale factor
'factor' STORE
// Compute Inverse Fast Fourier Transform
IFFT
// Compute bucketspan
DUP SIZE 'n' STORE
STU $factor $n * /
// Multiply ticks by the bucketspan
TIMESCALE
//
// Note that the first tick is 0 regardless of the original GTS first tick
//
</warp10-warpscript-widget>
{% endraw %}        
