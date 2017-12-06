---
title: "Secured Scripts"
layout: "function"
isPage: "true"
link: "/warpscript/securedscripts"
desc: "Secured scripts allow users to protect a given WarpScript"
categoryTree: ["reference","functions"]
category: "reference"
---


Secured scripts allow users to protect a given WarpScript. As WarpScript can be executed from a browser (via https request), tokens and script content are directly exposed client side.

Once generated a secured script is evaluated using 
[EVALSECURE]({{ site.baseurl}}/reference/functions/function_EVALSECURE).

Secured are declared with the `<S YOUR_WARPSCRIPT_HERE S>` syntax, always preceded by a [SECUREKEY]({{ site.baseurl}}/reference/functions/function_SECUREKEY) onto the stack.

Warning, we never store the given [SECUREKEY]({{ site.baseurl}}/reference/functions/function_SECUREKEY), keep your secure key preciously, this the only way we have for give you back secured script's content with [UNSECURE]({{ site.baseurl}}/reference/functions/function_UNSECURE) function.


## Example ##

Secured script is a good way for protect read/write tokens and limit [FETCH]({{ site.baseurl}}/reference/functions/function_FETCH) to a restricted scope.

WarpScript commands:

    'YourPreciousSecretKey' SECUREKEY
    // Warp Script to protect
    <S 
      [ 
        'TOKEN' // READ TOKEN
        'com.cityzendata.tutorial.sensors.temperature'
        { 'labelkey' 'labelvalue'}
        '2015-11-01T00:00:00.000000Z' // Start time
        '2015-12-01T00:00:00.000000Z' // Stop time
      ] FETCH
    S>


Stack:

    TOP:  "_HPJNn_n54ORDHdmOTr2qy4fpxr ... Am0XPK661CSItiwCkGIzxQtkoUzgF_hnt8Xu3F"

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
'YourPreciousSecret' SECUREKEY
// Warp Script to protect
<S 
  [ 
    'TOKEN' // READ TOKEN
    'com.cityzendata.tutorial.sensors.temperature'
    { 'labelkey' 'labelvalue'}
    '2015-11-01T00:00:00.000000Z' // Start time
    '2015-12-01T00:00:00.000000Z' // Stop time
  ] FETCH
S>

</warp10-warpscript-widget>
{% endraw %}    