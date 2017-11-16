---
title: "REDUCE"
layout: "function"
isPage: "true"
link: "/reference/frameworks/frameworks"
desc: "Apply a reducer function to a set of Geo Time Series"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","301-framework-reduce","300-framework-reduce.html.md.eco"]
category: "reference"
---


The `REDUCE` framework operates on equivalence classes forming a partition of a set of geo time series. It outputs one geo time serie per equivalence class whose values are the results of the *reducer* function applied onto the set of values of all series in the equivalence class at each tick.

## Syntax ##

```
[ [GTS] ... [GTS] [labels] reducer ] REDUCE
```

`[GTS]` list of geo time series. All series from those lists will be gathered prior to computing the equivalence classes.

`[labels]` list of label names to use for computing the equivalence classes. If this list is empty, use all labels.

`reducer` function to apply on each tick of each equivalence classes.

See also [the list of available reducers]({{ site.baseurl }}/reference/reference#framework-reducers)
