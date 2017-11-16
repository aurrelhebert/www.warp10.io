---
title: "MACROREDUCER"
layout: "function"
isPage: "true"
link: "/warpscript/framework_reduce"
desc: "Converts a macro into a reducer"
categoryTree: ["reference","frameworks"]
oldPath: ["20-frameworks","301-framework-reduce","400-reducer_MACROREDUCER.html.md"]
category: "reference"
---



`MACROREDUCEPER` converts a macro into a *reducer* which can be used with the [`REDUCE`](../framework-reduce) framework

 For each tick in the GTS to reduce, the macro will be called with a list containing the following elements on the stack:

    [tick_of_computation,[gts_classes],[label_maps],[ticks],[latitudes],[longitudes],[elevations],[values]]

After each callm the macro is expected to leave on the stack a list with the following elements:

    [tick, latitude, longitude, elevation, value]

## Example ##

Initial stack:

    TOP: [{"c":"doc.data","l":{"sensorId":"c2"},"a":{},"v":[[10,17],[11,19],[12,15],[13,16],[14,16],[15,15],[16,18],[17,15],[18,15],[19,17],[20,18],[21,19],[22,19],[23,19],[24,15],[25,19],[26,18],[27,18],[28,16],[29,19],[30,17],[31,18],[32,19],[33,19],[34,15],[35,19],[36,18],[37,15],[38,15],[39,19]]},{"c":"test.temp","l":{"sensorId":"c3"},"a":{},"v":[[20,19],[21,16],[22,17],[23,18],[24,17],[25,18],[26,19],[27,15],[28,18],[29,19],[30,16],[31,16],[32,15],[33,17],[34,15],[35,16],[36,19],[37,17],[38,15],[39,18]]},{"c":"test.temp","l":{"sensorId":"c1"},"a":{},"v":[[0,17],[1,19],[2,16],[3,18],[4,19],[5,16],[6,17],[7,18],[8,18],[9,15],[10,19],[11,17],[12,17],[13,19],[14,19],[15,16],[16,16],[17,16],[18,16],[19,18]]}]

WarpScript commands:

    <%
      // We are doing a reducer.mean.nonnull that ignores not null values when calculating the mean    
      'input' STORE                 //  Storing macro input information
      0 'total' STORE  
      0 'elements' STORE            // The number of nun null elements

      $input 7 GET                  // Get the values
    	<%
    		'val' STORE    		
    		<% $val ISNULL ! %>         // If condition : Value non null
    		<%
    		  $total $val + 'total' STORE       // Increasing total    		  
    		  $elements 1 + 'elements' STORE  // Increasing element count
    		%>
    		IFT
    	%>
    	FOREACH
    	$total $elements / 'mean' STORE   // Calculating the mean

      $input 0 GET         // Tick
      $input 4 GET 0 GET   // Latitude
      $input 5 GET 0 GET   // Longitude
      $input 6 GET 0 GET   // Elevation
      $mean                // Value
    %> 'reducer.mean.nonnull' STORE

    []
    $reducer.mean.nonnull MACROREDUCER    
    3 ->LIST
    REDUCE


Stack:

    TOP: [{"c":"","l":{".app":"doc.data"},"a":{},"v":[[0,17],[1,19],[2,16],[3,18],[4,19],[5,16],[6,17],[7,18],[8,18],[9,15],[10,18],[11,18],[12,16],[13,17],[14,17],[15,15],[16,17],[17,15],[18,15],[19,17],[20,18],[21,17],[22,18],[23,18],[24,16],[25,18],[26,18],[27,16],[28,17],[29,19],[30,16],[31,17],[32,17],[33,18],[34,15],[35,17],[36,18],[37,16],[38,15],[39,18]]}]


## Let's play with it ##

{% raw %}
<warp10-warpscript-widget backend-url="https://warp.cityzendata.net/dist"><%
  	'input' STORE      // We keep the input in a variable
  	0 'total' STORE  
  	0 'elements' STORE // The number of nun null elements
  	$input 7 GET       // Get the values
	<%
		'val' STORE
		<% $val ISNULL ! %> // If condition : Value non null
		<%
		  $total $val +       'total' STORE  
		  // Increasing total
		  $elements 1 + 'elements' STORE  // Increasing element count
		%>
		IFT
	%>
	FOREACH
	$total $elements / 'mean' STORE   // Calculating the mean
	$input 0 GET NaN NaN NaN $mean
%> 'reducer.mean.ignorenull' STORE
[
  '60V8S5KnS1toOLpk5k9701tWR6.7O5xYAaGWS537RqKiRqxmHLF1Nn3LXsXMjhYGz8Bt4emFa9LYuu1Pb.3Q.0V6PLtbRaKnRk0L.0Vn6sg7.........ECGJy4YODOZ033yGYNFkFkXLEVNqP4w1572Zwl.WWsn.AVWYzkp....4acG..'
  '60V8S5KnS1toOLpk5k9701tWR6.7O5xYAaGWS537RqKiRqxmHLF1Nn7LXsXMjhYGz8Bt4eMTaSviitX8eF3Q.0V6PLtbRaKnRk0L.0W.6sg7.........EElJyCYODSZt5CZsqCZ.YAt52_.E.WXsLCZ0O7V.QVRFdNOeVqcW.ZemV3J0F0QeVn4Jk...0Pa.G3.'
  '60V8S5KnS1toOLpk5k9701tWR6.7O5xYAaGWS537RqKiRqxmHLF1NnBLXsXMjhYGz8Bt4cjHwiTOcUrZBGg.5.SdQaSmOMCn.4N.52NUXkV.........wz4IsLCZtLCZ.HBVVl6BNDOYOD73Bhb..Z0W2Y.2X8WV22N.7dj8E2g....LSW3.'
]
UNWRAP
DUP
[]
$reducer.mean.ignorenull MACROREDUCER
3 ->LIST
REDUCE
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend-url="https://warp.cityzendata.net/dist"><%
  	'input' STORE      // We keep the input in a variable
  	0 'total' STORE  
  	0 'elements' STORE // The number of nun null elements
  	$input 7 GET       // Get the values
	<%
		'val' STORE
		<% $val ISNULL ! %> // If condition : Value non null
		<%
		  $total $val +       'total' STORE  
		  // Increasing total
		  $elements 1 + 'elements' STORE  // Increasing element count
		%>
		IFT
	%>
	FOREACH
	$total $elements / 'mean' STORE   // Calculating the mean
	$input 0 GET NaN NaN NaN $mean
%> 'reducer.mean.ignorenull' STORE
[
  '60V8S5KnS1toOLpk5k9701tWR6.7O5xYAaGWS537RqKiRqxmHLF1Nn3LXsXMjhYGz8Bt4emFa9LYuu1Pb.3Q.0V6PLtbRaKnRk0L.0Vn6sg7.........ECGJy4YODOZ033yGYNFkFkXLEVNqP4w1572Zwl.WWsn.AVWYzkp....4acG..'
  '60V8S5KnS1toOLpk5k9701tWR6.7O5xYAaGWS537RqKiRqxmHLF1Nn7LXsXMjhYGz8Bt4eMTaSviitX8eF3Q.0V6PLtbRaKnRk0L.0W.6sg7.........EElJyCYODSZt5CZsqCZ.YAt52_.E.WXsLCZ0O7V.QVRFdNOeVqcW.ZemV3J0F0QeVn4Jk...0Pa.G3.'
  '60V8S5KnS1toOLpk5k9701tWR6.7O5xYAaGWS537RqKiRqxmHLF1NnBLXsXMjhYGz8Bt4cjHwiTOcUrZBGg.5.SdQaSmOMCn.4N.52NUXkV.........wz4IsLCZtLCZ.HBVVl6BNDOYOD73Bhb..Z0W2Y.2X8WV22N.7dj8E2g....LSW3.'
]
UNWRAP
[]
$reducer.mean.ignorenull MACROREDUCER
3 ->LIST
REDUCE 0 GET VALUES 'values' STORE
$values 0 GET 17 == ASSERT
$values 10 GET 18 == ASSERT
$values 39 GET 18 == ASSERT
$values SIZE 40 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
