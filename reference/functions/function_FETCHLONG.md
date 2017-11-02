---
title: "FETCHLONG"
layout: function
desc: "Fetches data from the store, forcing the returned Geo Time Series to be of type LONG."
categoryTree: ["reference","functions"]
category: reference
---

Warp 10 does not force data stored in a given Geo Time Series to be of a single type, but it forces a single type when manipulating the data.

`FETCHLONG` fetches data from the store, forcing the returned Geo Time Series to be of type LONG.

The syntax of the parameters of `FETCHLONG` is a list of parameters identical to that supported by  `FETCH`.

```
[ 'token' 'class_selector' { labels_selectors } now timespan ]  FETCHLONG [ gts ]
```
