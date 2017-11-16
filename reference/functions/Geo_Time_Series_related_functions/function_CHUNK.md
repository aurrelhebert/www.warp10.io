---
title: "CHUNK"
layout: function
isPage: "true"
desc: "Chunks a GTS into partial GTS."
categoryTree: ["reference","functions"]
category: reference
signature: "gts lastchunkend chunkwidth chunkoverlap chunkcount chunklabel keepempty CHUNK [ gts_chunks ]"
---

The `CHUNK` is used to split a GTS into partial GTS. The user defines some parameters that will be applied to the split operation. The series will be splitted in chunks, each chunks will form a new GTS, with a label value corresponding to its first tick.

This function expects several parameter on the stack to be applied:

`gts` a single GTS or a GTS list to split (In case of a list each GTS  will be splitted individually).

`lastchunkend` the split operation end when it encounters this timestamp.

`chunkwidth` the width in time unit of each chunks.

`chunkoverlap` a time overlap for each chunks.

`chunkcount` the number of chunks to keep (starting from the last chunk).

`chunklabel` the label name of the label added by this split operation (add a value corresponding to the first tick of the chunk).

`keepempty` if true empty chunk are kept

This replaces on the stack each GTS by a list formed with its partial GTS.

```
gts lastchunkend chunkwidth chunkoverlap chunkcount chunklabel keepempty CHUNK [ gts_chunks ]
```


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Create a new GTS with ten values 
NEWGTS 
'test name'
RENAME
{ 'label0' '42' 'label1' 'foo' }
RELABEL
100  NaN NaN NaN 10 ADDVALUE
200  NaN NaN NaN  9 ADDVALUE
300  NaN NaN NaN  8 ADDVALUE
400  NaN NaN NaN  7 ADDVALUE
500  NaN NaN NaN  6 ADDVALUE
700  NaN NaN NaN  5 ADDVALUE
800  NaN NaN NaN  4 ADDVALUE
900  NaN NaN NaN  3 ADDVALUE
1000 NaN NaN NaN  2 ADDVALUE
1100 NaN NaN NaN  1 ADDVALUE
// Split GTS according to Chunk rule define by the User (each 500 time unit), splitting stopping at timestamp 1000.
1000 500 0 0 ".chunkid" false CHUNK
</warp10-warpscript-widget>
{% endraw %}