---
title: "Getting Started"
layout: "function"
isPage: "true"
link: "/"
categoryTree: ["getting-stated"]
oldPath: ["00-Index.html.md"]
category: "getting-started"
---


## Quick start

This page describes how to download and deploy a standalone version of the Warp 10 platform, generate your first tokens and start interacting with the platform by pushing data and performing analytics.

Alternatively a method involving docker is also described.

The standalone version of the Warp 10 platform uses LevelDB as its storage backend, this version is suitable for managing a few tens of millions of time series and few hundreds of billions of datapoints. If you have larger needs, a [distributed](distributed) version of the platform is also available which uses Apache HBase as a scalable storage layer.

<a name="setup"></a>

## Warp 10 standalone platform deployment

### Setup the platform

<div class="float-right">
  <a href='https://dl.bintray.com/cityzendata/generic/io/warp10/warp10/1.2.11-rc6/warp10-1.2.11-rc6.tar.gz' target="_blank">
    <img class="no-zoom" src="/img/getting-started/bintray.png" alt="Using Warp 10 Init script">
    <br />
    <img class="no-zoom" src='https://api.bintray.com/packages/cityzendata/generic/warp10/images/download.svg?version=1.2.11-rc5'>
  </a>
</div>

The easiest way to setup the Warp 10 platform is to use the Warp 10 Init script that comes with the Warp 10 build. Builds of Warp 10 are available on [Bintray](https://dl.bintray.com/cityzendata/generic/io/warp10/warp10). It is the recommended method of installation.

#### Running Warp 10

Untar the Warp 10 archive.

```bash
tar xf warp10-X.Y.Z.tar.gz
cd warp10-X.Y.Z/bin
```

You have to define the **JAVA_HOME** environment variable. You can set it in the Warp 10 init script `warp10-standalone.sh`.

Execute the Warp 10 init script `warp10-standalone.init`. This script must be run as **root**. The `bootstrap` command 
will create the Leveldb database and all the stuff surrounding it.
Then the `start` command will start the Standalone mode with the right user `warp10`.
An initial set of tokens will be provided and some useful commands to start playing with your Warp 10 instance.

Instead of using `warp10-standalone.init` you can use `warp10-standalone.sh`.
To bootstrap your installation, you have to run `warp10-standalone.sh` as root but instead of `warp10-standalone.init` 
you can use the `warp10` user afterwards. 

```bash
# Start bootstrap as root
sudo ./warp10-standalone.sh bootstrap
```


```bash
Bootstrap..
Fix ownership..
WARP10_HOME: /opt/warp10-X.Y.Z/bin/..
Fix permissions..
Warp 10 config has been generated here: /opt/warp10-X.Y.Z/bin/../etc/conf-standalone.conf
```

```bash
# Start Warp 10 (as warp10 user)
sudo -i
su warp10
warp10@XXX:/opt/warp10-X.Y.Z/bin#
./warp10-standalone.sh start
```

or 

```bash
# Start Warp 10 (as root user)
sudo ./warp10-standalone.init start
```

```bash
Init leveldb
___       __                           ____________   
__ |     / /_____ _______________      __<  /_  __ \  
__ | /| / /_  __ `/_  ___/__  __ \     __  /_  / / /  
__ |/ |/ / / /_/ /_  /   __  /_/ /     _  / / /_/ /   
____/|__/  \__,_/ /_/    _  .___/      /_/  \____/    
                        /_/                          
##
## Warp 10 listens on 127.0.0.1:8080
##
## Quantum listens on 127.0.0.1:8090
##
##
## An initial set of tokens was generated for you so you can immediately use Warp 10:
##
## Write Token: thMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXuH
## Read Token: 47O6XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX5r
##
## Push some test data using:
##
##   curl -H 'X-Warp10-Token: thMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXuH' http://127.0.0.1:8080/api/v0/update --data-binary '// test{} 42'
##
## And read it back using:
##
##   curl 'http://127.0.0.1:8080/api/v0/fetch?token=47O6XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX5r&selector=~.*\{\}&now=now&timespan=-1'
##
## You can submit WarpScript for execution via:
##
##   curl http://127.0.0.1:8080/api/v0/exec --data-binary @path/to/WarpScriptFile
##
## The alternative to command-line interaction is Quantum, a web application to interact with the platform in an user-friendly way:
##
##   http://127.0.0.1:8090
##
```

Warp 10 standalone config `conf-standalone.conf` has been generated in the `etc` directory

Logs are available in the `logs` directory

Data are stored via leveldb in the `data` directory

## Setup the platform with Docker

<div class="text-center">
  <img src="/img/getting-started/docker.png" alt="Using Docker">
</div>

The other way to setup the Warp 10 platform is to use [Docker](http://docker.io). Builds of Warp 10's Docker image are 
available on [Dockerhub](https://hub.docker.com/r/warp10io/warp10/).

### Running Warp 10 with Docker

Start your image binding the external ports 8080 and 8081 in all interfaces to your container.

Docker containers are easy to delete. If you delete your container instance, you'll lose the Warp 10 store and 
configuration. So by default you should add a volume mapping to the containers `/data` folder.

```bash
docker run --volume=/var/warp10:/data -p 8080:8080 -p 8081:8081 -d -i warp10io/warp10:1.0.7
```

In this example you bind the container internal data folder, `/data` to your local folder `/var/warp10`.

You *must* use the same `--volume` option in all your other docker commands on warp 10 image.

## Using Warp 10

### Generating new Tokens

The Warp 10 platform is built with a robust security model that allows you to have a tight control of who has the right 
to write and/or read data. The model is structured around the [concepts](/introduction/concepts) of `data producer`, 
`data owner` and `application`, and `WRITE` and `READ` tokens.  

By default, at the first start, Warp 10 init script will generate both a `READ` and a `WRITE` token for the test 
application `io.warp10.bootstrap` for a test user that is both the producer and the owner of the data.

Then, you can generate your own write and read tokens. You get it by executing the `worf` command via Warp 10 init script.

```bash
root@XXX:/opt/warp10-X.Y.Z/bin# ./warp10-standalone.init worf appName ttl(ms)
```

```bash
root@XXX:/opt/warp10-X.Y.Z/bin# ./warp10-standalone.init worf myApp 31536000000
default options loaded from file:/opt/warp10-X.Y.Z/bin/../etc/.conf-standalone.conf.worf
{"read":{"token":"lO5XXXXXXXXXXXXXXXXXXXXDXk","tokenIdent":"606aa9b8f6f47136","ttl":31536000000,"application":"myApp","owner":"3b8ab607-4aac-4b13-9251-94f152924766","producer":"3b8ab607-4aac-4b13-9251-94f152924766"},"write":{"token":"8D_XXXXXXXXXXXXXXXe7B","tokenIdent":"a219f98201b29e01","ttl":31536000000,"application":"myApp","owner":"3b8ab607-4aac-4b13-9251-94f152924766","producer":"3b8ab607-4aac-4b13-9251-94f152924766"}}
```

In order to interact more precisely with the user/token/application system, you need an interactive access to Warp 10's 
`Worf` console. More information [here](/tools/worf).

### Data snapshot

Snapshot of leveldb data can be performed via the init script

```bash
./warp10-standalone.init snapshot 'snapshot_name'
```

<a name="pushing-data"></a>

### Pushing data into Warp 10

Data is sent into the platform via HTTP [POST](http://en.wikipedia.org/wiki/POST_(HTTP)) requests to the Warp 10 API.

### API Endpoint

The HTTP endpoint used to send data is `http(s)://host:port/api/vX/update`, where `vX`is the version of the API you want 
to use (currently `v0`). In order to be accepted by the platform, requests to this endpointy need to be authenticated, 
by using a `X-Warp10-Token` HTTP header with your **write** token.

### Data format

Data is sent in the body of the POST request, one data point per line. Each line follows the [GTS input format](/apis/gts-input-format):

```bash
TS/LAT:LON/ELEV NAME{LABELS} VALUE
```

Where :


<div class="panel panel-default">
  <div class="panel-body"><table class="table">
      <tbody>
        <tr>
          <td><code>TS</code></td>
          <td>
            *Optional*  Timestamp of the reading, in <b>microseconds</b> since the Unix Epoch.
            If omitted, the timestamp associated to the data point will be the one of the platform when the point is pushed.
          </td>
        </tr>
        <tr>
          <td><code>LAT:LON</code></td>
          <td>*Optional* geographic coordinates of the reading, using [WGS84](http://en.wikipedia.org/wiki/WGS84)</td>
        </tr>
        <tr>
          <td><code>ELEV</code></td>
          <td>*Optional* elevation of the reading, in millimeters</td>
        </tr>
        <tr>
          <td><code>NAME</code></td>
          <td>Class name of the reading as a [URL encoded](http://en.wikipedia.org/wiki/Percent-encoding) UTF-8 character 
          string. The encoding of character `{` (Unicode *LEFT CURLY BRACKET*, *0x007B*) is MANDATORY.</td>
        </tr>
         <tr>
          <td><code>LABELS</code></td>
          <td>Comma separated list of labels, using the syntax `key=value` where both `key` and `value` are URL encoded 
          UTF-8 character strings. If a key or value contains `,` (Unicode COMMA, 0x002C),`}` 
          (Unicode RIGHT CURLY BRACKET, 0x007D) or `=` (Unicode EQUALS SIGN, 0x003D), those characters MUST be encoded.</td>
        </tr>
        <tr>
          <td><code>VALUE</code></td>
          <td>The value of the reading. It can be of one of four types: `LONG`, `DOUBLE`, `BOOLEAN`, `STRING`</td>
        </tr>
      </tbody>
    </table>
  </div>
</div>


### Example request

```http
POST /api/v0/update HTTP/1.1
Host: host
X-Warp10-Token: wsedrfg.53ef32.detgertyyhefwe5t677456rrfhgbfyhgherdtyreeryer
Content-Type: text/plain

1380475081000000// foo{label0=val0,label1=val1} 123
/48.0:-4.5/ bar{label0=val0} 3.14
1380475081123456/45.0:-0.01/10000000 foobar{label1=val1} T
```

To test the running container, push a single GTS containing one data in the platform using your WRITE token.

```bash
curl -v -H 'X-Warp10-Token: WRITE_TOKEN' --data-binary "1// test{} 42" 'http://127.0.0.1:8080/api/v0/update'
```

If everything is OK, you should receive a HTTP 200

> When using Docker on Mac OS or Windows, there is no binding between Warp 10 API address and the host (docker is 
runned throw a Virtual Machine). To reach Warp 10 you need to replace 127.0.0.1 by the real Ip address of the container.
To get it, use a simple `docker-machine ip default>`, the container address is also shown in the Settings/Ports page of 
your container. If you used the shared volume between the container and the host, you can access to the virtual machine 
using `docker-machine ssh default>` and inspect the repertory `/var/warp10`. Don't hesitate to check on 
[docker-machine documentation](https://docs.docker.com/machine/).

Get this data using your READ tokens.

```bash
curl -v  --data-binary "'READ_TOKEN' 'test' {} NOW -1 FETCH" 'http://127.0.0.1:8080/api/v0/exec'
```

If everything is OK, you should receive a HTTP 200 OK with your datapoint in JSON format.

### Pushing your data into the platform

If you already have some time series that you want to push, you can put them into GTS input format.

If not, we have prepared a small [test dataset](/assets/data/drones) containing some example data to push in an application.
This data set contains 10 Geo Time Series<sup>TM</sup> simulating captors integrated in 5 drones. Each drone has two 
captors, one keeping track of flying times, and the other connected to the GPS, recording current position and 
registering a boolean value true only if the drone moves.

Here you have several data points from the file:

```none
1449212583312000/48.395776999999995:-4.509472/ example.drone.gps.gts5{host=ubuntu, number=5, type=gps.state} true
1449212593312000// example.drone.captor.gts1{host=ubuntu, number=1, type=captor.time} 8
1449212593312000/48.395776999999995:-4.479472/ example.drone.gps.gts1{host=ubuntu, number=1, type=gps.state} true
1449212593312000// example.drone.captor.gts2{host=ubuntu, number=2, type=captor.time} 5
1449212593312000/48.355777:-4.489472/ example.drone.gps.gts2{host=ubuntu, number=2, type=gps.state} true
1449212593312000// example.drone.captor.gts3{host=ubuntu, number=3, type=captor.time} 6
1449212593312000/48.355777:-4.479472/ example.drone.gps.gts3{host=ubuntu, number=3, type=gps.state} true
1449212593312000// example.drone.captor.gts4{host=ubuntu, number=4, type=captor.time} 5
```

If you're in a \*nix system, you can push the data using [cURL](https://en.wikipedia.org/wiki/CURL).
The Warp 10 platform listens to the port 8080 of your container. In the  [setup](#setup) we have mapped this port to 
the port 8080 of the host machine, so you can make your request to `127.0.0.1:8080`.

> In Mac OS or Windows, there is no binding between Warp 10 API address and the host, you need to replace 127.0.0.1 by 
the real Ip address of the container as explained in the precedent section.

```bash
curl -v -H 'Transfer-Encoding:chunked' -H 'X-Warp10-Token: TOKEN_WRITE' --data-binary @PATH_TO_THE_DATA_FILE 'http://127.0.0.1:8080/api/v0/update'
```

Replacing `TOKEN_WRITE` by the WRITE token generated in the [setup](#setup) and `PATH_TO_THE_DATA_FILE` by the path to 
the [test dataset](/assets/data/drones).

If you receive a HTTP 200 code in the response, the data is in the platform

If cURL isn't available in your system, you can use any tool able to generate HTTP POSTS, like [Postman](http://www.getpostman.com/), 
with the content of the file in the body of the request, and the WRITE token in a `X-Warp10-Token` header.

Or you can simply use our graphical Warp 10 IDE: [Quantum](/tools/quantum).

### Using Quantum

[Warp 10's Quantum](/tools/quantum) is a web application aiming to allow users to interact with the platform in an 
user-friendly way, offering an alternative to command-line interaction.

> A standalone version of Quantum is packaged in the Docker image you have just installed, listening on the port 8081. 
In a Linux system (with binding between Warp 10 API address and the host) you can access Quantum at `127.0.0.1:8081`. 
In Mac OS or Windows, there is no binding between Warp 10 API address and the host, you need to replace 127.0.0.1 by 
the real Ip address of the container as explained in the precedent section.

Quantum has three main functions:

* WarpScript: allows to interactively write your WarpScript, send it to a Warp 10 platform, get the response and done 
some plotting of the resulting stack

  ![Quantum - WarpScript](/img/getting-started/quantum-warpscript.png)

* Update: used to send data to the platform, as an alternative to the command-line

  ![Quantum - Update](/img/getting-started/quantum-ingress.png)

* Delete: used to erase data from the platform, as an alternative to the command-line

  ![Quantum - Delete](/img/getting-started/quantum-delete.png)

Quantum is done entirely as [Polymer](https://www.polymer-project.org/) elements, and that gives the application a lot 
of flexibility, it can be used as a full app but you can also take only the widget you need, as we have done with the 
headless embeddable version of Quantum's WarpScript widget that allows you to interactively try the examples on this doc.

<a name="accessing-data">

### Accessing Data

Now you have some data in your Warp 10 instance. In this section we expose some methods to fetch data from  Warp 10. The
first method is a simple HTTP GET request on the [`fetch` API endpoint](/apis/fetch). The second one will introduce 
[WarpScript](/reference/) and you will see how to create your first script.

#### Requesting `fetch` API endpoint

The Fetch API allows to recover raw GTS data in a extremely quick and efficient way.


The HTTP endpoint used by the Fetch API is `http(s)://API_ENDPOINT/api/vX/fetch`, where `API_ENDPOINT` is a
[valid  endpoint](/apis) for the Warp 10 instance you're using and `vX`is the version of the API you want to use (currently `v0`).
The Fetch API **must** be accessed using the *GET* method.

To be authenticated you need to add a `X-Warp10-Token` header with your **read** token or, as a fallback authentication
mode, the token can be passed in a request parameter `token`.

The minimal set of parameters you need to give in the request is

* `selector`: * `selector`: a string that allow us to select one or several GTS. Its composed of the concatenation of a 
classname selector and a labels selector.

  Example: `~io.warp10.*{freq~2.*,steps=100}` It selects all the GTS whose classname begins with `io.warp10` and whose 
  label `freq` begins with 2 and the label `steps` is 100.

* Fetching interval parameters: either

  * `start` and `stop`: the start and end timestamps defining the interval of the GTS to fetch. They are both in 
  [ISO8601](http://en.wikipedia.org/wiki/ISO_8601) format, *i.e.* **YYYY-MM-DDTHH:MM:SS.SSSSSSZ**. Only those readings 
  whose timestamps lie between those two timestamps (most recent inclusive, oldest exclusive) will be retained.  

  Or

  * `now` and `timespan`: instead of the basic interval search, with the start and end timestamps in ISO8601 format, 
  you can use two alternative formats for the interval parameters:

    1. If you want to fetch readings whose timestamps lie in a specific timespan before a timestamp (for example all 
    the readings in the last minute) you can use the end timestamp (in microseconds since the Unix epoch) as `now` parameter 
    and the timespan (in microseconds) as `timespan`.

    1. If you want to recover the last `n` readings before a given instant, you can use the instant timestamp (in 
    microseconds since the Unix epoch) as `now` parameter and `-n` as `timespan`.


Here you have a sample request that recover data from all your drone GTS from the precedent sections. The selector 
parameter defines the pattern that the GTS have to match to be fetched, those whose classname begins with 
`example.drone.captor`. `{}` correspond to the labels.  This command load data points starting from the `now` parameter 
(in this example, 1449222473312000 micro-seconds after Epoch). As `timespan` equals -10, Warp 10 will only fetch the 
last ten data points before `now`. A positive timespan corresponds to a duration, a negative one to a number of data 
points to get.

```bash
curl -H 'X-Warp10-Token: TOKEN_READ' --data-binary "now=1449222473312000&timespan=-10&selector=~example.drone.captor.*{}" 'http://127.0.0.1:8080/api/v0/fetch?'
```

Note that the data returned by the Fetch API can be fed into the `update` endpoint verbatim.

#### Using WarpScript

The second way to fetch data is to use the WarpScript data manipulation environment.

WarpScript is an extensible [stack oriented programming language](http://en.wikipedia.org/wiki/Stack-oriented_programming_language) 
which offers more than 600 functions and several high level frameworks to ease and speed your data analysis. Simply 
create scripts containing your data analysis code and submit them to the platform, they will execute close to where the 
data resides and you will get the result of that analysis as a JSON object that you can integrate into your application.


Store the following script in a file `file.mc2`.

```
'READ_TOKEN'     // Replace READ_TOKEN with your read token. This line put your token on the stack
'token' STORE    // Store it in a variable
[ $token '~example.drone.*' { 'source' 'example' } NOW -10 ] FETCH  // Fetch the data, the last 10 points of the selected series
```

This command looks for all your GTS having a name matching `example.drone` and having the label `source` equals to `example`.
Then only the last ten points of those GTS before time equals to NOW will be extracted.

Launch the following `curl` command to submit your WarpScript and get your data.

```bash
curl -H 'Transfer-Encoding:chunked' --data-binary @file.mc2 'http://127.0.0.1:8080/api/v0/exec'
```

This script can also be launched in Quantum. Besides, Quantum gives the possibility to plot GTS extracted on a graph.

<a name="analyzing"></a>

### Analyzing Data

The WarpScript manipulation environment goes way further than simply recovering your data, it allows you to do complex 
analysis of data stored in the Warp 10 storage platform.

In the previous section, a first WarpScript program was realized. Now it's time to improve it to extract information 
about the data.

#### Compute the mean of all data points

Get all the sensor GTS.

```bash
'Your read token'  // Put your token on the stack
'token' STORE // Store it in a variable
[ $token '~example.drone.*' { 'type' 'captor.time' } NOW -1000 ] FETCH  // Fetch the data
```

Now a `BUCKETIZE` function will be used.

```bash
[ SWAP bucketizer.mean 0 0 1 ] BUCKETIZE
```

What happened here is that all `captor.time` GTS are on top of the stack in one list. We swap it with 
["\["](/reference/functions/function_OPEN_BRACKET) so we can included it in the parameter list of the function 
[`BUCKETIZE`](/reference/frameworks/framework-bucketize). This function will apply a *bucketizer* for each GTS 
to synchronized the ticks, here the [bucketizer.mean](/reference/frameworks/bucketizer_mean) that calculates the 
mean of the values of all the datapoints in the interval. The only other parameter given is a *bucketcount* which 
correspond to the number of bucket expected. The goal here is to compute the mean of all the data points, that's why 1 
is given as parameter. To find more information, please refers to the [ Introducing `BUCKETIZE`](/howto/intro-bucketize/) 
page.

* What is on the stack now ? There is five GTS containing one tick which have a value equals to the mean of all the data 
points of the GTS. Moreover, those GTS have their ticks synchronized.

#### Compute multiple mean for a GTS with a duration of 2 minutes

Get all the GTS of all the sensors.

```bash
'Your read token'           // Put your token on the stack
'token' STORE               // Store it in a variable
[
$token
'~example.drone.*'
{ 'type' 'captor.time' }
NOW -1000
] FETCH  // Fetch the data
```

Get the last timestamp of the GTS. As all GTS are synchronized, they all have the same last timestamp. So here we can 
get the first GTS fetched and get its last tick.

```bash
'gts' STORE                 // Store the GTS list in a variable
$gts 0 GET                  // Get the first element, the first matching GTS
LASTTICK                    // Get the last tick of that GTS
'lasttick' STORE            // Store it
```

Now a `BUCKETIZE` function will be used.

```bash
[
    $gts
    bucketizer.mean
    $lasttick
    120 STU *
    0
] BUCKETIZE
```

What happened here : this WarpScript will generate buckets starting from the last tick and having a duration of 2 minutes. 
[`STU`](/reference/functions/function_STU) correspond to the number of time units in seconds (bucket have a duration of 
120 * 1 second). As many bucket as necessary will be generated for each GTS. Those buckets will have values equals to 
the mean of all data points inside two minutes. Moreover the timestamp of each bucket of each GTS are now synchronized.

#### Get how many drones are flying at each timestamp

Get all the GPS metrics.
bash
```
'Your read token'  // Put your token on the stack
'token' STORE // Store it in a variable
[ $token '~example.drone.*' { 'type' 'gps.state'  } NOW -1000 ] FETCH // Fetch the data
```

  Get the last timestamp.

```bash
'gts' STORE                 // Store the GTS list in a variable
$gts 0 GET                  // Get the first element, the first matching GTS
LASTTICK                    // Get the last tick of that GTS
'lasttick' STORE            // Store it
```

`BUCKETIZE` is used to have a bucket size of 1 seconds. To compute an OR, [`bucketizer.max`](/reference/frameworks/bucketizer_max)
will be used (for the operator AND, use min).

```bash
[ $gts bucketizer.max $lasttick STU 0 ] BUCKETIZE
'bucketized_gts' STORE
```

Now that the ticks are synchronized, execute an operation on this list of GTS to get the number of flying drones at each 
times. The values in the GTS are boolean ones, but they can be converted in integer (true is 1, and false 0) in order 
to apply numerical function on it. The operator of the framework [`APPLY`](/reference/frameworks/) will the be used here. 
Parameter "[]" equals to a list of labels that have to respect each GTS.  To find more information, please refers to the 
documentation page [`APPLY`](/reference/frameworks/framework-apply).

```
[ $bucketized_gts [] op.add ] APPLY
```

Now you can simply compute the mean of this new GTS, or for example the mean by minute during the fly.

#### Find all objects near starting point at each timestamp

Get all the GPS metrics.

```bash
'Your read token'  // Put your token on the stack
'token' STORE // Store it in a variable
[ $token '~example.drone.*' { 'type' 'gps.state'  } NOW -1000 ] FETCH // Fetch the data
```

Get the last timestamp.

```bash
'gts' STORE                 // Store the GTS list in a variable
$gts 0 GET                  // Get the first element, the first matching GTS
LASTTICK                    // Get the last tick of that GTS
'lasttick' STORE            // Store it
```

`BUCKETIZE` is used to get a bucket size of 1 seconds. To compute an OR, *bucketizer* max will be used (for the operator and, use min).

```bash
[ $gts bucketizer.max $lasttick STU 0 ] BUCKETIZE
'bucketized_gts' STORE
```

Find all points in the area around the starting point (Correspond to a square which have a size equals to 5 steps (one step equals to a movement of 0.01 in latitude or longitude)). To find more information, please refers to the documentation page [`MAP`](/reference/frameworks/framework-map).

```bash
[
    $bucketized_gts
    'POLYGON((-4.539472 48.415777,-4.539472 48.315777,-4.439472 48.315777,-4.439472 48.415777, -4.539472 48.415777))'
    0.1 true GEO.WKT
    
    mapper.geo.within
    0 0 0         // Sliding window of 1 (0 pre and 0 post), no options
]
MAP
```

The three 0 correspond to the option of the Geo within. For example, a window integrating x previous and y following 
points in the area are required to considered current point as valid.

To conclude, calculate speed of drones for each timestamp when they are in the starting area.

```bash
[
    SWAP
    mapper.hspeed
    // pre-window
    3
    // post-window
    0
    // occurrences
    0
]
MAP
```

Here it's same than in previous case. A sliding window is necessary to compute the speed at each timestamp of the drone.
 So that's why 3 points are taken before and none after the current tick.

To have realistic result this calculation have to be included before the previous step which kept only the data points 
in a small area near the starting point. (If you put it before change `SWAP` by `$bucketized_gts` and 
add `'bucketized_gts' STORE`)

Finally, you already know how to compute the average speed and in the same way you can compute a lot of other statistics. 
You will find more information about the supported function in the rest of the documentation. Here you can find a page
 resuming all the [existing warpscript functions](/reference/reference).
