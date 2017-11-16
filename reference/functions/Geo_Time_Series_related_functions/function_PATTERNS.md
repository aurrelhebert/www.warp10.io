---
title: "PATTERNS"
layout: function
desc: "Extract patterns from a Geo Time Series."
category: "reference"
---

The `PATTERNS` function extracts symbolic patterns (or motifs) from a Geo Time Series. Those patterns are similar to [iSAX](http://www.cs.ucr.edu/~eamonn/iSAX/iSAX.html) symbols.

The extraction process relies on three parameters, a *window size* which is the width of each interval on which the pattern extraction should be performed, a *pattern length* which will determine how the window is segmented, and lastly a *quantization scale* which will determine how many different buckets will be used to ventilate the series values.

The following constraints are enforced:

* *pattern length* must divide *wind ow size*
* *quantization scale* must be a power of two from 2 to 65536
* `PATTERNS` can only be applied to numeric Geo Time Series which are bucketized and filled (*i.e.* no bucket with missing values).

The result of the pattern extraction process is a new Geo Time Series of patterns. The value at each tick is the pattern corresponding to the window of *window size* starting at the given tick.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NEWGTS
1 720
<% DUP 2 * PI * 360 / SIN NaN DUP DUP 4 ROLL ADDVALUE %> FOR
[ SWAP bucketizer.last 720 1 0 ] BUCKETIZE
32 8 16 PATTERNS</warp10-warpscript-widget>
{% endraw %}    
