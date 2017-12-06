---
title: "Delete API"
layout: "function"
isPage: "true"
categoryTree: ["apis"]
oldPath: ["40-delete.html.md"]
category: "apis"
---



The Delete API is used to erase data from the Warp10 platform. The GTS to delete are chosen via a selector, and the time interval to erase is defined by optional parameters.

The HTTP endpoint used by the Delete API is `https://API_ENDPOINT/api/vX/delete`, where `API_ENDPOINT` is a
[valid  endpoint]({{ site.baseurl}}/apis) for the public Warp10 API and `vX`is the version of the API you want to use (currently `v0`).

The Delete API **must** be accessed using the *GET* method.


#### Request Header ####


To be authentified you need to add a `X-Warp10-Token` header with your **write** token.

<div class="panel panel-default">
<div class="panel-body">
<table class="table">
  <thead>
    <tr>
      <th>Header</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>X-Warp10-Token</code></td>
      <td>A valid write token</td>
    </tr>
  </tbody>
</table>
</div>
</div>  


#### Request parameters ####

The Fetch API request ask for the following parameters:

* `selector`: the selector is a string that allow us to select one or several GTS. Its composed of the concatenation of a classname selector and a labels selector.

  The class name selector is a string which represents an exact match if it starts with an '=', or a regular expression that the class name must match if it starts with '~'.

  The labels selector is a string delimited by curly brackets (`{}`) with a list of comma separated label selectors. Each of these label selectors is composed of the label name and the value of the associated selector. Those selectors can also be exact matches if they start with '=' or a regular expression if they start with '~'.

  Example:

  `~com.cityzendata.test.*{freq~2.*,steps=100}`

  It selects all GTS whose classnames begin with *com.cityzendata.test* and whose label *steps* has a value of 100 and whose label *freq* begins with 2.

* delete  interval parameters:

    * `start` and `end`: the start and end timestamps defining the interval of the GTS to delete. They are both in [ISO8601](http://en.wikipedia.org/wiki/ISO_8601) format, *i.e.* **YYYY-MM-DDTHH:MM:SS.SSSSSSZ** or in microseconds since the Unix epoch. Only those readings whose timestamps lie between those two timestamps (most recent inclusive, oldest exclusive) will be deleted.  
    Warning: For security purpose, both parameters (`start` and `end`) should be defined, with `start` > `end`.


* delete all

    * `deleteall` parameter should be used for a full range delete (`start` and `end` not defined).

### Delete examples ###


Let's work with the following dataset:

```
1440000000000000// toto{a=42,b=42} 42
1440000000000000// titi{a=42,b=42} 42
1441000000000000// toto{a=4,b=4} 4
1441000000000000// titi{a=4,b=4} 4
1442000000000000// toto{a=42,b=42} 42
1442000000000000// titi{a=42,b=42} 42
1443000000000000// toto{a=4,b=4} 4
1443000000000000// titi{a=4,b=4} 4
1444000000000000// toto{a=42,b=42} 42
1444000000000000// titi{a=42,b=42} 42
```

We have 4 GTS:

- toto{a=42,b=42}
- titi{a=42,b=42}
- toto{a=4,b=4}
- titi{a=4,b=4}

To better follow the sample request, keep in mind these TS to ISO8601 conversions :

- Initial timestamp `1440000000000000` is `2015-08-19T16:00:00` in ISO8601
- Final timestamp   `1444000000000000` is `2015-10-04T23:06:40` in ISO8601


On this sample dataset:

- To delete all the points from the `toto{a=42,b=42}` GTS:

`GET /api/v0/delete?deleteall&selector=toto{a=42,b=42} HTTP/1.1`

Resulting dataset via [fetch API]({{ site.baseurl}}/apis/fetch)

```
1440000000000000// titi{a=42,b=42,.app=ovh.hgg.test.01} 42
1441000000000000// toto{a=4,b=4,.app=ovh.hgg.test.01} 4
1441000000000000// titi{a=4,b=4,.app=ovh.hgg.test.01} 4
1442000000000000// titi{a=42,b=42,.app=ovh.hgg.test.01} 42
1443000000000000// toto{a=4,b=4,.app=ovh.hgg.test.01} 4
1443000000000000// titi{a=4,b=4,.app=ovh.hgg.test.01} 4
1444000000000000// titi{a=42,b=42,.app=ovh.hgg.test.01} 42
```

- To delete all the points from the GTS having a label `a` with a value 42:

`GET /api/v0/delete?deleteall&selector=~.*{a=42} HTTP/1.1`

Resulting dataset via [fetch API]({{ site.baseurl}}/apis/fetch)

```
1441000000000000// toto{a=4,b=4,.app=ovh.hgg.test.01} 4
1441000000000000// titi{a=4,b=4,.app=ovh.hgg.test.01} 4
1443000000000000// toto{a=4,b=4,.app=ovh.hgg.test.01} 4
1443000000000000// titi{a=4,b=4,.app=ovh.hgg.test.01} 4
```   

- To delete all the points in September 2015 from the GTS having a classname `toto`:

`GET /api/v0/delete?selector=toto{}&start=2015-09-01T00:00:00Z&end=2015-09-30T23:59:59.999Z HTTP/1.1`

Resulting dataset via [fetch API]({{ site.baseurl}}/apis/fetch)

```
1440000000000000// toto{a=42,b=42,.app=ovh.hgg.test.01} 42
1440000000000000// titi{a=42,b=42,.app=ovh.hgg.test.01} 42
1441000000000000// toto{a=4,b=4,.app=ovh.hgg.test.01} 4
1441000000000000// titi{a=4,b=4,.app=ovh.hgg.test.01} 4
1444000000000000// toto{a=42,b=42,.app=ovh.hgg.test.01} 42
1444000000000000// titi{a=42,b=42,.app=ovh.hgg.test.01} 42
```   


- To delete all points after September 2nd at noon from all GTS with a label  `b` with value 4, using regex for the classname:

  `GET /api/v0/delete?selector=~t.t.{b=4}&start=2015-09-02T12:00:00Z HTTP/1.1`

  Resulting dataset via [fetch API]({{ site.baseurl}}/apis/fetch)

  ```
  1440000000000000// toto{a=42,b=42} 42
  1440000000000000// titi{a=42,b=42} 42
  1441000000000000// toto{a=4,b=4} 4
  1441000000000000// titi{a=4,b=4} 4
  1442000000000000// toto{a=42,b=42} 42
  1442000000000000// titi{a=42,b=42} 42
  1444000000000000// toto{a=42,b=42} 42
  1444000000000000// titi{a=42,b=42} 42
  ```
