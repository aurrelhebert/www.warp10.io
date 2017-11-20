---
title: "DELETE"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Delete a set of GTS."
categoryTree: ["reference","functions"]
category: "reference"
signature: "'writeToken' 'gts_selector' start_timestamp end_timestamp count DELETE actualCount"
---
 
The `DELETE` function is used to delete a set of GTS from a Warp10 platform. A **delete endpoint** must be set on the Warp10 configuration.

Delete expects 5 parameters on top of the stack: the write token of the Warp10 application, a string corresponding to a gts selector, a start and a end timestamp and finally the number of GTS expected to be deleted. 

*For safety reasons DELETE will first perform a dryrun call to the /delete endpoint to retrieve the number of GTS which would be deleted by the call. If this number is above the expected number provided by the user the actual delete will not be performed and instead an error will be raised.*

Delete will push as a result the number of GTS really deleted.

```
'writeToken' 'gts_selector' start_timestamp end_timestamp count DELETE actualCount
```

## Example ##

WarpScript commands:

    // Write token
    'TOKEN'

    // Gts selector
    'gts.to.delete{}'

    // Start Timestamp
    1479372838011043

    // End timestamp
    NOW

    // DELETE expects a count number (if nb GTS > count, DELETE is stopped)
    1

    DELETE 
