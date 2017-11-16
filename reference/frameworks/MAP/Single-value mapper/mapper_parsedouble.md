---
title: "mapper.todouble"
layout: "function"
isPage: "true"
link: "/warpscript/framework_map"
desc: "Convert the single value in a sliding window to DOUBLE"
categoryTree: ["reference","frameworks","framework-map"]
oldPath: ["20-frameworks","201-framework-map","201-single-value-mappers","130-mapper_todoble.html.md"]
category: "reference"
---
 
This *mapper* function converts a string **single value** in a sliding window to DOUBLE.

The `mapper.parsedouble` function can be applied to data of type **STRING**.

This function expects a [IETF BCP 47 language tag string](https://docs.oracle.com/javase/8/docs/api/java/util/Locale.html#forLanguageTag-java.lang.String-) parameter in top of the mapper. This tag is used to parse the String given as Input according to the specified double format of this language.

## Example ##

Stack:

    TOP: Mark  
         [{"c":"toto","l":{"label0":"42"},"a":{},"v":[[10,'2,1'],[20,'4,2']]}]

WarpScript commands:

      "fr"              // Language tag corresponding to the language used in the string format
      mapper.todouble.from.language   // Setting the mapper.todouble
      0 0 0             // Sliding window of 1 (0 pre and 0 post), no options
    ]
    MAP

Stack: 

    TOP:  [{"c":"","l":{"label0":"42"},"a":{},"v":[[10,2.1],[20,4.2]]}]

## Let's play with it ##

{% raw %}
<warp10-warpscript-widget>
[
  NEWGTS 
  { 'label0' '42' } RELABEL 10 NaN NaN NaN '2,1' ADDVALUE 20 NaN NaN NaN '4,2' ADDVALUE

  "fr" mapper.parsedouble  // Setting the mapper.parseDouble 
  0 0 0 // Sliding window of 1 (0 pre and 0 post), no options 
] MAP
</warp10-warpscript-widget>
{% endraw %}    