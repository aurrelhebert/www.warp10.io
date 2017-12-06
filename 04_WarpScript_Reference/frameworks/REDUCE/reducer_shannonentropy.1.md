---
title: "reducer.shannonentropy.1"
layout: "function"
isPage: "true"
link: "/warpscript/framework-reduce"
desc: "Return the entropy of a sliding window. 1 if singleton."
categoryTree: ["reference","frameworks"]
category: "reference"
---

The `reducer.shannonentropy.1` computes the [Shannon entropy](https://en.wikipedia.org/wiki/Entropy_%28information_theory%29#Entropy_as_information_content) of the values it receives from the framework `REDUCE` at each tick.

The values are considerred as occurences of an underlying symbol (or as values of a counter).

The returned entropy is normalized by being divided by `log(N)` where `N` is the number of values.

If `N` equals 1, then 1 is returned.

The input values must be of type *LONG*.


## Example ##

Stack:

      2:  {"c":"1","l":{},"a":{},"v":[[0,0],[100,1],[200,2],[300,3],[400,4],[500,5],[600,6],[700,7],[800,8],[900,9],[1000,10]]}
      1:  {"c":"2","l":{},"a":{},"v":[[0,0],[200,1],[400,2],[600,3],[800,4],[1000,5],[1200,6],[1400,7],[1600,8],[1800,9],[2000,10]]}
    TOP:  {"c":"3","l":{},"a":{},"v":[[0,0],[300,1],[600,2],[900,3],[1200,4],[1500,5],[1800,6],[2100,7],[2400,8],[2700,9],[3000,10]]}


WarpScript commands:

    3 ->LIST
    [ SWAP [] reducer.shannonentropy.1 ] REDUCE

Stack: 

    TOP:  [{"c":"","l":{},"a":{},"v":[[0,0],[100,1],[200,0.9182958340544894],[300,0.8112781244591328],[400,0.9182958340544894],[500,1],[600,0.9056185178648963],[700,1],[800,0.9182958340544894],[900,0.8112781244591328],[1000,0.9182958340544894],[1200,0.9709505944546688],[1400,1],[1500,1],[1600,1],[1800,0.9709505944546688],[2000,1],[2100,1],[2400,1],[2700,1],[3000,1]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>// generating the input list of 3 GTS
[
  1 3
  <%
    'j' STORE
    NEWGTS
    0 10 <% 'i' STORE $i $j * 100 * NaN NaN NaN $i  ADDVALUE %> FOR
    $j TOSTRING RENAME
  %>
  FOR
]

// calling REDUCE
[ SWAP [] reducer.shannonentropy.1 ] REDUCE
</warp10-warpscript-widget>
{% endraw %}    

