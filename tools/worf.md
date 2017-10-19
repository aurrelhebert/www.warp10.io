---
title: 'Worf: Warp10 token tool'
layout: function
isPage: true
category: tools
categoryTree: ["worf"]
---

Warp10 entry points are based on bearer token authentication. 
Tokens are protected by a cryptographic envelope which ensures their integrity and authenticity. They are never stored in the Warp10 instance.

### Token properties  

All properties bellow are mandatory for deliver tokens. Learn more about the Access Control System [here]({{ site.baseurl }}/introduction/concepts) 

#### Token type

There are two basic types of tokens, write tokens for pushing data and read tokens for reading data.

> Format : String
  Value : read or write

#### Application name (String)

Application provides a logical isolation of your data.    
Remember, the application name is encoded inside the token, keep it short.

> Format : String


#### Producer

The producer have the responsibility of writing data on the platform for an application. Generally he is the application manager.

> Format : UUID

#### Owner

The owner is the data proprietary. This concept is useful for building data privacy system. In most cases, owner and producer are the same.

> Format : UUID

#### TTL (time to live)

Every token has an expiration date after which it can no longer be used. This allows to create short-lived tokens for performing specific manipulations,
or also long-lived tokens for embed it inside into devices.

> Format : Long (milliseconds)

## Worf User Guide

Worf is the security chief of the USS Enterprise (NCC-1701-D)

It can also generate read/write Warp10s tokens.

### Prerequisites

JVM 1.7 or upper
Warp10 full Jar
Warp10 configuration file

### Start
Launch Worf with this command line.

    java -cp warp-full-<revision name>.jar io.warp10.worf.Worf  -i <path to Warp10 configuration file>

Worf loads the warp10 configuration file and extracts hash and AES keys necessary for token delivery
Use <Tab> for the complete list of commands.
Use <Up or Down> for the commands history.

Two mode are available 

 * interactive mode ( -i), prompts the user on the command line
 * scripting mode (default), all parameters should be set on the command line.

### Generate Configuration from standalone template

    java -cp warp-full-<revision name>.jar io.warp10.worf.Worf  -i <path to Warp10 configuration template> 
    
Worf loads the warp10 standalone template, generates hash and AES keys, writes it by default at the same path.      

### Save defaults (uuid, application name)
 
If you generate a configuration file and tokens in the same command (io.warp10.worf.Worf  -t  -a <name> -ttl 10000000 -puidg <template>) 
Worf can save a default configuration (.<configurationFile>.worf) at the same path. It contains:
 * the producer uuid
 * the owner uuid
 * the application name
 
These values are taken by default, with the interactive or scripting mode.  

### Encode token

You can encode tokens with <encodeToken> command or -t option. You have to enter this following fields:

1. token type (read or write)
2. application name
3. producer UUID
4. owner UUID (enter for use producer UUID as Owner)
5. time to live (in milliseconds)
6. encode or cancel

You will have the following output

    token=oUKQCEBFEFdhHkgllX1Bimlg3gpi53pg2YZZ5qYfmUdm2yomtFMG91m73mSe5DpbQcEnDaH0B_OvFvsx3c9_7_ujWM8oap.Al6nsWYUZcXHIfZ6yt9pY5.
    tokenIdent=a25b04e4882dbf1f
    application name=test.application.name
    producer & owner=4430fb04-ba03-11e5-ae25-535a84589344 & 4430fb04-ba03-11e5-ae25-535a84589344
    ttl=120000000

You can use this token immediately on fetch, update or delete endpoints.
The token identifier can be used for revoke this token by adding it inside a trl (token revocation list)

### Decode token

You can decode and print token properties (only available in interactive mode). You also can convert write tokens into read token with strictly the same properties (validity, application, owner & producer uuids).     

### Quit

No command history is stored by Worf.
