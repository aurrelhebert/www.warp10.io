---
title: Fetching data
layout: function
isPage: true
oldPath: 400-fetching-data.html.md.eco
category: howto
---




One of the most basic operation on Warp10 platform is fetching data, so we are going to use it as our first example to learn to use the [WarpScript data manipulation language]({{ site.baseurl }}/introduction/warpscript.md).


The `FETCH` function retrieves some data from the Continuum data store. According to the [documentation of the `FETCH` funtion]({{ site.baseurl }}/reference/functions/function_FETCH), it expects on the top of the stack 5 parameters, a Warp10 token, a class name selector, a map of label selectors, a start timestamp, and an end timestamp.


In this tutorials, when you need a Warp10 token, you can use `DOC-EGRESS-TOKEN`, a read token for the documentation data.


The classname selector is a string allowing to identify the classname of the series you want to fetch. The string represents an exact match if it starts with an `=` (like `'=com.cityzendata.sport.heartrate'`) or a regular expression that the class name must match if it starts with a tilde `~`  (like `'~com.cityzendata.*'`)


The third parameter is a map of label selectors. The label selectors are packed in a map whose keys are the label names and the values the associated selector. Those selectors can also be exact matches if they start with `=` or a regular expression if they start with `~'`.


In WarpScript, to make a map you can use the [`->MAP`]({{ site.baseurl }}/reference/functions/function_TOMAP) function, indicating the number of lines in the stack to be included in the map. For example, to create a map like


```
{
  'a': 'aa'
  'b': 'bb'
  'c': 'cc'
}
```


in WarpScript you would do:


{% raw %}
<warp10-warpscript-widget>
'a'
'aa'
'b'
'bb'
'c'
'cc'
6 ->MAP
</warp10-warpscript-widget>
{% endraw %}

You can also use a `{ key1 value1 key2 value2 }` notation:

{% raw %}
<warp10-warpscript-widget>
{
  'a' 'aa'
  'b' 'bb'
  'c' 'cc'
}
</warp10-warpscript-widget>
{% endraw %}

By  executing the precedent WarpScript script on the Quantum widget, you can see how it creates the map.

In WarpScript you can also write several instructions per line, by separating commands with a space. So you can rewrite the precedent script in a shorter form like:

{% raw %}
<warp10-warpscript-widget>
'a' 'aa'
'b' 'bb'
'c' 'cc'
6 ->MAP
</warp10-warpscript-widget>
{% endraw %}

or in a even shorter (and less readable) format:

{% raw %}
<warp10-warpscript-widget>
'a' 'aa' 'b' 'bb' 'c' 'cc' 6 ->MAP
</warp10-warpscript-widget>
{% endraw %}

or

{% raw %}
<warp10-warpscript-widget>
{'a' 'aa' 'b' 'bb' 'c' 'cc'}
</warp10-warpscript-widget>
{% endraw %}


The start and end timestamps are in ISO8601 format, i.e. `YYYY-MM-DDTHH:MM:SS.SSSSSSZ`. Only those readings whose timestamps lie between those two timestamps (most recent inclusive, oldest exclusive) will be retained. Instead of two timestamps in ISO8601 format, the start timestamp can be replaced with the end timestamp (in microseconds since the Unix epoch), and the end timstamp by a timespan in microseconds.


Those five parameters must be put in a list. In WarpScript notation, to make a list you can use the [`->LIST`]({{ site.baseurl }}/reference/functions/function_TOLIST) function. The `N ->LIST` call creates a list with the top N elements of the stack, N being consumed off the top of the stack when ->LIST is called. For example, to create a list like


```
[ 'a', 'b', 'c']
```

in WarpScript you would do:


{% raw %}
<warp10-warpscript-widget>'a'
'b'
'c'
3 ->LIST
</warp10-warpscript-widget>
{% endraw %}

You can also use a `[ a b c]` notation:


{% raw %}
<warp10-warpscript-widget>
[ 'a' 'b' 'c' ]
</warp10-warpscript-widget>
{% endraw %}


So let's say we want to recover a GTS set composed of all the GTS with classname `mozfest.light` and with label `moteId` with value 53, posted between september and december 2013. Let's translate that into WarpScript notation:


{% raw %}
<warp10-warpscript-widget>
[
  'DOC-EGRESS-TOKEN'
  'mozfest.light'
  { 'moteId' '53' }
  '2013-01-01T00:00:00.000Z'
  '2014-01-01T00:00:00.000Z'
]
FETCH   
</warp10-warpscript-widget>
{% endraw %}


The `FETCH` function pushes onto the stack the list of retrieved Geo Time Series. If you execute the precedent WarpScript script, you will get a list with one series and several values, like:

```
[{"c":"mozfest.light","l":{"area":"1",".app":"doc.data","xbeeId":"XBee_40670F0D","moteId":"53"},"a":{},"v":[[1382714858837000,51.50198796764016,0.005952995270490646,381],[1382714858830000,51.50198796764016,0.005952995270490646,291],[1382714828049000,51.50198796764016,0.005952995270490646,230],[1382714797974000,51.50198796764016,0.005952995270490646,203],[1382714797968000,51.50198796764016,0.005952995270490646,211],[1382714767900000,51.50198796764016,0.005952995270490646,199],[1382714737976000,51.50198796764016,0.005952995270490646,176],[1382714737969000,51.50198796764016,0.005952995270490646,151],[1382714707802000,51.50198796764016,0.005952995270490646,104],[1382714677915000,51.50198796764016,0.005952995270490646,89]...
```

The result is described in the [GTS output format]({{ site.baseurl }}/api/gts-output-format), a JSON based format.

Congratulations, you have done your first `FETCH` on Warp10 platform!
