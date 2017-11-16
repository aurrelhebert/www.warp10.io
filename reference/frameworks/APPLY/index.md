---
title: "APPLY"
layout: "function"
isPage: "true"
link: "/warpscript/frameworks"
desc: "Apply a function to a set of Geo Time Series"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","501-framework-apply","500-framework-apply.html.md.eco"]
category: "reference"
---


The `APPLY` framework allows you to produce Geo Time Series<sup>TM</sup> whose values are the results of the application of a function on values of geo time series grouped in equivalence classes based on label values. The `APPLY` framework is somehow similar to the **REDUCE** framework, except it does not consider geo time series which appear in singletons in the parameter list when partitioning.

Values from geo time series appearing as singletons in the parameter list will be systematically passed to the operation being applied. This can prove handy for example to add a given geo time serie to all series in various equivalence classes.

## Syntax ##

```
[ [GTS] ... [GTS] [labels] op ] APPLY
```

`[GTS]` list of geo time series.

`[labels]` list of label names to use for partitioning. If this list is empty, all labels will be used.

`op` operation to apply

## Operations ##

See also [the list of available operations]({{ site.baseurl }}/reference/reference#framewors-operations)
Read the documentation of each operation carefully, some might operate on any number of geo time series, others might be restricted to some maximum number.
