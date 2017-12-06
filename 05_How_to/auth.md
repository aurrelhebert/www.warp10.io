---
title: Security and Access Control
layout: function
isPage: true
oldPath: 02-auth.html.md
category: howto
---


Since you will be storing valuable information into our platform it is our responsability to provide an environment you can trust. We have built our platform with security in mind since its inception, this page will describe the various concepts and mechanisms in place to ensure your data is safe with us.

## Access Control Concepts ##

Each user interacting with the Warp 10 Platform has a registered account. Registration is done using one of several authentication mechanisms, relying on external authentication providers (Google, Facebook, LinkedIn) or on specific credentials (login/password). We strongly encourage you to use an external provider which offers a two-step authentication process.

There are two kinds of accounts, simple *user* accounts, and *developer* accounts (which also act as *user* accounts). A user account is a container where data can be stored. The data stored in a user account is said to be *owned* by that user (the *owner*). A developer account can addionally act as a *producer* of data through *apps*. Every Geo Time Series on the Warp 10 Platform has an *owner* and a *producer* and belongs to an *app*.

Access control for updating and reading data is achieved through the use of cryptographic *tokens*.

## Tokens ##

All interactions with the platform which involve data rely on the use of *tokens* for authorization.

There are two basic types of tokens, *Write Tokens* for pushing data and *Read Tokens* for reading data.

Tokens are protected by a cryptographic envelope which ensures their integrity and authenticity.

Every token has an expiration date after which it can no longer be used. This allows to create short-lived tokens for performing specific manipulations.

### Write Tokens ###

Write Tokens are needed to push data onto the Warp 10 Platform. A Write Token bears the name of the app pushing the data (and hence the app the data will be part of), the id of the producer of the data and finally the id of the owner of the data. Any data pushed using a given Write Token will be associated with the account of the owner present in the token.

Optionally a Write Token can also force the values of a given set of labels.

### Read Tokens ###

Any access to stored data mandates the use of a Read Token.

All Read Tokens contain the following information:

* The name of the application *accessing* the data
* A list of applications whose data can be accessed (usually limited to a single application)
* A list of data owners whose data can be accessed (also usually limited to a single owner)
* A list of the data producers who pushed the data to be accessed (also usually limited to a single value)
* The id of the user billed for the data access

Optionally Read Tokens can also contain restrictions (such a the number of datapoints they can retrieve or the acceptable uses of the data) and post retrieval *hooks* which can enforce WarpScript code to be automatically executed on the data just after their retrieval (for example to blur or remove location or to change data resolution) and prior to their availability for further processing.

## Security ##

The Warp 10 Platform uses security measures at various levels to ensure your data is safe.

Metadata describing the Geo Time Series (their class name and labels) are only stored on disk encrypted using military grade AES with a 256 bits key.

Optionaly, individual datapoints can also be encrypted prior to being persisted.

Key management is usually the weak link of any system involving cryptography, we rely on an external system for storing the master keys of our applications, this system enforces strict authentication and access control measures at application launch time to let the application use its key.

Those different measures help us sleep well at night knowing that, even in the unlikely case of our hard drives being stolen, our customers' data and access credentials won't be at risk of being breached.
