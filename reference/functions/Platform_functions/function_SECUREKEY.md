---
title: "SECUREKEY"
layout: "function"
link: "/warpscript/functions"
desc: "Set the secure key for creating secure scripts."
category: "reference"
---

Set the secure key before execute secured operations likes [secured scripts]({{ site.baseurl}}/reference/functions/securedscripts) or [UNSECURE]({{ site.baseurl}}/reference/functions/function_UNSECURE)

The given key is never stored on Warp10 plateform. Keep it preciously, we can't give it you back.

## Example ##

WarpScript commands:

    'YourPreciousSecret' SECUREKEY
    //  operation  with mandatory secured key (likes secured scripts)
    <S
      NOW
    S>

<!--
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
-->

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
'YourPreciousSecret' SECUREKEY
// Warp Script to protect
&lt;S
  NOW
S&gt;

'securedScript' STORE // Store the secured script generated

$securedScript EVALSECURE // Execute the secured script

'YourPreciousSecret' SECUREKEY
$securedScript UNSECURE // GET back the secured script content

</warp10-warpscript-widget>
{% endraw %}        
