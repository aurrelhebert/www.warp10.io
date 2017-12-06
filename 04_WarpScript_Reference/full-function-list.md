---
title: "Full list of WarpScript functions"
layout: "function"
isPage: "true"
categoryTree: ["reference"]
oldPath: ["01-full-function-list.html.md"]
category: "reference"
---


## ! ##

Negates the boolean on top of the stack.

``` bool ! bool ```

## != ##

Checks if two elements on the stack are different.

``` num num != bool ```

## % ##

Computes the remainder.

``` x modulus % remainder ```

## & ##

Performs a logical AND between longs.

``` long1 long2 & long ```

## && ##

Performs a boolean AND between elements.

``` bool1 bool2 && bool ```

## * ##

Multiplies two numbers on the stack.

``` num num * num ```

## ** ##

Performs exponentiation.

```num num ** num ```

## + ##

Performs an addition between two elements on the stack. Semantics depends on types.

``` num num + num ```

## - ##

Performs a subtraction of two elements on the stack.

``` num num - num ```

## ->BIN ##

Converts a string to its binary representation.

``` 'string' ->BIN 'binary string' ```

## ->B64 ##

Encodes a string in base64.

``` 'string' ->B64 'encoded' ```

## ->B64URL ##

Encodes a string in base64url.

``` 'string' ->B64URL 'encoded' ```

## ->BYTES ##

Converts string into a byte array given a charset.

``` 'string' 'charset' ->BYTES 'byte array' ```

## ->HEX ##

Encode a string in hexadecimal.

``` 'string' ->HEX 'hexstring' ```

## ->JSON ##

Converts the object on top of the stack to its JSON representation as a string.

``` obj ->JSON 'json' ```

## ->LIST ##

Builds a list from elements on the stack.

``` obj1 ... objn n ->LIST [ obj1 ... objn ] ```

## ->MAP ##

Builds a map.

``` key1 value1 ... keyn valuen 2*n ->MAP { key1 value1 ... keyn valuen } ```

## ->OPB64 ##

Encodes a string in order preserving base64.

``` 'decoded' ->OPBB64 'encoded' ```

## ->Q ##

Converts coordinates to a quaternion.

``` w x y z ->Q q ```

## ->SET ##

Transforms a list into a set.

``` [ list ] ->SET ( set ) ```

## / ##

Divides one number by another.

```num num / num ```

## < ##

Cheks if two elements on the stack are in strict increasing order.

``` num num < bool ```

## <= ##

Checks if two elements on the stack are in increasing order.

``` num num <= bool ```

## == ##

Checks if two elements on the stack are equal.

``` num num == bool ```

## > ##

Checks if two elements on the stack are in strict decreasing order.

``` num num > bool ```

## >= ##

Checks if two elements on the stack are in decreasing oreder.

``` num num >= bool ```

## ABS ##

Computes the absolute value of the top of the stack.

``` x ABS Math.abs(x) ```

## ACOS ##

Computes the arccos of the value on top of the stack.

``` x ACOS Math.acos(x) ```

## ADDVALUE ##

Adds a value to a GTS.

``` gts [ tick latitude longitude elevation value ] ADDVALUE gts ```

## AESUNWRAP ##

Unwrap a wrapped byte array with the AES algorithm using a given key.

``` 'wrapped' 'key' AESUNWRAP 'unwrapped' ```

## AESWRAP ##

Wrap a byte array with the AES algorithm using a given key.

```  'unwrapped' 'key' AESWRAP 'wrapped' ```

## AND ##

This is sinonymous for &&.

``` AND ```

## APPEND ##

Append a list to another list of a map to another map.

``` [ elt1 ... eltn ] [ obj1 ... objn ] APPEND [ elt1 ... eltn obj1 ... objn ] ```

## APPLY ##

Apply a function to GTS.

``` [ [ gts ] ... [ gts ] [ labels ] function ] APPLY [ gts ] ```

## ASIN ##

Computes the arcsin of the value on top of the stack .

``` x ASIN Math.asin(x) ```

## ASSERT ##

Checks the boolean on top of the stack, fails if it is false.

``` bool ASSERT - ```

## ATAN ##

Computes the arctan of the value on top of the stack.

``` x ATAN Math.atan(x) ```

## ATBUCKET ##

Retrieves the reading of a GTS at a given bucket.

``` gts bucket ATBUCKET [ tick latitude longitude elevation value ] ```

## ATINDEX ##

Retrieves the reading of a GTS at a given index.

``` gts index ATINDEX [ tick latitude longitude elevation value ] ```

## ATTICK ##

Retrieves the reading of a GTS at a given tick.

``` gts tick ATTICK [ tick latitude longitude elevation value ] ```

## ATTRIBUTES ##

Retrieves the attribtues of a GTS.

``` gts ATTRIBUTES { attributes } ```

## AUTHENTICATE ##

Authenticates the current stack.

``` 'token' AUTHENTICATE - ```

## B64-> ##

Converts a base64 encoded content into a string.

``` 'encoded' B64-> 'decoded' ```

## B64URL-> ##

Concerts content encoded in base64url into a string.

``` 'encoded' B64URL-> 'decoded' ```

## BITCOUNT ##

Computes the length of a bitset and the number of bits set.

``` bitset BITCOUNT cardinality length ```

## BITGET ##

Gets a bit in a bits set.

``` bitset bitnumber BITGET bit ```

## BITSTOBYTES ##

Converts a bitset into a byte array.

``` bitset BITSTOBYTES bytearray ```

## BYTESTOBITS ##

Converts a byte array into a bitset.

``` bytearray BYTESTOBITS bitset ```


## BREAK ##

Break out of the current loop.

``` - BREAK - ```

## BUCKETCOUNT ##

Pushes the number of buckets of a bucketized GTS onto the stack.

``` bucketized_gts BUCKETCOUNT bucketcount ```

## BUCKETIZE ##

Bucketizes a GTS.

``` [ [ gts ] bucketizer lastbucket bucketspan bucketcount ] BUCKETIZE [ bucketized_gts ] ```

## BUCKETSPAN ##

Pushes the bucketspan of a bucketized GTS onto the stack.

``` bucketized_gts BUCKETSPAN bucketspan ```

## BYTES-> ##

Converts a byte array into a string given a charset.

``` 'byte array' 'charset' BYTES-> 'string' ```

## CBRT ##

Computes the cube root of the value on top of the stack.

``` x CBRT Math.cbrt(x) ```

## CEIL ##

Pushed the smallest (closest to negative infinity) double value that is greater than or equal to the top of the stack and is equal to a mathematical integer..

``` x CEIL Math.ceil(x) ```

## CHUNK ##

Chunks a GTS into partial GTS.

``` gts lastchunkend chunkwidth chunkcount chunklabel keepempty CHUNK [ gts_chunks ] ```

## CLEAR ##

Clears the stack.

``` obj1 ... objn  CLEAR - ```

CLEARSYMBOLS

Clears symbols.

``` CLEARSYMBOLS ``` 

## CLEARTOMARK ##

Clears the stack up to and including the first *mark* encountered.

``` x mark y z CLEARTOMARK x ```

## CLIP ##

Clip a Geo Time Series according to a series of limits.

``` gts [ [ lower1 upper1 ] ... ] CLIP [ gts1 ...gtsn] ```

## CLONE ##

Clone the GTS on top of the stack.

``` gts CLONE gts_clone ```

## CLONEEMPTY ##

Clone the GTS on top of the stack without its values.

``` gts CLONEEMPTY gts_empty_clone ```

## CLONEREVERSE ##

Reverse the elements of a list by first cloning the list.

``` [ elt1 ... eltn ] CLONEREVERSE [ eltn ... elt1 ] ```

## COMMONTICKS ##

Replaces a list of GTS on the stack with one of modified GTS with only the ticks where all input GTS have values.

``` [ gts ] COMMONTICKS [ gts ] ```

## COMPACT ##

Replace multiple contigual identical value/location/elevation by a single one.

``` gts COMPACT compacted_gts ```

## CONTAINS ##

Checks if a list contains an element.

``` { list } elt CONTAINS { list } bool ```

## CONTAINSKEY ##

Checks if a map contains a key.

``` { map } 'key' CONTAINSKEY { map } bool ```

## CONTAINSVALUE ##

Checks if a map contains a value.

``` { map } value CONTAINSVALUE { map } bool ```

## CONTINUE ##

Continue a loop by skipping to its next iteration.

``` - CONTINUE - ```

## COPYGEO ##

Forces the location elements of a GTS onto others.

``` [ gts ] gts COPYGEO [ gts ] ```

## COPYSIGN ##

Copies the sign of a number on anotherone.

``` x y COPYSIGN x_with_sign_of_y ```

## CORRELATE ##

Compute correlation between GTS.

``` gts [ gts ] [ offsets ] CORRELATE [ correlation_gts ] ```

## COS ##

Computes the cosine of the top of the stack.

``` x COS Math.cos(x) ```

## COSH ##

Computes the hyperbolic cosine of the top of the stack.

``` x COSH Math.cosh(x) ```

## COUNTER ##

Push a counter (AtomicLong) onto the stack.

``` COUNTER counter ```

## COUNTERDELTA ##

Increment a counter.

``` counter delta COUNTER counter ```

## COUNTERVALUE ##

Retrieve the value of a counter.

``` counter COUNTERVALUE long ```

## COUNTTOMARK ##

Counts he the number of elements up to, but excluding, the first *mark* encountered.

``` mark obj1 ... objn COUNTTOMARK mark obj1 ... objn n ```

## CROP ##

Crop bucketized GTS so they span the largest interval with actual values.

``` [ gts ] CROP [ gts ] ```

## CSTORE ##

Conditionaly store an object in a symbol, i.e. only if the symbol does not yet exist.

``` obj 'symbol' CSTORE - ```

## CUDF ##

Invoke a possibly cached version of a UDF.

``` 'class' CUDF ... ```

## DEBUGOFF ##

Turn off stack output on failure.

``` - DEBUGOFF - ```

## DEBUGON ##

Turn on stack output on failure.

``` - DEBUGON - ```

## DEDUP ##

Removes duplicate readings from a GTS.

``` gts DEDUP dedupped_gts ```

## DEF ##

Redefine an WarpScript function with a macro .

``` macro 'function' DEF - ```

## DEFINED ##

Checks if a symbol is defined.

``` 'symbol' DEFINED bool ```

## DEFINEDMACRO ##

Checks if a macro is defined.

``` 'macro' DEFINEDMACRO bool ```

## DEPTH ##

Pushes the current depth of the stack onto the stack.

``` obj1 ... objn  DEPTH obj1 ... objn n ```

## DIFFERENCE ##

Computes the difference of two sets.

``` set1 set2 DIFFERENCE set ```

## DISCORDS ##

Detects discords in a GTS.

``` [ gts ] windowlen wordlen alphabetsize count mayoverride DISCORDS [ gts ] ```

## DOC ##

Stores the string on top of the stack as the documentation of the macro being defined.

``` 'description' DOC - ```

## DOCMODE ##

Put the stack into doc mode. Macro invocations will push their doc onto the stack.

``` -  DOCMODE  - ```

## DOUBLEEXPONENTIALSMOOTHING ##

Apply double exponential smoothing on a gts.

``` [ gts ] alpha beta DOUBLEEXPONENTIALSMOOTHING [ gts ] ```

## DROP ##

Removes the top of the stack.

``` obj1 obj2 DROP obj1 ```

## DROPN ##

Removes n elements from the stac.

``` obj0 obj1 ... objn n DROPN obj0 ```

## DTW ##

Perform dynamic time warping distance computation between GTS.

``` gts1 gts2 threshold DTW distance ```

## DUP ##

Duplicate the element on top of the stack.

``` obj DUP obj obj ```

## DUPN ##

Duplicate n elements of the stack.

``` obj0 obj1 ... objn n DUPN obj0 obj1 ... objn obj1 ... objn ```

## DURATION ##

Parses an ISO8601 duration into a number of time units.

``` 'duration' DURATION time_units ```

## DWTSPLIT ##

Split a GTS representing a wavelet transform into separate gts for each scale.

``` gts DWTSPLIT [ scale_gts ] ```

## E ##

Pushes the Euler number onto the stack.

```- E 2.71828...```

## ELAPSED ##

Pushes onto the stack the collected timing infos.

``` - ELAPSED [ timings ] ```

## ELEVATIONS ##

Extracts elevations from a GTS.

``` gts ELEVATIONS [ elevations ] ```

## ESDTEST ##

Detect anomalous ticks in GTS instances by doing an extreme studentized deviate test, given an upperbound to the number of anomalies (use modified Zscore if useMedian == true, default statistical significance is 0.05).

``` [ gts ] upperbound useMedian (significance) ESDTEST [ [ anomalous_ticks ] ] ```

## EVAL ##

Evaluates a string as an WarpScript script.

``` 'string' EVAL ... ```

## EVALSECURE ##

Evaluates a secure script.

``` 'secure_script' EVALSECURE ... ```

## EVERY ##

Executes the macro at the given interval (Mobius endpoint).

``` macro interval EVERY ... ```

## EXP ##

Computes the exponential of the top of the stack.

``` x EXP Math.exp(x) ```

## EXPM1 ##

Computes exp^x - 1.

``` x EXPM1 Math.expm1(x) ```

## FAIL ##

Aborts the execution of the script.

``` - FAIL ```

## FDWT ##

Forward Discrete Wavelet Transform.

``` [ gts ] 'wavelet' FDWT [ gts ] ```

## FETCH ##

Fetches data from the store.

``` [ 'token' 'class_selector' { labels_selectors } now timespan ]  FETCH [ gts ] ```

## FFT ##

Computes a Fast Fourier Transform.

``` gts FFT [ re_gts im_gts freq ] ```

## FFTAP ##

Computes a Fast Fourier Transform, outputing amplitude and phase.

``` gts FFTAP [ amp_gts phase_gts freq ] ```

## FILLNEXT ##

Fills gaps in a bucketized GTS with the next known reading.

``` bucketized_gts FILLNEXT filled_bucketized_gts ```

## FILLPREVIOUS ##

Fills gaps in a bucketized GTS with the previously known reading.

``` bucketized_gts FILLPREVIOUS filled_bucketized_gts ```

## FILLTICKS ##

Fills the given ticks with lat/lon/elevation/value if they don't already have values.

``` [ unbucketized_gts ] [ lat lon elevation value [ ticks ] ] FILLTICKS [ gts ] ```

## FILLVALUE ##

Fills gaps in a bucketized GTS with a constant reading.

``` bucketized_gts [ latitude longitude elevation value ] FILLVALUE filled_bucketized_gts ```

## FILTER ##

Filter GTS.

``` [ [ gts ] [ labels ] filter ] FILTER [ gts ] ```

## FIND ##

Find matching GTS.

``` [ 'token' 'class_selector' { labels_selectors } ] FIND [ gts ] ```

## FINDSETS ##

Extracts classes and label values of matching GTS.

``` [ 'token' 'class_selector' { labels_selectors } ] FINDSETS [ classes ] { 'label1' [ label1_values ] ... 'labeln' [ labeln_values ] } { 'attr1' [ attr1_values ] ... 'attrn' [ attrn_values ] } ```

## FINDSTATS ##

Computes statistics on matching GTS.

``` [ 'token' 'class_selector' { labels_selectors } ]  FINDSTATS { statistics } ```

## FIRSTTICK ##

Pushes the first tick of the GTS onto the stack.

``` gts FIRSTTICK firsttick ```

## FLATTEN ##

Flatten a list of lists.

``` [ obj1 [ obj2_1 ... obj2_n ] obj3 ] FLATTEN [ obj1 obj2_1 ... obj2_n obj3 ] ```

## FLOOR ##

Returns the largest (closest to positive infinity) double value that is less than or equal to the top of the stack and is equal to a mathematical integer..

``` x FLOOR Math.floor(x) ```

## FOR ##

Executes a macro in a loop.

``` from to macro FOR ... ```

## FOREACH ##

Applies a macro on each element of a list or map.

``` [ elts ] macro FOREACH ... ```

## FORGET ##

Removes a symbol from the symbol table.

``` 'symbol' FORGET - ```

## FORSTEP ##

Executes a macro in a loop with a step computed by a macro between iterations.

``` from to stepmacro macro FORSTEP ... ```

## FROMBITS ##

Converts the long on top of the stack to a double by considering its value as the raw bits of the long.

``` long FROMBITS double ```

## FROMHEX ##

Converts an hex encoded long into a long.

``` 'hex' FROMHEX long ```

## FUSE ##

Merge chunks of GTS together.

``` [ gts_chunks ] FUSE gts ```

## GEO.INTERSECTS ##

Checks if a GTS has at least one point within a shape.

``` [ gts ] shape GEO.INTERSECTS [ bool ] ```

## GEO.WITHIN ##

Checks if a GTS is contained within a shape.

``` [ gts ] shape GEO.WITHIN [ bool ] ```

## GEO_INTERSECTION ##

Perform the intersection of two shapes.

``` shape1 shape2 GEO_INTERSECTION shape ```

## GEO_SUBTRACTION ##

Perform the subtraction of two shapes.

``` shape1 shape2 GEO_SUBTRACTION shape ```

## GEO_UNION ##

Perform the union of two shapes.

``` shape1 shape2 GEO_UNION shape ```

## GEO_WKT ##

Pushes on the stack a shape corresponding to the given WKT.

``` 'wkt' GEO_WKT shape ```

## GET ##

Extract a value from a map or list given a key or index.

``` { map } key GET value ```

## GROOVY ##

Executes a script expressed in Groovy.

``` 'groovy_script' [ input_symbols ] [ output_symbols ] GROOVY ... ```

## GRUBBSTEST ##

Detect a single anomalous tick in GTS instances by doing a Grubbs test (use modified Zscore if useMedian == true, default statistical significance is 0.05).

``` [ gts ] useMedian (significance) GRUBBSTEST [ [ anomalous_tick ] ] ```

## GZIP ##

Compresses a byte array or String with Gzip algorithm.

``` 'uncompressed' GZIP 'compressed' ``` 

## HASH ##

Compute a 64 bit fingerprint of the string representation of the top of the stack.

``` obj HASH long ```

## HAVERSINE ##

Compute distance between locations (in degrees) using the Haversine formula.

``` lat1 lon1 lat2 lon2 HAVERSINE dist ```

## HEADER ##

Set a header which will be returned with the HTTP response.

``` 'header_name' 'header_value' HEADER  ```

## HEX-> ##

Decode a string encoded in hexadecimal.

``` 'encoded' HEX-> 'decoded' ```

## HUMANDURATION ##

Convert a number of time units into a human readable duration.

``` time_units HUMANDURATION 'duration' ```

## HYBRIDTEST ##

Detect anomalous ticks in bucketized GTS instances by doing a Seasonal Hybrid ESD test, given the period length (in number of buckets), the piece length (in number of periods), and an upperbound to the number of anomalies (default statistical significance is 0.05).

``` [ gts ] period_length piece_length upperbound (significance) ({ STL_optional_parameters }) HYBRIDTEST [ [ anomalous_ticks ] ] ```

## HYBRIDTEST2 ##

This is a variant of HYBRIDTEST (different seasonal extraction).

``` [ gts ] period_length piece_length upperbound (significance) HYBRIDTEST2 [ [ anomalous_ticks ] ] ```

## HYPOT ##

Returns sqrt(x²+y²) without intermediate overflow or underflow.

``` x y HYPOT Math.hypot(x,y) ```

## IDENT ##

Pushes onto the stack the 'ident' string of this platform instance.

``` - IDENT 'ident' ```

## IDWT ##

Invese Discrete Wavelet Transform.

``` [ gts ] 'wavelet' IDWT [ gts ] ```

## IEEEREMAINDER ##

Computes the remainder operation on two arguments as prescribed by the IEEE 754 standard.

``` x y IEEEREMAINDER Math.IEEEremainder(x,y) ```

## IFFT ##

Inverse Fast Fourier Transform.

``` re_gts im_gts IFFT gts ```

## IFT ##

Executes an if .. then conditional.

``` if_macro then_macro IFT ... ```

## IFTE ##

Executes an if ... then ... else conditional.

``` if_macro then_macro else_macro IFTE ```

## INTEGRATE ##

Integrate the numerical GTS.

``` gts initial_value INTEGRATE gts ```

## INTERPOLATE ##

Fills gaps in a bucketized GTS by interpolating between known values.

``` bucketized_gts INTERPOLATE gts ```

## INTERSECTION ##

Computes the intersection of two sets.

``` set1 set2 INTERSECTION set ```

## ISNULL ##

Checks whether the top of the stack is null.

``` elt ISNULL bool ```

## ISNaN ##

Checks whether a double is NaN.

``` x ISNaN bool ```

## ISO8601 ##

Converts a timestamp or timestamp + timezon into an ISO8601 representation.

``` timestamp ISO8601 'datetime' ```

## ISODURATION ##

Transform a number of time_units into an ISO8601 duration string.

``` time_units ISODURATION 'duration' ```

## ISONORMALIZE ##

Normalize numeric GTS instances (replace X by (X-mean)/(max -min) or by 1 if max == min).

``` [ gts ] ISONORMALIZE [ gts ] ```

## JOIN ##

Join N strings with the given separator.

``` 'str1' ... 'strn' 'sep' n JOIN 'str' ```

## JS ##

Executes a script expressed in JavaScript.

``` 'js_script' [ input_symbols ] [ output_symbols ] JS ... ```

## JSON-> ##

Parses a string as JSON and pushes the result onto the stack.

``` 'jsoon' JSON-> json ```

## JSONLOOSE ##

Forces loose mode for JSON output (will output NaN).

``` - JSONLOOSE - ```

## JSONSTRICT ##

Forces strict mode for JSON output (no NaN).

``` - JSONSTRICT - ```

## KEYLIST ##

Extract keys from a map.

``` { map } KEYLIST [ keys ] ```

## LABELS ##

Extract labels from a GTS.

``` gts LABELS { labels } ```

## LASTBUCKET ##

Extract the lastbucket from a bucketized GTS.

``` bucketized_gts LASTBUCKET lastbucket ```

## LASTSORT ##

Sort a list of GTS according to their most recent values.

``` [ gts ] LASTSORT [ gts ] ```

## LASTTICK ##

Extracts the last tick of a GTS.

``` gts LASTTICK lasttick```

## LBOUNDS ##

Pushes onto the stack a list of M-1 bounds defining M intervals between a and b plus the intervals before a and after b.

``` a b M LBOUNDS [ bounds ] ```

## LFLATMAP ##

Apply a macro on each element of a list, producing a list with each original element replaced by the flattened result of the macro execution.

``` [ list ] macro LFLATMAP [ list ] ```

## LIMIT ##

Modifies the maximum number of datapoints fetchable on this stack.

``` x LIMIT - ```

## LIST-> ##

Pushes onto the stack the elements of a list.

``` [ obj1 ... objn ] LIST-> obj1 ... objn n ```

## LMAP ##

Apply a macro on each element of a list, producing a list with the top element after each macro invocation.

``` [ list ] macro LMAP [ list ] ```

## LOAD ##

Pushes the value of a symbol onto the stack.

``` 'symbol' LOAD value ```

## LOCATIONOFFSET ##

Only retain readings farther than dist from the previous one.

``` [ gts ] dist LOCATIONOFFSET [ gts ] ```

## LOCATIONS ##

Extract latitudes/longitudes from a GTS.

``` gts LOCATIONS [ latitudes ] [ longitudes ] ```

## LOCSTRINGS ##

Extract location from a GTS and push it as a list of compact strings.

``` gts LOCSTRINGS [ locations ] ```

## LOG ##

Computes the natural logarithm of the top of the stack.

``` x LOG Math.log(x) ```

## LOG10 ##

Computes the base 10 logarithm of the top of the stack.

``` x LOG10 Math.log10(x) ```

## LOG1P ##

Computes the natural logarithm of the top of the stack plus one.

``` x LOG1P Math.log1p(x) ```

## LOWESS ##

Apply local regression to GTS instances, given the number of neighbours to use for each regression.

``` [ gts ] bandwidth LOWESS [ gts ] ```

## LSORT ##

Sorts in place the list on top of the stack.

``` [ list ] LSORT [ list ] ```

## LUA ##

Executes a script expressed in Lua.

``` 'lua_script' [ input_symbols ] [ output_symbols ] LUA ... ```

## MACROBUCKETIZER ##

Creates a bucketizer from a macro.

``` macro MACROBUCKETIZER bucketizer ```

## MACROFILTER ##

Creates a filter from a macro.

``` macro MACROFILTER filter ```

## MACROMAPPER ##

Creates a mapper from a macro.

``` macro MACROMAPPER mapper ```

## MACROREDUCER ##

Creates a reducer from a macro.

``` macro MACROREDUCER reducer ```

## MAKEGTS ##

Builds a GTS from arrays.

``` [ ticks ] [ latitudes ] [ longitudes ] [ elevations ] [ values ] MAKEGTS gts ```

## MAP ##

Applies a mapper onto a list of GTS.

``` [ [ gts ] mapper pre post occurrences ] MAP [ mapped_gts ] ```

## MAP-> ##

Explodes a map.

``` { key1 value1 ... keyn valuen } MAP-> key1 value1 ... keyn valuen 2*n ```

## MAPID ##

Generates a fingerprint of a map.

``` { map } MAPID map_id ```

## MARK ##

Pushes a *mark* onto the stack.

``` - MARK mark ```

## MATCH ##

Performs a regular expression matching on a string.

``` 'string' 'regexp' MATCH [ groups ] ```

## MAX ##

Returns the max of two numbers.

``` x y MAX Math.max(x,y) ```

## MAXBUCKETS ##

Modifies the maximum number of buckets a bucketized GTS can contain.

``` n MAXBUCKETS - ```

## MAXDEPTH ##

Modifies the maximum depth of the stack.

``` n MAXDEPTH - ```

## MAXGTS ##

Modifies the maximum number of GTS that the stack can retrieve.

``` n MAXGTS - ```

## MAXLONG ##

Pushes onto the stack the maximum value of a LONG.

``` - MAXLONG 2^63-1 ```

## MAXOPS ##

Modifies the maximum number of operations for the stack.

``` n MAXOPS - ```

## MAXSYMBOLS ##

Modifies the maximum number of symbols for the stack.

``` n MAXSYMBOLS - ```

## MD5 ##

Message Digest of a byte array with the cryptographic hash function MD5.

``` 'byte array' MD5 'md5 hash' ```

## MERGE ##

Merge multiple GTS.

``` [ gts ]MERGE merged_gts ```

## META ##

Modify the attributes of a GTS.

``` [ gts ] 'write_token' META - ```

## METASORT ##

Sort a list of GTS according to their metadata (class,labels).

``` [ gts ] [ labels ]  METASORT [ gts ] ```

## MIN ##

Returns the min of two numbers.

``` x y MIN Math.min(x,y) ```

## MINLONG ##

Push on the stack the minimum value of a long.

``` - MINLONG -2^63 ```

## MONOTONIC ##

Make a GTS monotonic.

``` gts MONOTONIC monotonic_gts ```

## MSGFAIL ##

Abort the current script with a message.

``` 'msg' MSGFAIL - ```

## MSORT ##

Sorts a map according to its keys.

``` { map } MSORT { sorted_map } ```

## MSTU ##

Pushes onto the stack the number of time units in a millisecond.

``` - MSTU times_units_per_ms ```

## MUSIGMA ##

Computes mu and sigma for a numerical GTS with or without Bessel's correction.

``` gts bool MUSIGMA mu sigma ```

## NAME ##

Retrieves the name of a GTS.

``` gts NAME 'name' ```

## NBOUNDS ##

Pushes a list of n-1 bounds defining n intervals with equal area under the bell cureve N(mu,sigma).

``` mu sigma n NBOUNDS [ bounds ] ```

## NDEBUGON ##

Enables the output of n levels of the stack upon script failure.

``` n NDEBUGON - ```

## NEWGTS ##

Creates an empty GTS.

``` - NEWGTS gts ```

## NEXTAFTER ##

Returns the floating-point number adjacent to the first argument in the direction of the second argument.

``` start direction NEXTAFTER Math.nextafter(start,direction) ```

## NEXTUP ##

Returns the floating-point value adjacent to d in the direction of positive infinity.

``` d NEXTUP Math.nextup(d) ```

## NONEMPTY ##

Only retains GTS with at least a value in a list of gts.

``` [ gts ] NONEMPTY [ non_empty_gts ] ```

## NOOP ##

Does nothing.

``` - NOOP - ```

## NORMALIZE ##

Normalize numeric GTS instances (replace X by (X-min)/(max -min) or by 1 if max == min).

``` [ gts ] NORMALIZE [ gts ] ```

## NOT ##

Negates the boolean on the stack.

``` bool NOT bool ```

## NOTAFTER ##

Checks that the current time is not after the provided timestamp. Fails otherwise.

``` timestamp NOTAFTER - ```

## NOTBEFORE ##

Checks that the current time is not before the provided timestamp. Fails otherwise.

``` timestamp NOTBEFORE - ```

## NOTIMINGS ##

Disables the collection of per line timing info.

``` - NOTIMINGS - ```

## NOW ##

Pushes onto the stack the current time in time units since the Unix epoch.

``` - NOW current_tim ```

## NPDF ##

Pushes a Probability Density Function for N(mu,sigma) onto the stack. The function can be evaluated using EVAL ``` mu sigma NPDF pdf ```

## NRETURN ##

Exit up to n levels of macros.

``` n NRETURN - ```

## NSUMSUMSQ ##

Computes the number of values of a GTS, the sum of those values and the sum of their squares.

``` gts NSUMSUMSQ n sum sumsq ```

## NULL ##

Pushes null onto the stack.

``` - NULL null ```

## NaN ##

Pushes NaN onto the stack.

``` - NaN NaN ```

## ONLYBUCKETS ##

Removes ticks which do not fall on bucket boundaries.

``` [ gts ] ONLYBUCKETS [ gts ] ```

## OPB64-> ##

Decodes the order preserving base64 content.

``` 'encoded' OPBB64-> 'decoded' ```

## OPB64TOHEX ##

Decodes an order preserving base64 encoded string and immediately re-encode it in hex.

``` 'encoded' OPBB64TOHEX 'hex' ```

## OPS ##

Pushes onto the stack the current number of operations performed.

``` - OPS ops ```

## OR ##

Do a boolean OR between booleans on the stack.

``` bool bool OR bool ```

## PAPPLY ##

Behaves like APPLY except returned GTS are grouped by equivalence classes.

``` [ [ gts ] ... [ gts ] [ labels ] function ] PAPPLY { { labels } [ gts ] ... { labels } [ gts ] } ```

## PARSESELECTOR ##

Parses a GTS selector and pushes onto the stack a class selector and a map of labels selectors.

``` 'selector' PARSESELECTOR 'class_selector' { labels_selectors } ```

## PARTITION ##

Splits GTS in equivalence classes based on label values.

``` [ gts ] [ labels ] PARTITION { { labels } [ gts ] ... { labels } [ gts ] } ```

## PATTERNDETECTION ##

Detects patterns in GTS.

``` [ gts ] [ patterns ] windowlen wordlen alphabetsize PATTERNDETECTION [ gts ] ```

## PATTERNS ##

Extracts bSAX symbols from GTS.

``` [ gts ] windowlen wordlen alphabetsize PATTERNS [ gts ] ```

## PFILTER ##

Behaves like FILTER except returned GTS are grouped by equivalence classes.

``` [ [ gts ] [ labels ] filter ] PFILTER { { labels } [ gts ] ... { labels } [ gts ] } ```

## PI ##

Pushes PI onto the stack.

``` - PI 3.1415... ```

## PICK ##

Pick objet at level n and push it onto the stack.

``` n PICK obj ```

## PROBABILITY ##

Pushes onto the stack a PDF function built from a value histogram.

``` { histogram } PROBABILITY pdf ```

## PUT ##

Add an element to a map.

``` {} value 'key' PUT { key value } ```

## PYTHON ##

Executes a script expressed in Python.

``` 'python_script' [ input_symbols ] [ output_symbols ] PYTHON ... ```

## Q-> ##

Converts a quaternion to its components.

``` q Q-> w x y z```

## QCONJUGATE ##

Compute the conjugate of a quaternion.

``` q QCONJUGATE q ```

## QDIVIDE ##

Divide a quaternion q by a quaternion r.

``` q r QDIVIDE q ```

## QMULTIPLY ##

Multiply two quaternions.

``` q r QMULTIPLY q ```

## QROTATE ##

Rotate a vector by a quaternion.

``` x y z q QROTATE x y z ```

## QROTATION ##

Extract the axis and angle of rotation of a quaternion.

``` q QROTATION x y z a ```

## QUANTIZE ##

Generate a quantified version of a GTS.

``` [ gts ] [ bounds ] [ values ] QUANTIZE [ gts ] ```

## R ##

Execute a script in R syntax.

``` 'R_script' R - ```

## R-> ##

Convert R types back to WarpScript types.

``` obj R-> obj ```

## RAND ##

Pushes a random number onto the stack.

``` - RAND rand ```

## RANGE ##

Pushes onto the stack a list of integers in the given range.

``` [ start end step ] RANGE [ int ] ```

## RANGECOMPACT ##

Compact a GTS so ranges of identical readings are replaced by their bounds.

``` gts RANGECOMPACT modified_gts ```

## REDUCE ##

Apply a reducer on a GTS.

``` [ [ gts ] [ labels ] reducer ] REDUCE [ gts ] ```

## RELABEL ##

Modify labels of a GTS.

``` gts { labels } RELABEL gts ```

## REMOVE ##

Remove an entry from a map or list given a key/index.

``` [ list ] index REMOVE - ```

## RENAME ##

Rename a GTS.

``` gts 'name' RENAME gts ```

## REPLACE ##

Replaces the first substring of the input string that matches a regular expression with a replacement.

``` 'input' 'regexp' 'replacement' REPLACE 'replaced input' ```

## REPLACEALL ##

Replaces all substrings of the input string that matches a regular expression with a replacement.

``` 'input' 'regexp' 'replacement' REPLACEALL 'replaced input' ```

## RESET ##

Reset the stack to a specific depth.

``` ... depth RESET ... ```

## RESETS ##

Compensate the resets in a gts.

``` gts assume_decreasing RESETS compensated_gts ```

## RETURN ##

Immediately exit the currently running macro.

``` - RETURN - ```

## REV ##

Pushes the platform revision string onto the stack.

``` - REV 'Warp Revision' ```

## REVERSE ##

Reverse the elements of a list in place.

``` [ elt1 ... eltn ] REVERSE [ eltn ... elt1 ] ```

## RINT ##

Returns the double value that is closest in value to the argument and is equal to a mathematical integer.

``` x RINT Math.rint(x) ```

## RLOWESS ##

Apply LOWESS smoothing that is robust to anomalies.

``` [ gts ] bandwidth robustness accuracy degree_of_fit RLOWESS [ gts ] ```

## ROLL ##

Cycle up n elements of the stack.

``` obj1 ... objn n ROLL obj2 ... objn obj1 ```

## ROLLD ##

Cycle down n elements of the stacj.

``` obj1 ... objn n ROLLD objn obj1 ... objn-1 ```

## ROT ##

Cycle the top 3 elements of the stack.

``` a b c ROT b c a ```

## ROTATIONQ ##

Creates a quaternion from a rotation axis and angle.

``` x y z a ROTATIONQ q ```

## ROUND ##

Returns the closest long to the argument, with ties rounding up.

``` x ROUND Math.round(x) ```

## RSADECRYPT ##

Decrypt data using RSA keys

``` encrypted_bytearray rsa_key RSADECRYPT decrypted_bytearray ```

## RSAENCRYPT ##

Encrypt data using RSA keys

``` bytearray rsa_key RSAENCRYPT encrypted_bytearray ```

## RSAGEN ##

Generates a RSA key pair.

``` exponent key_length RSAGEN [ keys] ```

## RSAPRIVATE ##

Produce a RSA private key from a parameter map.

``` { key parameters} RSAPRIVATE private_key ```

## RSAPUBLIC ##

Produce a RSA public key from a parameter map.

``` { key parameters} RSAPUBLIC public_key ```

## RSASIGN ##

Sign data with a private key using RSA cryptosystem.

```  data algorithm private_key RSASIGN rsa_signature ```

## RSAVERIFY ##

Verify an RSA signature

``` data rsa_signature algorithm public_key RSAVERIFY boolean ```

## RSORT ##

Sort a GTS by descending ticks.

``` gts RSORT gts ```

## RUBY ##

Executes a script expressed in Ruby.

``` 'ruby_script' [ input_symbols ] [ output_symbols ] RUBY ... ```

## RUN ##

Run a macro.

``` 'macro_name' RUN ```

## RVALUESORT ##

Sort GTS in reverse order of values.

``` [ gts ] RVALUESORT [ gts ] ```

## SECUREKEY ##

Set the secure key for creating secure scripts.

``` 'key' SECUREKEY - ```

## SET ##

Pushes a value into a list.

``` [ list ] value key SET [ list ] ```

## SET-> ##

Transforms a set back into a list.

``` ( set ) SET-> [ list ] ```

## SETATTRIBUTES ##

Set attributes of a GTS.

``` [ gts ] { attributes }  SETATTRIBUTES [ gts ] ```

## SHA1 ##

Message Digest of a byte array with the cryptographic hash function SHA-1.

``` 'byte array' SHA1 'sha1 hash' ```

## SHA1HMAC ##

HMAC of a byte array with the cryptographic hash function SHA-1.

``` 'message' 'secret key' SHA1HMAC 'hashmac' ```

## SHA256 ##

Message Digest of a byte array with the cryptographic hash function SHA-256.

``` 'byte array' SHA256 'sha256 hash' ```

## SHA256HMAC ##

HMAC of a byte array with the cryptographic hash function SHA-256.

``` 'message' 'secret key' SHA256HMAC 'hashmac' ```


## SHRINK ##

Shrink a GTS to its first or last n values.

``` gts n SHRINK gts ```

## SIGNUM ##

Returns the signum function of the argument; zero if the argument is zero, 1.0 if the argument is greater than zero, -1.0 if the argument is less than zero.

``` x SIGNUM Math.signum(x) ```

## SIN ##

Compute the sine of the top of the stack.

``` x SIN Math.sin(x) ```

## SINGLEEXPONENTIALSMOOTHING ##

Apply single exponential smoothing to GTS.

``` [ gts ] alpha SINGLEEXPONENTIALSMOOTHING [ gts ] ```

## SINH ##

Compute the hyperbolic sine of the top of the stack.

``` x SINH Math.sinh(x) ```

## SIZE ##

Pushes on the stack the size of an object (map, list).

``` obj SIZE long ```

## SORT ##

Sort a GTS by increasing ticks.

``` gts SORT gts ```

## SPLIT ##

Splits a string into segments with the given segment separator.

``` 'string' 'sep' SPLIT [ 'segments' ] ```

## SQRT ##

Compute the square root of a number.

``` x SQRT Math.sqrt(x) ```

## STACKATTRIBUTE ##

Pushes onto the stack the value of the named attribute.

``` 'name' STACKATTRIBUTE value ```

## STACKTOLIST ##

Convert the whole stack into a list and push this list on the top of the stack.

``` STACKTOLIST [ ] ```

## STANDARDIZE ##

Standardize numeric GTS instances (replace X by (X-mu)/sd).

``` [ gts ] STANDARDIZE [ gts ] ```

## STL ##

Compute Seasonal-Trend decomposition to bucketized GTS instances, given a period length (in number of buckets).

``` [ gts ] period_length ({ optional_parameters }) STL [ [ seasonal_gts trend_gts ] ] ```

## STLESDTEST ##

Detect anomalous ticks in bucketized GTS instances by doing an ESD test on the residual of the STL decomposition, given the period length (in number of buckets) and an upperbound to the number of anomalies (default statistical significance is 0.05).

``` [ gts ] period_length upperbound (significance) ({ STL_optional_parameters }) STLESDTEST [ [ anomalous_ticks ] ] ```

## STOP ##

Immediately stop executing the current script.

``` - STOP ```

## STORE ##

Store an object in a symbol.

``` obj 'symbol' STORE - ```

## STRICTMAPPER ##

Converts a mapper into a strict version which expects a number of values in each window which lies in [ min, max ].

``` mapper min max STRICTMAPPER mapper ```

## STRICTPARTITION ##

Splits GTS in equivalence classes based on label values. Labels of each partitions are only those specified.``` [ gts ] [ labels ] STRICTPARTITION { { labels } [ gts ] ... { labels } [ gts ] } ```

## STU ##

Pushes the number of time units in a second onto the stack.

``` - STU long ```

## SUBLIST ##

Extracts a sublist from a list.

``` [ list ] [ indices ] SUBLIST [ sublist ] ```

## SUBMAP ##

Extracts a submap from a map.

``` { map } [ keys ] SUBMAP { submap } ```

## SUBSTRING ##

Extract a substring from a string.

``` string len start SUBSTRING substring ```

## SWAP ##

Exchanges the elements on the two first levels of the stack.

``` a b SWAP b a ```

## SWITCH ##

Perform a switch/case conditional.

``` macro_case1 ... macro_casen macro_defaultcase n SWITCH ...```

## TAN ##

Compute the tangent of the top of the stack.

``` x TAN Math.tan(x) ```

## TANH ##

Compute the hyperbolic tangent of the top of the stack.

``` x TANH Math.tanh(x) ```

## TEMPLATE ##

Expands a (mustache) template using values provided in a map.

``` template map TEMPLATE string ```

## THRESHOLDTEST ##

Returns ticks of GTS instances that are above a specified threshold.

``` [ gts ] threshold THRESHOLDTEST [ [ anomalous_ticks ] ] ```

## TICKINDEX ##

Replaces the ticks of a GTS by their index.

``` [ gts ] TICKINDEX [ gts ] ```

## TICKLIST ##

Extracts the list of ticks with values and pushes them on the stack.

``` [ gts ] TICKLIST [ [ ticks ] ] ```

## TIMECLIP ##

Only retain ticks in the given interval.

``` [ gts ] now duration TIMECLIP [ gts ] ```

## TIMEMODULO ##

Split a gts into n GTS whose ticks are the original ticks modulo mod, a 'label' holds tick / mod.

``` [ gts ] mod 'label'  TIMEMODULO ```

## TIMESCALE ##

Modify ticks by multiplying them by scale.

``` [ gts ] scale TIMESCALE [ gts ] ```

## TIMESHIFT ##

Shifts all ticks by the specified offset.

``` [ gts ] offset TIMESHIFT [ gts ] ```

## TIMESPLIT ##

Split a GTS in sub GTS separated by quiet periods.

``` gts quietperiod minvalues 'label' TIMESPLIT [ gts ] ```

## TIMINGS ##

Enables the collection of per line timing info.

``` - TIMINGS - ```

## TOBITS ##

Converts a double to a long value of the raw bits of its representation.

``` double TOBITS long ```

## TODEGREES ##

Converts radiants to degrees.

``` x TODEGREES Math.toDegrees(x) ```

## TODOUBLE ##

Converts the numerical element on top of the stack into a double.

``` x TODOUBLE double(x) ```

## TOHEX ##

Converts a long to its hexadecimal representation.

``` long TOHEX 'hex' ```

## TOKENINFO ##

Extracts information on the token on top of the stack.

``` 'token' TOKENINFO { infos } ```

## TOBOOLEAN ##

Converts number or string to boolean.

``` x TOBOOLEAN boolean(x) ```

## TOLONG ##

Converts the numerical element on top of the stack to a long.

``` x TOLONG long(x) ```

## TOLOWER ##

Converts a string to lower case.

``` 'STRING' TOLOWER 'string' ```

## TORADIANS ##

Converts degrees into radians.

``` deg TORADIANS Math.toRadians(deg) ```

## TOSELECTOR ##

Converts a GTS to a selector which would retrieve it.

``` gts TOSELECTOR 'selector' ```

## TOSTRING ##

Converts the element on top of the stack into a string.

``` elt TOSTRING 'elt' ```

## TOTIMESTAMP ##

Converts an ISO8601 date/time string into a number of time units.

``` 'YYYY-MM-DDTHH:MM:SS.SSSSZ' TOTIMESTAMP time_units ```

## TOUPPER ##

Converts a string in puppercase.

``` 'string' TOUPPER 'STRING' ```

## TRIM ##

Trim whitespaces at both ends of a string.

``` string TRIM string ```

## ->TSELEMENTS ##

Pushes on the stack the various elements of a timestamp for a given timezone.

``` timestamp 'tz' TSELEMENTS [ year monthofyear dayofmonth hourofday minuteofhour secondofminute subseconds dayofyear dayofweek weekofweekyear ] ```

## TSELEMENTS ##

Pushes on the stack the various elements of a timestamp for a given timezone.

``` timestamp 'tz' TSELEMENTS [ year monthofyear dayofmonth hourofday minuteofhour secondofminute subseconds dayofyear dayofweek weekofweekyear ] ```

## TSELEMENTS-> ##

Pushes on the stack the timestamp of various elements for a given timezone.

``` [ year monthofyear dayofmonth hourofday minuteofhour secondofminute subseconds dayofyear dayofweek weekofweekyear ] 'tz' TSELEMENTS-> timestamp  ```

## TYPEOF ##

Pushed onto the stack the type of the element on top of the stack.

``` elt TYPEOF 'type_of_elt' ```

## UDF ##

Invoke a UDF.

``` 'class' UDF ```

## ULP ##

Returns the size of an Units in the Last Place of the top of the stack.

``` x ULP Math.ulp(x) ```

## UNBUCKETIZE ##

Make a GTS unbucketized.

``` bucketized_gts UNBUCKETIZE gts ```

## UNGZIP ##

Decompresses a byte array with Gzip algorithm.

``` 'compressed' UNGZIP 'uncompressed' ``` 

## UNION ##

Performs the union of two sets.

``` set1 set2 UNION set ```

## UNIQUE ##

Removes duplicate elements from a list.

``` [ obj1 obj UNIQUE ```

## UNSECURE ##

Retrieve the original script from a secure script.

``` 'secure_script' 'key' UNSECURE 'original_script' ```

## UNTIL ##

Executes a macro until a condition becomes true.

``` macro cond_macro UNTIL ... ```

## UNWRAP ##

Unwrap a string or list thereof created with WRAP into a GTS or a list thereof.

``` string UNWRAP gts ```

## UPDATE ##

Stores GTS into the platform.

``` [ gts ] 'token' UPDATE - ```

## URLDECODE ##

Decode a URLEncoded string.

``` 'encoded' URLDECODE 'string' ```

## URLENCODE ##

URLEncode a string.

``` 'string' URLENCODE 'encoded' ```

## UUID ##

Pushes a UUID onto the stack.

``` - UUID 'uuid' ```

## VALUEDEDUP ##

Removes duplicates in values.

``` [ gts ] bool_keepfirst VALUEDEDUP [ gts ] ```

## VALUEHISTOGRAM ##

Builds a value histogram for a GTS.

``` gts VALUEHISTOGRAM { value count ... value count } ```

## VALUELIST ##

Extract valus from a map.

``` { map } VALUELIST [ values ] ```

## VALUES ##

Extracts the values of a GTS.

``` gts VALUES [ values ] ```

## VALUESORT ##

Sorts a GTS according to its values.

``` gts VALUESORT sorted_gts ```

## VALUESPLIT ##

Split a GTS into multiple boolean GTS, one per value.

``` [ gts ] label VALUESPLIT [ [ gts ] ... ] ```

## WEBCALL ##

Makes an outbound HTTP call.

``` 'token' 'method' 'url' { headers } 'body' WEBCALL 'request_uuid' ```

## WHILE ##

Perform a while loop.

``` while_macro run_macro WHILE ... ```

## WRAP ##

Wrap a GTS or a list thereof in a compacted encoded form.

``` gts WRAP string ```

## ZIP ##

Returns a list of lists where the i-th lists contain the i-th elements of each input lists.

``` [ [a b c] [d e f] [g] [h i j] ] ZIP [ [a d g h] [b e g i] [c f g j] ] ```

## ZSCORE ##

Normalize numeric GTS instances by their means or by their medians (replace X by (X-mean)/std or by (X-median)/mad if useMedian == true).

``` [ gts ] useMedian ZSCORE [ gts ] ```

## ZSCORETEST ##

Detect anomalous ticks in GTS instances by doing a Zscore test (use modified Zscore if useMedian == true, default treshold is 3.5).

``` [ gts ] useMedian (threshold) ZSCORETEST [ [ anomalous_ticks ] ] ```

## [ ##

Starts a list.

``` - [ mark ```

## [] ##

Pushes an empty list onto the stack.

``` - [] [] ```

## ] ##

Builds a list from elements on the stack.

``` mark elt1 ... eltn ] [ elt1 ... eltn ] ```

## ^ ##

Bitwise XOR.

``` l1 l2 ^ long ```

## bucketizer.count ##

Push onto the stack a bucketizer which computes the number of values found in the interval to bucketize.

``` - bucketizer.count bucketizer ```

## bucketizer.count.exclude-nulls ##

Pushes onto the stack a bucketizer which outputs the number of non null values in a set.

``` - bucketizer.count.exclude-nulls bucketizer ```

## bucketizer.count.include-nulls ##

Pushes onto the stack a bucketizer which outputs the number of values (even null ones) in a set.

``` - bucketizer.count.include-nulls bucketizer ```

## bucketizer.count.nonnull ##

Push onto the stack a bucketizer which computes the number of non-null values found in the interval to bucketize.

``` - bucketizer.count.nonnull bucketizer ```

## bucketizer.first ##

Push onto the stack a bucketizer which returns the first value in the interval to bucketize.

``` - bucketizer.first bucketizer ```

## bucketizer.join ##

Pushes onto the stack a bucketizer which will concatenate the string representation of the values in the bucket with the given separator.

``` 'sep' bucketizer.join bucketizer ```

## bucketizer.join.forbid-nulls ##

Pushes onto the stack a bucketizer which outputs the concatenation of the string representations of the values in the bucket with the given separator or null if one of the values is null.

``` sep bucketizer.join.forbid-nulls bucketizer ```

## bucketizer.last ##

Push onto the stack a bucketizer which returns the last value in the interval to bucketize.

``` - bucketizer.last bucketizer ```

## bucketizer.max ##

Push onto the stack a bucketizer which returns the maximum value in the interval to bucketize.

``` - bucketizer.max bucketizer ```

## bucketizer.max.forbid-nulls ##

Pushes onto the stack a bucketizer which outputs the max of a set of values or null if one of the values is null.

``` - bucketizer.max.forbid-nulls bucketizer ```

## bucketizer.mean ##

Push onto the stack a bucketizer which returns the mean value in the interval to bucketize.

``` - bucketizer.mean bucketizer ```

## bucketizer.mean.exclude-nulls ##

Pushes onto the stack a bucketizer which outputs the mean of a set of values, excluding nulls from the computation.

``` - bucketizer.mean.exclude-nulls bucketizer ```

## bucketizer.median ##

Push onto the stack a bucketizer which returns the median value in the interval to bucketize.

``` - bucketizer.median bucketizer ```

## bucketizer.min ##

Push onto the stack a bucketizer which returns the minimum value in the interval to bucketize.

``` - bucketizer.min bucketizer ```

## bucketizer.min.forbid-nulls ##

Pushes onto the stack a bucketizer which outputs the min of a set of values or null if one of the values is null.

``` - bucketizer.min.forbid-nulls bucketizer ```

## bucketizer.percentile ##

Push onto the stack a bucketizer which returns the xth percentile of values in the interval to bucketize.

``` x bucketizer.percentile bucketizer ```

## bucketizer.sum ##

Push onto the stack a bucketizer which returns the sum of values in the interval to bucketize.

``` - bucketizer.sum bucketizer ```

## bucketizer.sum.forbid-nulls ##

Pushes onto the stack a bucketizer which outputs the sum of a set of values, excluding nulls from the computation.

``` - bucketizer.sum.forbid-nulls bucketizer ```

## e ##

Pushes the Euler number onto the stack.

```- e 2.71828...```

## filter.byclass ##

Pushes onto the stack a filter which selects GTS whose class name matches the filter parameter.

``` 'class_selector' filter.byclass filter ```

## filter.bylabels ##

Pushes onto the stack a filter which selects GTS whose labels match the filter parameter.

``` { labels_selectors } filter.bylabels filter ```

## filter.last.eq ##

Pushes onto the stack a filter which selects GTS whose last value is equal to the filter parameter.

``` x filter.last.eq filter ```

## filter.last.ge ##

Pushes onto the stack a filter which selects GTS whose last value is greater or equal to the filter parameter.

``` x filter.last.ge filter ```

## filter.last.gt ##

Pushes onto the stack a filter which selects GTS whose last value is greater than filter parameter.

``` x filter.last.gt filter ```

## filter.last.le ##

Pushes onto the stack a filter which selects GTS whose last value is lower or equal to the filter parameter.

``` x filter.last.le filter ```

## filter.last.lt ##

Pushes onto the stack a filter which selects GTS whose last value is lower than filter parameter.

``` x filter.last.lt filter ```

## filter.last.ne ##

Pushes onto the stack a filter which selects GTS whose last value is not equal to the filter parameter.

``` x filter.last.ne filter ```

## mapper.abs ##

Push onto the stack a mapper to compute the absolute value of readings.

``` - mapper.abs mapper ```

## mapper.add ##

Push onto the stack a mapper to add a constant to the single value in a sliding window.

``` x mapper.add ```

## mapper.ceil ##

Push onto the stack a mapper to round the single value in a sliding window to the closests greater LONG.

``` - mapper.ceil mapper ```

## mapper.count ##

Push onto the stack a mapper to count the number of elements in the window.

``` - mapper.count mapper ```

## mapper.count.exclude-nulls ##

Pushes onto the stack a mapper which outputs the number of non null values in a set.

``` - mapper.count.exclude-nulls mapper ```

## mapper.count.include-nulls ##

Pushes onto the stack a mapper which outputs the number of values (even null ones) in a set.

``` - mapper.count.include-nulls mapper ```

## mapper.count.nonnull ##

Push onto the stack a mapper to count the number of non-null elements in the window..

``` - mapper.count.nonnull mapper ```

## mapper.day ##

Push onto the stack a mapper to compute the day of the tick.

``` 'TimeZone' mapper.day mapper```

## mapper.delta ##

Push onto the stack a mapper to compute the delta between the extrema of the sliding window.

``` - mapper.delta mapper ```

## mapper.dotproduct ##

Push onto the stack a mapper to compute the dot product with an input vector parameter.

``` [ double ] mapper.dotproduct mapper ```

## mapper.dotproduct.positive ##

Push onto the stack a mapper to compute the positive value of the dot product.

``` [ double ] mapper.dotproduct.positive mapper ```

## mapper.dotproduct.sigmoid ##

Push onto the stack a mapper to compute the Sigmoid of the dot product.

``` [ double ] mapper.dotproduct.sigmoid mapper ```

## mapper.dotproduct.tanh ##

Push onto the stack a mapper to compute the tanh of the dot product.

``` [ double ] mapper.dotproduct.tanh mapper ```

## mapper.eq ##

Push onto the stack a mapper to return the first value in a sliding window which is equal to a given value.

``` x mapper.eq mapper ```

## mapper.exp ##

Push onto the stack a mapper to raise a constant to the power of the single value in the sliding window.

``` x mapper.exp mapper ```

## mapper.first ##

Push onto the stack a mapper to return the first reading of the sliding window.

``` - mapper.first mapper ```

## mapper.floor ##

Push onto the stack a mapper to compute the floor of the single value in the sliding window.

``` - mapper.floor mapper ```

## mapper.ge ##

Push onto the stack a mapper to return the first value greater or equal to a threshold.

``` x mapper.ge mapper ```

## mapper.geo.approximate ##

Push onto the stack a mapper to approximate a location at the given resolution.

``` int_x mapper.geo.approximate mapper ```

## mapper.geo.clear ##

Push onto the stack a mapper to remove the location info from readings.

``` - mapper.geo.clear mapper ```

## mapper.geo.outside ##

Push onto the stack a mapper to return value if the value has a location outside Geo Shape.

``` shape mapper.geo.outside mapper ```

## mapper.geo.within ##

Push onto the stack a mapper to return value if the value has a location within Geo Shape.

``` shape mapper.geo.within mapper ```

## mapper.gt ##

Push onto the stack a mapper to return the first value greater than threshold.

``` x mapper.gt mapper ```

## mapper.hdist ##

Push onto the stack a mapper to compute the horizontal distance between the extrema of the sliding window.

``` - mapper.hdist mapper ```

## mapper.highest ##

Push onto the stack a mapper which return the reading with the highest elevation in the sliding window.

``` - mapper.highest mapper ```

## mapper.hour ##

Push onto the stack a mapper to compute the hour of the tick.

``` 'TimeZone' mapper.hour mapper ```

## mapper.hspeed ##

Push onto the stack a mapper to compute the horizontal speed between the extrema of the sliding window.

``` - mapper.hspeed mapper ```

## mapper.join ##

Push onto the stack a mapper to return the concatenation of the string representation of values separated by a separator.

``` sep mapper.join mapper ```

## mapper.join.forbid-nulls ##

Pushes onto the stack a mapper which outputs the concatenation of the string representations of the values in a set with the given separator or null if one of the values is null.

``` sep mapper.join.forbid-nulls mapper ```

## mapper.kernel.cosine ##

Pushes onto the stack a mapper which applies a cosine kernel function on the sliding window.

``` - mapper.kernel.cosine mapper ```

## mapper.kernel.epanechnikov ##

Pushes onto the stack a mapper which applies an epanechnikov kernel function on the sliding window.

``` - mapper.kernel.epanechnikov mapper ```

## mapper.kernel.gaussian ##

Pushes onto the stack a mapper which applies a gaussian kernel function on the sliding window.

``` - mapper.kernel.gaussian mapper ```

## mapper.kernel.logistic ##

Pushes onto the stack a mapper which applies a logistic kernel function on the sliding window.

``` - mapper.kernel.logistic mapper ```

## mapper.kernel.quartic ##

Pushes onto the stack a mapper which applies a quartic kernel function on the sliding window.

``` - mapper.kernel.quartic mapper ```

## mapper.kernel.silverman ##

Pushes onto the stack a mapper which applies a silverman kernel function on the sliding window.

``` - mapper.kernel.silverman mapper ```

## mapper.kernel.triangular ##

Pushes onto the stack a mapper which applies a triangular kernel function on the sliding window.

``` - mapper.kernel.triangular mapper ```

## mapper.kernel.tricube ##

Pushes onto the stack a mapper which applies a tricube kernel function on the sliding window.

``` - mapper.kernel.tricube mapper ```

## mapper.kernel.triweight ##

Pushes onto the stack a mapper which applies a triweight kernel function on the sliding window.

``` - mapper.kernel.triweight mapper ```

## mapper.kernel.uniform ##

Pushes onto the stack a mapper which applies a uniform kernel function on the sliding window.

``` - mapper.kernel.uniform mapper ```

## mapper.last ##

Push onto the stack a mapper to return the last reading of the sliding window.

``` - mapper.last mapper ```

## mapper.le ##

Push onto the stack a mapper to return the first value lower or equal to a threshold.

``` x mapper.le mapper ```

## mapper.log ##

Push onto the stack a mapper to compute the Log of the single value in the base used as parameter.

``` x mapper.log mapper ```

## mapper.lowest ##

Push onto the stack a mapper to return the reading with the lowest elevation in the sliding window.

``` - mapper.lowest mapper ```

## mapper.lt ##

Push onto the stack a mapper to First value lower than threshold.

``` x mapper.lt mapper ```

## mapper.max ##

Push onto the stack a mapper to return the maximum value of the sliding window.

``` - mapper.max mapper ```

## mapper.max.forbid-nulls ##

Pushes onto the stack a mapper which outputs the max of a set of values or null if one of the values is null.

``` - mapper.max.forbid-nulls mapper ```

## mapper.max.x ##

Push onto the stack a mapper to return the max between a constant passed as parameter and each value.

``` x mapper.max.x mapper ```

## mapper.mean ##

Push onto the stack a mapper to compute the mean of values in the sliding window.

``` - mapper.mean mapper ```

## mapper.mean.exclude-nulls ##

Pushes onto the stack a mapper which outputs the mean of a set of values, excluding nulls from the computation.

``` - mapper.mean.exclude-nulls mapper ```

## mapper.median ##

Push onto the stack a mapper to compute the median of the values in the sliding window.

``` - mapper.median mapper ```

## mapper.min ##

Push onto the stack a mapper to return the minimum value of the sliding window.

``` - mapper.min mapper ```

## mapper.min.forbid-nulls ##

Pushes onto the stack a mapper which outputs the min of a set of values or null if one of the values is null.

``` - mapper.min.forbid-nulls mapper ```

## mapper.min.x ##

Push onto the stack a mapper to  return the min between a constant passed as parameter and each value.

``` x mapper.min.x mapper ```

## mapper.minute ##

Push onto the stack a mapper to compute minute of the tick.

``` 'TimeZone' mapper.minute mapper ```

## mapper.month ##

Push onto the stack a mapper to compute month of the tick.

``` 'TimeZone' mapper.month mapper ```

## mapper.mul ##

Push onto the stack a mapper to multiply the value by a parameter.

``` x mapper.mul mapper ```

## mapper.ne ##

Push onto the stack a mapper to  return the first value not equal to threshold.

``` x mapper.ne mapper ```

## mapper.npdf ##

Push onto the stack a mapper to compute the probability of a value within a gaussian distribution with mu/sigma.

``` mu sigma mapper.npdf mapper ```

## mapper.percentile ##

Push onto the stack a mapper to compute the Nth percentile of the values on the interval.

``` percentile mapper.percentile mapper ```

## mapper.pow ##

Push onto the stack a mapper to raise the value to a certain power.

```power mapper.pow mapper ```

## mapper.product ##

Push onto the stack a mapper which computes the product of values in the sliding window.

``` - mapper.product mapper ```

## mapper.rate ##

Push onto the stack a mapper which computes the rate of change per second on the sliding window.

``` - mapper.rate mapper ```

## mapper.replace ##

Push onto the stack a mapper to replace windows that contains at least one value with a constant.

``` x mapper.replace mapper ```

## mapper.round ##

Push onto the stack a mapper which rounds the single value in the sliding window.

``` - mapper.round mapper ```

## mapper.sd ##

Push onto the stack a mapper which computes the standard deviation (with or without Bessel's correction) of non null values in the sliding window.

``` bool mapper.sd mapper ```

## mapper.sd.forbid-nulls ##

Push onto the stack a mapper which computes the standard deviation (with or without Bessel's correction) of values in the sliding window. Null values lead to a null result.

``` bool mapper.sd.forbid-nulls mapper ```

## mapper.second ##

Push onto the stack a mapper to compute seconds of the tick.

``` 'TimeZone' mapper.second mapper ```

## mapper.sigmoid ##

Push onto the stack a mapper to return the sigmoid of the single value in the sliding window.

``` - mapper.sigmoid mapper ```

## mapper.sum ##

Push onto the stack a mapper which computes the sum of values in the sliding window.

``` - mapper.sum mapper ```

## mapper.sum.forbid-nulls ##

Pushes onto the stack a mapper which outputs the sum of a set of values, excluding nulls from the computation.

``` - mapper.sum.forbid-nulls mapper ```

## mapper.tanh ##

Push onto the stack a mapper which computes the tanh of the single value in the sliding window.

``` - mapper.tanh mapper ```

## mapper.tick ##

Push onto the stack a mapper to return the tick.

``` - mapper.tick mapper ```

## mapper.toboolean ##

Push onto the stack a mapper to return the boolean representation of the single value in the sliding window.

``` - mapper.toboolean mapper ```

## mapper.todouble ##

Push onto the stack a mapper to converts the single value in a sliding window to double.

``` - mapper.todouble mapper ```

## mapper.tolong ##

Push onto the stack a mapper to convert the single value in a sliding window to long.

``` - mapper.tolong mapper ```

## mapper.tostring ##

Push onto the stack a mapper to return the string representation of the single value in the sliding window.

``` - mapper.tostring mapper ```

## mapper.truecourse ##

Push onto the stack a mapper to compute the true course between points on a great circle.

``` - mapper.truecourse mapper ```

## mapper.var ##

Push onto the stack a mapper to compute the variance (with or without Bessel's correction) of all the non null values in each sliding window.

``` bool mapper.var mapper  ```

## mapper.var.forbid-nulls ##

Push onto the stack a mapper to compute the variance (with or without Bessel's correction) of all the values in each sliding window. Null values lead to a null result.

``` bool mapper.var.forbid-nulls mapper  ```

## mapper.vdist ##

Push onto the stack a mapper to compute the total distance traveled in the vertical plane in the sliding window..

``` - mapper.vdist mapper ```

## mapper.vspeed ##

Push onto the stack a mapper to compute the vertical speed between the first and last readings of the sliding window.

``` - mapper.vspeed mapper ```

## mapper.weekday ##

Push onto the stack a mapper to compute the day of the week of the tick.

``` 'TimeZone' mapper.weekday mapper ```

## mapper.year ##

Push onto the stack a mapper to compute the year of the tick.

``` 'TimeZone' mapper.year mapper ```

## max.tick.sliding.window ##

Max tick value in a sliding window.

``` - max.tick.sliding.window long ```

## max.time.sliding.window ##

Max time of a sliding window.

``` - max.time.sliding.window long ```

## op.add ##

Pushes onto the stack an operator to add values of multiple GTS.

``` - op.add operator ```

## op.and ##

Pushes onto the stack an operator to perform a logical and between values of multiple GTS.

``` - op.and operator ```

## op.div ##

Pushes onto the stack an operator to divide values of one GTS by those of another.

``` - op.div operator ```

## op.eq ##

Pushes onto the stack an operator to check if values of multiple GTS are equal.

``` - op.eq operator ```

## op.ge ##

Pushes onto the stack an operator to check if values of multiple GTS are in decreasing order.

``` - op.ge operator ```

## op.gt ##

Pushes onto the stack an operator to check if values of multiple GTS are in strict decreasing order.

``` - op.gt operator ```

## op.le ##

Pushes onto the stack an operator to check if values of multiple GTS are in increasing order.

``` - op.le operator ```

## op.lt ##

Pushes onto the stack an operator to check if values of multiple GTS are in strict increasing order.

``` - op.lt operator ```

## op.mask ##

Pushes onto the stack an operator to use one GTS as a mask for selecting values of another.

``` - op.mask operator ```

## op.mul ##

Pushes onto the stack an operator to multiply values of multiple GT.

``` - op.mul operator ```

## op.ne ##

Pushes onto the stack an operator to check if values of multiple GTS are different.

``` - op.ne operator ```

## op.or ##

Pushes onto the stack an operator to perform a logical or between values of multiple GTS.

``` - op.or operator ```

## op.sub ##

Pushes onto the stack an operator to subtract values of multiple GTS.

``` - op.sub operator ```

## pi ##

Pushes PI onto the stack.

``` - pi 3.1415... ```

## reducer.argmax ##

Push onto the stack a reducer which will output the concatenation of label values for which the value at tick is the maximum.

``` 'label' n_maxima_to_report reducer.argmax reducer ```

## reducer.argmin ##

Push onto the stack a reducer which will output the concatenation of label values for which the value at tick is the mininum.

``` 'label' n_minima_to_report reducer.argmin reducer ```

## reducer.count ##

Push onto the stack a reducer to return the number of values for each tick.

``` reducer.count ```

## reducer.count.exclude-nulls ##

Pushes onto the stack a reducer which outputs the number of non null values in a set.

``` - reducer.count.exclude-nulls reducer ```

## reducer.count.include-nulls ##

Pushes onto the stack a reducer which outputs the number of values (even null ones) in a set.

``` - reducer.count.include-nulls reducer ```

## reducer.count.nonnull ##

Push onto the stack a reducer to return the number of non-null values for each tick.

``` reducer.count.nonnull ```

## reducer.join ##

Push onto the stack a reducer to return the concatenation of values separated by the join string for each ticket, ignoring null values.

``` reducer.join ```

## reducer.join.forbid-nulls ##

Pushes onto the stack a reducer which outputs the concatenation of the string representations of the values in a set with the given separator or null if one of the values is null.

``` sep reducer.join.forbid-nulls reducer ```

## reducer.join.nonnull ##

 Push onto the stack a reducer to return the concatenation of values separated by the join string for each ticket.

``` reducer.join.nonnull ```

## reducer.max ##

Push onto the stack a reducer to return the maximum value for each tick, ignoring null values.

``` reducer.max ```

## reducer.max.forbid-nulls ##

Pushes onto the stack a reducer which outputs the max of a set of values or null if one of the values is null.

``` - reducer.max.forbid-nulls reducer ```

## reducer.max.nonnull ##

Push onto the stack a reducer to return the maximum value for each tick.

``` reducer.max.nonnull ```

## reducer.mean ##

Push onto the stack a reducer to compute the mean of values for each tick.

``` reducer.mean ```

## reducer.mean.exclude-nulls ##

Pushes onto the stack a reducer which outputs the mean of a set of values, excluding nulls from the computation.

``` - reducer.mean.exclude-nulls reducer ``

## reducer.median ##

Push onto the stack a reducer to compute the median of the values for each tick.

``` reducer.median ```

## reducer.min ##

Push onto the stack a reducer to return the minimum value for each tick, ignoring null values.

``` reducer.min ```

## reducer.min.forbid-nulls ##

Pushes onto the stack a reducer which outputs the min of a set of values or null if one of the values is null.

``` - reducer.min.forbid-nulls reducer ```

## reducer.min.nonnull ##

Push onto the stack a reducer to return the minimum value for each tick.

``` reducer.min.nonnull ```

## reducer.percentile ##

Push onto the stack a reducer to return the Nth percentile of the values for each tick.

``` percentile reducer.percentile reducer ```

## reducer.product ##

Push onto the stack a reducer which multiplies together all (non null) values for each tick.

``` reducer.product ```

## reducer.sd ##

Push onto the stack a reducer to compute the standard deviation (with or without Bessel's correction) of the values for each tick, ignoring null values.

``` bool reducer.sd reducer ```

## reducer.sd.forbid-nulls ##

Push onto the stack a reducer to compute the standard deviation (with or without Bessel's correction) of the values for each tick, null values lead to a null result.

``` bool reducer.sd.forbid-nulls reducer ```

## reducer.shannonentropy.0 ##

Push onto the stack a reducer to compute a Shannon Entropy, considering GTS values to be number of occurrences of an event (returns 0 if reduce a single value).

``` - reducer.shannonentropy.0 reducer ```

## reducer.shannonentropy.1 ##

Push onto the stack a reducer to compute a Shannon Entropy, considering GTS values to be number of occurrences of an event (returns 1 if reduce a single value).

``` - reducer.shannonentropy.1 reducer ```

## reducer.sum ##

Push onto the stack a reducer to compute the sum of the values for each tick, ignoring null values.

``` reducer.sum ```

## reducer.sum.forbid-nulls ##

Pushes onto the stack a reducer which outputs the sum of a set of values, the presence of a null value will lead to a null result.

``` - reducer.sum.forbid-nulls reducer ```

## reducer.sum.nonnull ##

Push onto the stack a reducer to compute the sum of the values for each tick.

``` reducer.sum.nonnull ```

## reducer.var ##

Push onto the stack a reducer to compute the variance (with or without Bessel's correction) of the non null values for each tick.

``` bool reducer.var reducer ```

## reducer.var.forbid-nulls ##

Push onto the stack a reducer to compute the variance (with or without Bessel's correction) of the values for each tick. Missing (null) values lead to a null result.

``` bool reducer.var.forbid-nulls reducer ```

## { ##

Starts a map.

``` - { mark ```

## {} ##

Pushes an empty map onto the stack.

``` - {} {} ```

## | ##

 Bitwise OR.

``` l1 l2 | long ```

## || ##

Conditional OR.

``` b1 b2 || boolean ```

## } ##

Builds a map from elements on the stack.

``` mark key1 value1 ... keyn valuen } { key1 value1 ... keyn valuen } ```

## ~= ##

Checks two operands for equality, accepting a difference under a configurable lambda value.

``` p1 p2 lambda ~= boolean```
