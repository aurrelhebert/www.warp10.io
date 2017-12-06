---
title: "MACROBUCKETIZER"
layout: "function"
isPage: "true"
link: "/warpscript/framework_bucketize"
desc: "Converts a macro into a bucketizer"
categoryTree: ["reference","frameworks"]
category: "reference"
signature: "macro MACROBUCKETIZER bucketizer"
---
 

`MACROBUCKETIZER` converts a macro into a *bucketizer* which can be used with the [`BUCKETIZE`](../framework-bucketize) framework

 For each tick in the mapped GTS, the macro will be called with a list containing the following elements on the stack:

    [tick_of_computation,[gts_classes],[label_bucketize],[ticks],[latitudes],[longitudes],[elevations],[values]]

After each call the macro is expected to leave on the stack a list with the following elements:

    [tick, latitude, longitude, elevation, value]

## Example ##

Initial stack:

    TOP: {"c":"","l":{},"a":{},"v":[[1434547818629894,0],[1434547818629895,1],[1434547818629896,2],[1434547818629897,3],[1434547818629898,4],[1434547818629899,5],[1434547818629900,6],[1434547818629901,7],[1434547818629902,8],[1434547818629903,9],[1434547818629904,10]]}

WarpScript commands:

    <%
      'mapping_window' STORE    //  Storing macro input information 
      $mapping_window 0 GET     // Extract the current tick
      <% 3 % 0 == %>            // Condition: the current tick % 3 == 0
      <% 
        $mapping_window 0 GET         // Tick
        $mapping_window 4 GET 0 GET   // Latitude
        $mapping_window 5 GET 0 GET   // Longitude
        $mapping_window 6 GET 0 GET   // Elevation
        $mapping_window 7 GET 0 GET   // Value
      %>                                            // Then
      <% $mapping_window 0 GET NaN NaN NaN 0 %>  // Else
      IFTE
    %>
    MACROBUCKETIZER
    0 2 0
    ]
    BUCKETIZE


Stack: 

    TOP: [{"c":"","l":{},"a":{},"v":[[1434547818629904,9],[1434547818629902,0],[1434547818629900,0],[1434547818629898,3],[1434547818629896,0],[1434547818629894,0]]}]


## Example ##

{% raw %}
<warp10-warpscript-widget>NEWGTS
[
    NEWGTS
    1434600618629894 3600000000 15 * - 1200000000 + 'now' STORE
    $now NaN NaN NaN 0 ADDVALUE
    $now 1 + NaN NaN NaN 1 ADDVALUE
    $now 2 + NaN NaN NaN 2 ADDVALUE
    $now 3 + NaN NaN NaN 3 ADDVALUE
    $now 4 + NaN NaN NaN 4 ADDVALUE
    $now 5 + NaN NaN NaN 5 ADDVALUE
    $now 6 + NaN NaN NaN 6 ADDVALUE
    $now 7 + NaN NaN NaN 7 ADDVALUE
    $now 8 + NaN NaN NaN 8 ADDVALUE
    $now 9 + NaN NaN NaN 9 ADDVALUE
    $now 10 + NaN NaN NaN 10 ADDVALUE
    <%
      'mapping_window' STORE    //  Storing macro input information 
      $mapping_window 0 GET     // Extract the current tick
      <% 3 % 0 == %>            // Condition: the current tick % 3 == 0
      <% 
        $mapping_window 0 GET         // Tick
        $mapping_window 4 GET 0 GET   // Latitude
        $mapping_window 5 GET 0 GET   // Longitude
        $mapping_window 6 GET 0 GET   // Elevation
        $mapping_window 7 GET 0 GET   // Value
      %>                                            // Then
      <% $mapping_window 0 GET NaN NaN NaN 0 %>  // Else
      IFTE
    %>
    MACROBUCKETIZER
    0 2 0
]
BUCKETIZE
</warp10-warpscript-widget>
{% endraw %}         