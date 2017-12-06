---
title: Create a WarpScript extension
layout: function
isPage: true
category: howto
---

The aim of this tutorial is to show the user how to developp a WarpScript extension. WarpScript extensions are Java classes which modify the set of functions known to WarpScript. Using a WarpScript extension you can redefine, define new or remove existing functions. This tutorial will define the same function seen in the [create a UDF](http://www.warp10.io/howto/create-a-udf/) tutorial.

In this page, we will learn how to implement a WarpScript set of functions and how to deploy it in your own platform. In this tutorial the set contains a single function which generates a single string from 2 strings that are currently on top of the WarpScript stack.

The full code is available on github [here](https://github.com/cityzendata/warp10-ext-template).

## Functions and extension interfaces

The Java functions exposed by a WarpScript extension must extend [NamedWarpScriptFunction](https://github.com/cityzendata/warp10-platform/blob/master/warp10/src/main/java/io/warp10/script/NamedWarpScriptFunction.java) and implement the [WarpScriptStackFunction](https://github.com/cityzendata/warp10-platform/blob/master/warp10/src/main/java/io/warp10/script/WarpScriptStackFunction.java) interface. The WarpScript extension itself extends [WarpScriptExtension](https://github.com/cityzendata/warp10-platform/blob/8e83f966c939e4b58b9eb11cd86c396394a8e7f7/warp10/src/main/java/io/warp10/warp/sdk/WarpScriptExtension.java). A WarpScript extension class must have a public parameter less constructor so the extension can be registered.

If a function pushes onto the stack a custom Java object, the given object must implement the [Snapshotable](https://github.com/cityzendata/warp10-platform/blob/master/warp10/src/main/java/io/warp10/script/functions/SNAPSHOT.java) interface so if such an object appears in a macro or on the stack the stack or macro can still be snapshotted.

## Getting started

First of all, create a new Gradle project in your favorite IDE and add a new package in src/main/java: io.warp10.tutorial.

Then create the class HELLOWARP10 that extends `NamedWarpScriptFunction` and implements `WarpScriptStackFunction`.

Create also a class called TutorialExtension that extends `WarpScriptExtension`. 

Use the same build.gradle than for an UDF, available [here]({{ site.baseurl }}/assets/data/build.gradle). Just change it's title in manifest of the shadowJar task. 

## Develop a WarpScript function -- HELLOWARP10

Inside the class HELLOWARP10, add a contructor to set the name of the function. This name will be used to call this function in a WarpScript script.

```
public HELLOWARP10(String name) {
    super(name);
}
```

Then implement the necessary function apply. This function as the same functionnality of the one defined in the UDF tutorial, except that the stack is directly given to the function.

```
public Object apply(WarpScriptStack stack) throws WarpScriptException {
  
  //
  // Get params
  //
  
  Object firstText = stack.pop();
  Object secondText = stack.pop();
  
  if (!(firstText instanceof String)) {
    throw new WarpScriptException("First param must be a String");
  }
  if (!(secondText instanceof String)) {
    throw new WarpScriptException("Second param must be a String");
  }
  try {
    stack.push(firstText.toString() + ' ' + secondText.toString());
  } catch (WarpScriptException e) {
    // TODO Auto-generated catch block
    e.printStackTrace();
    throw new WarpScriptException("Stack exception" + e.getMessage() + e.getStackTrace().toString());
  }
  
  return stack;  
}
```

## The extension class -- TutorialExtension

In the class TutorialExtension, only the method getFunctions needs to be overwritten. In this method the user just has to declare the set of functions to add when using this defined extension. The functions have to be declared inside a Map, the map key is the function name, and the value an instance of the actual function class. If you wish to remove a function from WarpScript, use `null` as the value associated with the function name.

```
private final Map<String,Object> functions;

public TutorialExtension() {
  this.functions = new HashMap<String, Object>();
  functions.put("HELLOWARP10", new HELLOWARP10("HELLOWARP10"));
}

public Map<String, Object> getFunctions() {
  return functions;
}
```

## Add this extension in a Warp10 platform

Build this project executing the following command.

```
gradle shadowJar
```

Then add the `warpscript.extensions properties` in your platform configuration file.

```
//
// Comma separated list of WarpScriptExtension classes to instantiate to modify the defined WarpScript functions
//
warpscript.extensions = io.warp10.tutorial.TutorialExtension
```

Finally add the compiled jar in the classpath used to launch the Warp10 platform.

Restart the platform.

## Use the function defined in the extension

To execute it, simply run the following WarpScript on your Warp 10 backend.

```
'WARP 10' 'HELLO' HELLOWARP10
```

Congratulations, you managed to create your first WarpScript extension for Warp 10!
