---
title: "ZIP"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: ""
categoryTree: ["reference","functions"]
category: "reference"
---
 

The function `ZIP` takes a list of lists as parameters. Each list which are not singletons must be of same size.

It returns a list of lists where the i-th list contains the i-th elements of each input list in the same order. Also, it considers singletons as a list of the same size with a duplicated value.

## Example ##


WarpScript commands:

    [ [ 1 2 3 ] [ 4 5 6 ] [ 7 ] [ 8 9 10 ] ]
    ZIP

Stack:

    TOP: [ [1,4,7,8],[2,5,7,9],[3,6,7,10] ]

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">[ [ 1 2 3 ] [ 4 5 6 ] [ 7 ] [ 8 9 10 ] ]
ZIP
</warp10-warpscript-widget>
{% endraw %}

