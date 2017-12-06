---
title: "IDWT"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Computes an Inverse Discrete Wavelet Transform on a GTS."
categoryTree: ["reference","functions"]
category: "reference"
---
 
The `IDWT` function computes an Inverse [Discrete Wavelet Transform](https://en.wikipedia.org/wiki/Discrete_wavelet_transform) on a Geo Time Series.

The function expects the name of the Wavelet to consider on top of the stack and an input Geo Time Series which contains the wavelet coefficients as is returned by [FDWT]({{ site.baseurl}}/reference/functions/function_FDWT).

The result is the reconstructed Geo Time Series.

The names of the available Wavelet are the following:

- [haar](http://wavelets.pybytes.com/wavelet/haar/)
- [db1](http://wavelets.pybytes.com/wavelet/db1/)
- [db2](http://wavelets.pybytes.com/wavelet/db2/)
- [db3](http://wavelets.pybytes.com/wavelet/db3/)
- [db4](http://wavelets.pybytes.com/wavelet/db4/)
- [db5](http://wavelets.pybytes.com/wavelet/db5/)
- [db6](http://wavelets.pybytes.com/wavelet/db6/)
- [db7](http://wavelets.pybytes.com/wavelet/db7/)
- [db8](http://wavelets.pybytes.com/wavelet/db8/)
- [db9](http://wavelets.pybytes.com/wavelet/db9/)
- [db10](http://wavelets.pybytes.com/wavelet/db10/)
- [db11](http://wavelets.pybytes.com/wavelet/db11/)
- [db12](http://wavelets.pybytes.com/wavelet/db12/)
- [db13](http://wavelets.pybytes.com/wavelet/db13/)
- [db14](http://wavelets.pybytes.com/wavelet/db14/)
- [db15](http://wavelets.pybytes.com/wavelet/db15/)
- [db16](http://wavelets.pybytes.com/wavelet/db16/)
- [db17](http://wavelets.pybytes.com/wavelet/db17/)
- [db18](http://wavelets.pybytes.com/wavelet/db18/)
- [db19](http://wavelets.pybytes.com/wavelet/db19/)
- [db20](http://wavelets.pybytes.com/wavelet/db20/)
- [sym2](http://wavelets.pybytes.com/wavelet/sym2/)
- [sym3](http://wavelets.pybytes.com/wavelet/sym3/)
- [sym4](http://wavelets.pybytes.com/wavelet/sym4/)
- [sym5](http://wavelets.pybytes.com/wavelet/sym5/)
- [sym6](http://wavelets.pybytes.com/wavelet/sym6/)
- [sym7](http://wavelets.pybytes.com/wavelet/sym7/)
- [sym8](http://wavelets.pybytes.com/wavelet/sym8/)
- [sym9](http://wavelets.pybytes.com/wavelet/sym9/)
- [sym10](http://wavelets.pybytes.com/wavelet/sym10/)
- [sym11](http://wavelets.pybytes.com/wavelet/sym11/)
- [sym12](http://wavelets.pybytes.com/wavelet/sym12/)
- [sym13](http://wavelets.pybytes.com/wavelet/sym13/)
- [sym14](http://wavelets.pybytes.com/wavelet/sym14/)
- [sym15](http://wavelets.pybytes.com/wavelet/sym15/)
- [sym16](http://wavelets.pybytes.com/wavelet/sym16/)
- [sym17](http://wavelets.pybytes.com/wavelet/sym17/)
- [sym18](http://wavelets.pybytes.com/wavelet/sym18/)
- [sym19](http://wavelets.pybytes.com/wavelet/sym19/)
- [sym20](http://wavelets.pybytes.com/wavelet/sym20/)
- [coif1](http://wavelets.pybytes.com/wavelet/coif1/)
- [coif2](http://wavelets.pybytes.com/wavelet/coif2/)
- [coif3](http://wavelets.pybytes.com/wavelet/coif3/)
- [coif4](http://wavelets.pybytes.com/wavelet/coif4/)
- [coif5](http://wavelets.pybytes.com/wavelet/coif5/)
- [bior1.1](http://wavelets.pybytes.com/wavelet/bior1.1/)
- [bior1.3](http://wavelets.pybytes.com/wavelet/bior1.3/)
- [bior1.5](http://wavelets.pybytes.com/wavelet/bior1.5/)
- [bior2.2](http://wavelets.pybytes.com/wavelet/bior2.2/)
- [bior2.4](http://wavelets.pybytes.com/wavelet/bior2.4/)
- [bior2.6](http://wavelets.pybytes.com/wavelet/bior2.6/)
- [bior2.8](http://wavelets.pybytes.com/wavelet/bior2.8/)
- [bior3.1](http://wavelets.pybytes.com/wavelet/bior3.1/)
- [bior3.3](http://wavelets.pybytes.com/wavelet/bior3.3/)
- [bior3.5](http://wavelets.pybytes.com/wavelet/bior3.5/)
- [bior3.7](http://wavelets.pybytes.com/wavelet/bior3.7/)
- [bior3.9](http://wavelets.pybytes.com/wavelet/bior3.9/)
- [bior4.4](http://wavelets.pybytes.com/wavelet/bior4.4/)
- [bior5.5](http://wavelets.pybytes.com/wavelet/bior5.5/)
- [bior6.8](http://wavelets.pybytes.com/wavelet/bior6.8/)
- [rbio1.1](http://wavelets.pybytes.com/wavelet/rbio1.1/)
- [rbio1.3](http://wavelets.pybytes.com/wavelet/rbio1.3/)
- [rbio1.5](http://wavelets.pybytes.com/wavelet/rbio1.5/)
- [rbio2.2](http://wavelets.pybytes.com/wavelet/rbio2.2/)
- [rbio2.4](http://wavelets.pybytes.com/wavelet/rbio2.4/)
- [rbio2.6](http://wavelets.pybytes.com/wavelet/rbio2.6/)
- [rbio2.8](http://wavelets.pybytes.com/wavelet/rbio2.8/)
- [rbio3.1](http://wavelets.pybytes.com/wavelet/rbio3.1/)
- [rbio3.3](http://wavelets.pybytes.com/wavelet/rbio3.3/)
- [rbio3.5](http://wavelets.pybytes.com/wavelet/rbio3.5/)
- [rbio3.7](http://wavelets.pybytes.com/wavelet/rbio3.7/)
- [rbio3.9](http://wavelets.pybytes.com/wavelet/rbio3.9/)
- [rbio4.4](http://wavelets.pybytes.com/wavelet/rbio4.4/)
- [rbio5.5](http://wavelets.pybytes.com/wavelet/rbio5.5/)
- [rbio6.8](http://wavelets.pybytes.com/wavelet/rbio6.8/)
- [dmey](http://wavelets.pybytes.com/wavelet/dmey/)
 
## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS
1 512 <% 'i' STORE $i NaN NaN NaN $i 360.0 / 2 PI * * SIN $i 512.0 / 2 PI * * COS + ADDVALUE %> FOR
'db9'
FDWT
'db9'
IDWT
</warp10-warpscript-widget>
{% endraw %}        
