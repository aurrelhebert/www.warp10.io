---
title: "Connect Warp 10 to Apache Zeppelin"
layout: "function"
isPage: "true"
category: "howto"
---

[Apache Zeppelin](https://zeppelin.apache.org/) is a usefull tool to create dynamical presentation or data visualization. This page is about the different steps necessary to use [WarpScript](https://github.com/cityzendata/warp10-platform) and [QuantumViz](https://github.com/cityzendata/warp10-quantumviz) in Zeppelin. WarpScript is the Warp 10 analysis language. QuantumViz is the WebComponent used to plot graphs or geo-maps.

## Set-up

Zeppelin in version superior to 0.6.1 need to be installed. Then download [WarpScript](https://github.com/cityzendata/warp10-zeppelin) and [QuantumViz](https://github.com/cityzendata/warp10-zeppelin-quantumviz) interpreters.

## Zeppelin web app

To make the Warp10 interpreters working correctly some modification must be done in the Zeppelin web application. Download zeppelin-web directory in [github](https://github.com/apache/zeppelin).

Then to have syntax intpreter in the WarpScript interpreter, add this [file](https://github.com/cityzendata/warp10-quantum-elements/blob/master/ace/mode-warpscript.js) in the folder "bower_components/ace-builds/src-noconflict"

And add in "bower.json" in task "ace-builds/main"

```
  "src-noconflict/mode-warpscript.js"
```

Finally to set-up the web-app for the use of QuantumViz: change the task "postinstall" in "package.json":

```
"postinstall": "bower install --silent && bower install cityzendata/warp10-quantumviz#~1.6.2 -F --config.directory=./bower_quantumviz --silent && grunt googlefonts"
```

Add in grunt "copy" task (Gruntfile.js):  

```
{
  expand: true,
  cwd: 'bower_quantumviz/',
  src: '**',
  dest: '<%= yeoman.dist %>/bower_components'
},
```

Compile now the zeppelin web-app using

```
mvn package
```

Copy paste generated jar in your zeppelin directory. Restart Zeppelin.

## Interpeter settings

Start Zeppelin, and update the warp10.url config parameter for the Zeppelin interpreter.
Set it to the backend exec point url of the install Warp10 platform (without the exec).
Set warp10.isCZDBackend to false exept if you use a Warp10 managed by [Cityzen Data](http://www.cityzendata.com/).

```
warp10.url: http://address:port/api/v0
warp10.isCZDBackend: false
```

For the QuantumViz, if you set-up the web component as explained earlier just set

```
warp10.url: ./bower_components
```
Otherwise set warp10.url to an url were the component QuantumViz is available and running.

## Usage 

The WarpScript component can be used to create, retrieve and manipulate Geo-Time-Series using WarpScript on a specific back-end. 

```
%warpscript
{
  'singleGTS'
  NEWGTS
  'name' RENAME
  1 NaN NaN NaN 0 ADDVALUE
  1000 NaN NaN NaN 1 ADDVALUE
  2000 NaN NaN NaN 2 ADDVALUE
  10000 NaN NaN NaN 10 ADDVALUE
  20000 NaN NaN NaN 20 ADDVALUE
}
```

This sample return a map containing the single GTS key and create a new serie called name as value. With WarpScript interpreter if the first element is a map, they will be stored in Zeppelin resource pool.

To reuse the singleGTS in an other WarpScript paragraph just add "import" and it's key name on top of the paragraph as comment. Example, to get the size of the current GTS:

```
%warpscript
//import singleGTS
$singleGTS SIZE
```

Now to plot this series, use the QuantumViz interpreter. A syntax example is defined as follow, for more information about each keys check QuantumViz interpreter on github:

```
%quantumviz
{
    "data" : 
        [ 
            { "series" : "singleGTS", "width" : "600px", "interpolate" : "step-before", xLabel : "x", yLabel : "y", timestamps : true },
            { "series" : "singleGTS", "width" : "600px" }
        ],
    "default-width" : "80%",
    "default-height" : "300px",
    "type" : "graph"
}

```

You are now ready to use Zeppelin to interact with a Warp10 platform and to plot your own series !




