---
title: "UDF"
layout: function
isPage: "true"
desc: "Invoke a UDF."
categoryTree: ["reference","functions"]
category: reference
signature: "'class' UDF ..."
---

A user defined function (UDF) corresponds to a custom WarpScript function defined by a user. To learn about how to create and deploy a UDF, please read [this tutorial](/howto/create-a-udf/).

Once a UDF is deployed in Warp10, the `UDF` function can be used to invoke it. Just put on top of the stack the java class of the UDF to load.

This function will create a new instance of your UDF at each invocation. You may instead want to use [`CUDF`](/reference/functions/function_CUDF/) which will cache (hence the leading `C`) the created instance and thus will speed up overall execution.

Of course if your UDF is not thread safe then it should not be called by `CUDF`, but as this is not something you can control, we advise that you design your UDFs so they can be called concurrently from multiple threads.

## Example ##

```
'class' UDF ...
```