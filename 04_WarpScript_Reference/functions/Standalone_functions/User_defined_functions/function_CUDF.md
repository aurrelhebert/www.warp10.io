---
title: "CUDF"
layout: function
isPage: "true"
desc: "Invoke a possibly cached version of a UDF."
categoryTree: ["reference","functions"]
category: reference
signature: "'class' CUDF ..."
---

Invoke a possibly cached version of a UDF. A user defined function (UDF) corresponds to a custom function defined by a user. To learn about how to create and deploy a UDF, please read [this tutorial](/howto/create-a-udf/).

Once a UDF is deployed in Warp10, the `CUDF` function can be used to invoke it. Just put on top of the stack the java class of the UDF to load.
The use of CUDF will cache the created instance of the UDF used and thus will speed up overall execution.

Of course if your UDF is not thread safe then it should not be called by `CUDF`, but as this is not something you can control, we advise that you design your UDFs so they can be called concurrently from multiple threads.

```
'class' CUDF ...
```