---
title: "PATTERNDETECTION"
layout: function
desc: "Detect patterns in a Geo Time Series."
category: "reference"
---

The `PATTERNDETECTION` function will detect patterns in a Geo Time Series. The patterns it is able to detect are those extracted by the [`PATTERNS`]() functions.

The detection process relies on four parameters, three of which are identical to those of `PATTERNS`. A *window size* which is the width of each interval on which the pattern extraction should be performed, a *pattern length* which will determine how the window is segmented, a *quantization scale* which will determine how many different buckets will be used to ventilate the series values, and a list of patterns to detect.

The following constraints are enforced:

* *pattern length* must divide *wind ow size*
* *quantization scale* must be a power of two from 2 to 65536
* `PATTERNDETECTION` can only be applied to numeric Geo Time Series which are bucketized and filled (*i.e.* no bucket with missing values).
* the patterns to detect must have been extracted with the same *quantization scale* and *pattern length*, the *window size* can be different.

The result of the pattern detection process is a new Geo Time Series with values only at ticks at which one of the patterns was detected. The actual pattern detected is not available, call `PATTERNDETECTION` with a single pattern if you need to keep track of it.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[ '2nCKYV' 'wBmeRF' ] 'patterns' STORE

NEWGTS 'cos' RENAME
1 720
<% DUP 2 * PI * 360 / COS  NaN DUP DUP 4 ROLL ADDVALUE %> FOR
[ SWAP bucketizer.last 720 1 0 ] BUCKETIZE 'cos' STORE

$cos $patterns 16 8 16 PATTERNDETECTION 'cos.detection' RENAME 'cos.detection' STORE
$cos
$cos.detection</warp10-warpscript-widget>
{% endraw %}    
