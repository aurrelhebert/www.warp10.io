---
title: "CALL"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Invoke an external program."
categoryTree: ["reference","functions"]
category: "reference"
---
 
The `CALL` function invokes the external program whose path is on top of the stack. The calling convention will pass to the external program the STRING object below the path on a line by itself on standard input after having URL encoded the STRING. The invoked program is expected to return a URL encoded STRING object if invocation was successful, or a space followed by a URL encoded error message if an error was encoutered.

If you need to pass complex structures to the invoked program, you can use functions such as [->JSON](({{ site.baseurl}}/reference/functions/function_TOJSON)), [->PICKLE](({{ site.baseurl}}/reference/functions/function_TOPICKLE)) and [->B64](({{ site.baseurl}}/reference/functions/function_TOB64)) to encode the input prior to the invocation.

Examples of callable programs are provided in [shell](https://github.com/cityzendata/warp10-platform/blob/master/warp10/src/main/sh/callable.sh) and [python](https://github.com/cityzendata/warp10-platform/blob/master/warp10/src/main/python/callable.py).
