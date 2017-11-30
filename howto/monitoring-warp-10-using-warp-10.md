---
title: Monitoring Warp&nbsp;10 using Warp&nbsp;10
layout: function
isPage: true
category: howto
---

The easiest way to monitor a Warp&nbsp;10 instance (let's call it the main Warp&nbsp;10) 
is to use another Warp&nbsp;10 instance (the monitoring Warp&nbsp;10) to gather the 
monitoring metrics from the main one, and then use WarpScript to fetch and 
analyze those metrics.

## Setup the monitoring Warp&nbsp;10 instance

The first thing to do is install the instance of Warp&nbsp;10 where you will do the 
monitoring, gathering the metrics from the main instance and analyzing them via WarpScript.

> If needed, look at the [getting started](/1._getting-started) page for the detailed 
> instructions to install Warp&nbsp;10

### Generate monitoring tokens

The monitoring metrics from the main Warp&nbsp;10 will we pushed in the monitoring
Warp&nbsp;10 as any other GTS. As such, before pushing them,
you need to generate both a `READ` and a `WRITE` token for the monitoring 
application.

To generate these tokens  you use the `worf` command via Warp&nbsp;10 init script.

```
root@XXX:/opt/warp10-X.Y.Z/bin# ./warp10-standalone.init worf appName ttl(ms)
```


Let's say you choose `monitoring` as the monitoring application name and you want to 
generate one year (31536000000 ms) valable tokens:

```
root@XXX:/opt/warp10-X.Y.Z/bin# ./warp10-standalone.init worf monitoring 31536000000
default options loaded from file:/opt/warp10-X.Y.Z/bin/../etc/.conf-standalone.conf.worf
{"read":{"token":"lO5XXXXXXXXXXXXXXXXXXXXDXk","tokenIdent":"606aa9b8f6f47136","ttl":31536000000,"application":"monitoring","owner":"3b8ab607-4aac-4b13-9251-94f152924766","producer":"3b8ab607-4aac-4b13-9251-94f152924766"},"write":{"token":"8D_XXXXXXXXXXXXXXXe7B","tokenIdent":"a219f98201b29e01","ttl":31536000000,"application":"monitoring","owner":"3b8ab607-4aac-4b13-9251-94f152924766","producer":"3b8ab607-4aac-4b13-9251-94f152924766"}}
```


## Installing Sensision 

In order to gather the monitoring metrics from the main Warp&nbsp;10, you only need
to install and configure [Sensision service](https://github.com/cityzendata/sensision)
in the main Warp&nbsp;10 machine.

> In these documentation page we are going to suppose that you're using
> Warp&nbsp;10 Standalone. If you are using the distributed mode, you will need
> to install Sensision in all the Warp&nbsp;10 nodes but ideally also on the Kafka 
> and HBase machines. The process will soon be described in a separated page.

The easiest way to setup Sensision service is to use the *Sensision init script* that 
comes with the *Sensision service build*. Builds of Sensision are available on 
[Bintray](https://bintray.com/cityzendata/generic/sensision-service). It is the 
recommended method of installation.


## Running Sensision service

Untar the Sensision service file.

```
tar xf sensision-service-X.Y.Z.tar.gz
cd sensision-service-X.Y.Z/bin
```

If you already have Warp&nbsp;10 running, your `JAVA_HOME` environment variable should 
be already set, but you can also set can set it in the Sensision init script 
`sensision.init`.

Execute the Sensision init script `sensision.init`. This script must be run as **root**. 
It will create the folder `/var/run/sensision` and all the stuff surrounding it. 
Then the init script starts the sensision service with a conf by default.

```
./sensision.init start
```

```
root@XXX:/opt/sensision-X.Y.Z/bin
Config file does not exist - Creating it from template...
Init Sensision..
Fix permissions..
'WARP10_CONF' is not defined. Skip generation of Sensision configuration - Copy template as it is
Starting is going to be stopped - Update configuration '/opt/sensision-X.Y.Z/bin/../etc/sensision.conf' manually and restart Sensision
```

At this moment, Sensision has been only partially initialized, at it lacks the information on the
Warp&nbsp;10 instance it must push the metrics to. You need to edit the 
`/opt/sensision-X.Y.Z/etc/sensision.conf` configuration file to set it.

Look at the *Default queue* part of the configuration file:

```
#
# Default queue
#

sensision.qf.url.default=http://127.0.0.1:8080/api/v0/update
sensision.qf.token.default=@warp:WriteToken@
sensision.qf.topn.default=250
sensision.qf.period.default=1000
sensision.qf.batchsize.default=100000
#sensision.qf.proxy.host.default=
#sensision.qf.proxy.port.default=
#sensision.dedup.maxsize.default=xxx
#sensision.dedup.maxage.default=xxx
```

And set `sensision.qf.url.default` to the *Update* endpoint of your monitoring Warp&nbsp;10 instance, 
and put the monitoring `WRITE` token you generated before in the `sensision.qf.token.default` variable.

Then you can restart Sensision:

```
./sensision.init start
```

If everything is ok, you can see that a Sensision target file for your main Warp&nbsp;10 instance is
created on `/var/run/sensision/targets/`:

```
root@XXX:ls -al /var/run/sensision/targets/
total 8
drwx-wx-wt  2 horacio horacio 4096 sept. 27 09:52 .
drwxr-xr-x 10 horacio horacio 4096 juil. 21 16:29 ..
-rw-rw-r--  1 horacio horacio    0 sept. 27 09:52 7ffffea13dad1efc.60000.af4ec5da-f721-493d-aaa0-25b3b8e70d05.38261.target
-rw-rw-r--  1 horacio horacio    0 sept. 27 09:52 7ffffea13dad4e0c.60000.f519167d-c4f7-435f-ae8e-2b87f67b102f.42893.warp.target
```

In this example, the target file for your Warp&nbsp;10 is `7ffffea13dad4e0c.60000.f519167d-c4f7-435f-ae8e-2b87f67b102f.42893.warp.target`.
The number before `.warp.target` is the port opened by Warp&nbsp;10 to expose its metrics, you can manually poll it to 
see if it is working:

```
root@XXX:curl 127.0.0.1:42893/metrics
1506498948335000// warp.revision{component=standalone} '1.2.10'
1506498948335000// warp.script.mobius.sessions.scheduled{} 0
1506498948335000// warp.script.repository.macros{} 0
1506498948335000// warp.script.repository.jars{} 0
1506498948335000// warp.script.bootstrap.loads{} 6
1506498948335000// warp.script.function.count{function=DEF} 6
1506498948336000// warp.directory.gts{} 458810
1506498948336000// warp.script.function.time.us{function=DEF} 324
```

## Using the metrics

The complete list of the metrics exposed by Warp&nbsp;10 is on 
https://github.com/cityzendata/warp10-platform/blob/master/warp10/src/main/java/io/warp10/continuum/sensision/SensisionConstants.java

You can manipulate those metrics in any way you want. Some suggestions :

- Use [QuantumViz](https://github.com/cityzendata/warp10-quantumviz) custom elements and some simple WarpScript 
`FETCH`s to get and plot the last values of the metrics you want to monitor.

- Use the [Grafana Warp&nbsp;10 plugin](https://github.com/cityzendata/grafana-warp10) and some WarpScript code to build
a fully featured monitoring dashboard.

- Make your favorite monitoring tool do some WarpScript requests (they are simple HTTP requests, almost any tool 
is able to do it) to get the metrics and add them to you favorite dashboard or monitoring tool.





