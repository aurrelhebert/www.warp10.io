---
title: "FINDSTATS"
layout: function
isPage: "true"
desc: "Computes statistics on matching GTS."
categoryTree: ["reference","functions"]
category: reference
signature: "[ 'token' 'class_selector' { labels_selectors } ]  FINDSTATS { statistics }"
---

The `FINDSTATS` function computes statistics on matching GTS. It expects a list of parameters on the stack. This list must contain a read token as string, then another string (that can contains a REGEXP) which corresponds to a class selector of a matching GTS on a Warp10 cluster and finally a labels map selector. This function return a map full of statistics on those series. 

It contains for example stats such as error rate or whether estimates on classes, gts, or labels.

*`FINDSTATS` is **NOT** available in standalone mode*

```
[ 'token' 'class_selector' { labels_selectors } ]  FINDSTATS { statistics }
```

## Example ##

WarpScript commands:

    [ 'TOKEN' 'myclass' { 'myLabel' '~foo.*' } ]
    FINDSTATS
