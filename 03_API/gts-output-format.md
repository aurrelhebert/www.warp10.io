---
title: "Geo Time Series output format"
layout: "function"
isPage: "true"
categoryTree: ["apis"]
oldPath: ["91-gts-output-format.html.md"]
category: "apis"
---


Geo Time Series data retrieved from the Warp10 platform are output in a compact [JSON](http://www.json.org/) format.

The returned value is an array of objects, each object being a chunk of Geo Time Serie.

Each chunk has the following fields:

##### **c** #####

This is the class name of the Geo Time Serie. This may be present in only one chunk of a given Geo Time Serie in the output.

##### **l** #####

This is an object containing the labels of the Geo Time Serie. This may be present in only one chunk of a given Geo Time Serie in the output.

##### **a** #####

This is an object containing the attributes (*key/value*) of the Geo Time Serie. This may be present in only one chunk of a given Geo Time Serie in the output.

##### **i** #####

This is an id which is unique per Geo Time Serie in the output (but not across outputs). All chunks of a given Geo Time Serie will have the same id and can therefore easily be identified and merged.

##### **v** #####

Array of Geo Time Serie readings.

Each reading is itself an array containing 2, 3, 4 or 5 elements.

The first element of the array is the timestamp of the reading in microseconds since the [Unix Epoch](http://en.wikipedia.org/wiki/Unix_epoch).

The last element of the array is the value of the reading, the type of this element varies with the type of the reading.

When the reading array has 3 elements, the second element is the elevation of the reading, in millimeters.

When the reading array has 4 elements, the second and third elements are the latitude and longitude of the reading.

When the reading array has 5 elements, the second and third elements are the latitude and longitude of the reading and the fourth is its elevation.

#### Example ####

    [{"c":"class",
      "l":{"label0":"value0","label1":"value1"},
      "a":{"attr0":"value0"},
      "i":"1",
      "v":[[1380475081000000,3.14],
           [1380475081500000,48.0,-4.5,2.5],
           [1380475082000000,10000000,3.0]]},
     {"i":"1",
      "v":[[1380475083000000,48.1,-4.5,11000000,42.0]]}]