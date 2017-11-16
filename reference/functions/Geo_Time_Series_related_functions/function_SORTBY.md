---
title: "SORTBY"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Sort list of Geo Time Series according to values extracted by a macro"
categoryTree: ["reference","functions"]
category: "reference"
---
 

The function `SORTBY` applies the macro on top of the stack to every GTS in the list below it. Each macro run is expected to leave on the stack a value which will be associated with the GTS it ran on. Those values will then be used to sort the GTS. The values returned by the macro runs must all be of the same type (either LONG, DOUBLE or STRING).


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">//
// Create 3 Geo Time Series
//

1 3
<%
  NEWGTS
  SWAP TOSTRING RENAME
  1 100
  <%
    RAND NaN NaN NaN 4 ROLL ADDVALUE 
  %>
  FOR
%>
FOR
3 ->LIST

//
// Sort the GTS according to their mean
//

<%
  false MUSIGMA DROP
%>
SORTBY
</warp10-warpscript-widget>
{% endraw %}
