---
title: "DISCORDS"
layout: function
desc: "Detects discords in a Geo Time Series."
categoryTree: ["reference","functions"]
category: "reference"
---

The `DISCORDS` function detects discords in a Geo Time Series. The discord detection algorithm is based on identifying outlier patterns in the Geo Time Series. Outliers are patterns which differ significantly from their nearest neighbor.

The function expects a distance ratio on top of the stack, this ratio is used to ignore patterns whose distance to their nearest neighbor is less than 1/ratio that of the previously selected pattern. This parameter is for advanced users, it is safe to leave it to 0.0.

The next parameter expected is a boolean flag indicating whether or not the `DISCORDS` function should report overlapping discords.

The next parameter is the maximum number of discords to identify.

The next parameters are identical to those of [PATTERNS]({{site.baseurl}}/reference/functions/function_PATTERNS), a *window size* which is the width of each interval on which the pattern extraction should be performed, a *pattern length* which will determine how the window is segmented, and lastly a *quantization scale* which will determine how many different buckets will be used to ventilate the series values.

The following constraints are enforced:

* *pattern length* must divide *wind ow size*
* *quantization scale* must be a power of two from 2 to 65536
* `DISCORDS` can only be applied to numeric Geo Time Series which are bucketized and filled (*i.e.* no bucket with missing values).

The result of the discord detection is a Geo Time Series whose ticks are those where discords were detected. The value, location and elevation at each tick are those of the input Geo Time Series.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS
1 7200
// Add datapoint, with 0.1% of anomalies
<% DUP 2 * PI * 360 / SIN <% RAND 0.01 < %> <% 0.001 + %> IFT NaN DUP DUP 4 ROLL ADDVALUE %> FOR
[ SWAP bucketizer.last 720 1 0 ] BUCKETIZE
32 8 16 5 false 0.0 DISCORDS
</warp10-warpscript-widget>
{% endraw %}    
