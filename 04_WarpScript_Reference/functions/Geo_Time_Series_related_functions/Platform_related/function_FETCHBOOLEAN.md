---
title: "FETCHBOOLEAN"
layout: function
desc: "Fetches data from the store, forcing the returned Geo Time Series to be of type BOOLEAN."
category: reference
categoryTree: ["reference","functions"]
---

Warp 10 does not force data stored in a given Geo Time Series to be of a single type, but it forces a single type when manipulating the data.

`FETCHBOOLEAN` fetches data from the store, forcing the returned Geo Time Series to be of type BOOLEAN.

The syntax of the parameters of `FETCHBOOLEAN` is a list of parameters identical to that supported by  `FETCH`.

```
[ 'token' 'class_selector' { labels_selectors } now timespan ]  FETCHBOOLEAN [ gts ]
```
