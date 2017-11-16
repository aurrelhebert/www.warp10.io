---
title: "MAXBUCKETS"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Modifies the maximum number of buckets which can be created by a call to BUCKETIZE."
categoryTree: ["reference","functions"]
category: "reference"
---
 
Execution of WarpScript code is performed on a stack which has a set of limits in order to prevent bad things to happen. Those limits have both a soft and a hard limit which can be configured on the backend. By default a limit is set to its soft limit value, but it can be modified from within the script up to the hard limit value.

The `MAXBUCKETS` function modifies the maximum number of buckets which can be created by a call to [`BUCKETIZE`]({{ site.baseurl }}/reference/frameworks/framework-bucketize) by setting it to the value on top of the stack.

Prior to calling this function, you must call [`AUTHENTICATE`]({{ site.baseurl }}/reference/functions/function_AUTHENTICATE) with a valid token. 
