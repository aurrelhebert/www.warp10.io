---
title: "EXPORT"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Sets or updates the list of exported symbols"
categoryTree: ["reference","functions"]
category: "reference"
---
 

The `EXPORT` function allows you to set or update a list of symbols which will be dumped upon script termination. This proves handy when debugging a script as you can visualize, even in the case of errors, the value of specific symbols.

The function expects either a symbol name (a string) which will be added to the current list of exported symbols, a list of symbol name which will replace the current list of exported symbols, an empty list to disable symbol export altogether, or a list with a single `NULL` element to instruct the WarpScript engine to export all existing symbols.

When symbols should be exported, the debug mode is implied (see `DEBUGON`).

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[ 'foo' ]
EXPORT
42 'foo' STORE
</warp10-warpscript-widget>

<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[ 'foo' ]
EXPORT
42 'foo' STORE
FAIL
</warp10-warpscript-widget>

{% endraw %}
