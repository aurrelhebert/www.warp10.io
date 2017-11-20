---
title: "FIND"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Find Geo Time Series matching some criteria"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","50-gts","801-function_FIND.html.md"]
category: "reference"
---
 

The `FIND` function finds Geo Time Series<sup>TM</sup> matching some criteria.

The top of the stack must contain a LIST with 3 parameters:  a Warp10 token, a classname selector and a MAP of label selectors.

The classname selector is a string which represents an exact match if it starts with an '=', or a regular expression if it starts with '~'.

The label selectors are packed in a MAP whose keys are the label names and the values the associated selector. Those selectors can also be exact matches if they start with '=' or a regular expression if they start with '~'.

In the case of exact matching, the '=' can be omitted.

## Use ##

The function pushes onto the stack the LIST of retrieved Geo Time Series.

WarpScript commands:

    'READ_TOKEN'
    'gts.name'
    { 'attribute' '~0.*' }
    FIND

Stack:    
    
    TOP: [ GTS-1, GTS-2 ... ]
     

