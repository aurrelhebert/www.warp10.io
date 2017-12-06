---
title: Concepts
layout: function
isPage: true
category: introduction
---

## Data Structure ##

The Warp 10 platform handles a single type of data called Geo Time Series&reg; or GTS for short. A GTS is obtained by merging a time series of measurements, a sequence of timestamp/value pairs, with the three time series of the sensor location (latitude, longitude, elevation), at time of the measurement. This handy data structure allows for efficient manipulation of moving sensor measurements. Don't worry if you do not have location information for your sensors, Warp 10 also support plain old time series.

In order to support the most diverse set of use cases, values of GTS can be of four types, long, double, boolean or UTF-8 string. You can mix value types in a single GTS, it will be handled at read time when you manipulate the data with the WarpScript language.

Each Geo Time Series is uniquely identified by a class and a set of labels (key/values). The class can be interpreted as the type of sensor, and the labels as uniquely identifying a specific instance in the class. GTS can also have attributes which are another set of key/values, the only difference with labels is that attributes do not identify the GTS, they are simply there to provide additional information, and since they do not identify the GTS they can be modified during the lifetime of the Geo Time Series.

For maximum flexibility, classes and label names and values can be any valid UTF-8 string. If your strings contain characters which are difficult to type, you only have to URL encode your strings using %hh to replace those hard to type characters.

## Access Control Concepts ##

The Warp 10 platform does provides bases bricks for integrate it into your authentication system. Access control for updating and reading data is achieved through the use of cryptographic *tokens*.
Tokens are delivered with the command line tool *Worf*. Roles ( *owner*, *producer* and *application*) are used to define the right level of data access.   

### Data Producer ###

The data producer is identified by an UUID. He have the responsibility of pushing data onto the Warp 10 platform with a *write token*

### Data Owner ###

Data stored onto Warp 10 platform belongs to an UUID. It can be the same as the producer UUID or not.

### Application ###

Application is a logical container for a Geo Time Series, commonly applications belongs to one *producer*.
Eventually, several producer can push data for one application name.
Application is identified by any valid UTF-8 string *name*. 

Keep in mind, An *application* name is unique on one Warp10 cluster (standalone or dist).  

### Examples ###

With this following users
 
 * *Owner* 1: 151de7ae-835b-4d76-b41f-4b77532097cc
 * *Producer*: 78bdb94b-2293-4b95-a0df-70959214cfe3
 * *Application*: app.example.name


Write token(78bdb94b-2293-4b95-a0df-70959214cfe3,151de7ae-835b-4d76-b41f-4b77532097cc,app.example.name)
 
 * Writes GTS inside the application *app.example.name* for the owner 1 *151de7ae-835b-4d76-b41f-4b77532097cc* by the producer *78bdb94b-2293-4b95-a0df-70959214cfe3*   

Read token(78bdb94b-2293-4b95-a0df-70959214cfe3,151de7ae-835b-4d76-b41f-4b77532097cc,app.example.name)

 * The Owner 1 *151de7ae-835b-4d76-b41f-4b77532097cc* can read all GTS of the application *app.example.name* written by *78bdb94b-2293-4b95-a0df-70959214cfe3*  

Write token(78bdb94b-2293-4b95-a0df-70959214cfe3,78bdb94b-2293-4b95-a0df-70959214cfe3,app.example.name)
 
 * Writes GTS inside the application *app.example.name* for and by the producer *78bdb94b-2293-4b95-a0df-70959214cfe3*
 * This token is also used as *application token* for delete GTS' contained by the application.
 
Read token(78bdb94b-2293-4b95-a0df-70959214cfe3,78bdb94b-2293-4b95-a0df-70959214cfe3,app.example.name)

 * The Producer *78bdb94b-2293-4b95-a0df-70959214cfe3* can read all GTS of the application *app.example.name* stored for himself.

## Tokens ##

All interactions with the platform which involve data rely on the use of *tokens* for authorization.

There are two basic types of tokens, *Write Tokens* for pushing data and *Read Tokens* for reading data.

Tokens are protected by a cryptographic envelope which ensures their integrity and authenticity.

Every token has an expiration date after which it can no longer be used. This allows to create short-lived tokens for performing specific manipulations.

### Read token ###

Any access to stored data mandates the use of a Read Token.

All Read Tokens contain the following information:

* The name of the application *accessing* the data
* A list of applications whose data can be accessed (usually limited to a single application)
* A list of data owners whose data can be accessed (also usually limited to a single owner)
* A list of the data producers who pushed the data to be accessed (also usually limited to a single value)

### Write token ###

Write Tokens are needed to push data onto the Warp 10 Platform. A Write Token bears the name of the app pushing the data (and hence the app the data will be part of), the id of the producer of the data and finally the id of the owner of the data.

Data are always write by one producer for one owner within one application



