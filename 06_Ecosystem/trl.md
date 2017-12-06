---
title: 'Token revocation list'
layout: function
isPage: true
category: tools
categoryTree: ["trl"]
---

Token Revocation List (trl) are the only way for revoke tokens or application. 

## Activate TRL support

Uncomment *TRL (TOKEN REVOCATION LIST)* section in Warp 10 configuration file.

### TRL Path 

By default TRLs are located in the directory /opt/warp10-@VERSION@/etc/trl

### TRL Scan period

Changes inside TRL Path are scanned every 60000 ms by default. Warning, a file is read only once, even if the file is modified.

### Hard Startup

When you start Warp 10, no TRL is loaded yet. During this short time, a revoked token can be accepted.
The hard startup option mitigated this risk. When activated, if no TRL is loaded after the *warp.trl.soft.startup* delay, the token filter is locked.  
 
By default Hard Startup is set to false.   

## TRL filename

The trl filename *should* respect this pattern *\<name>.full.\<generation timestamp>-\<md5>.trl*

The md5 is not used for content integrity, but only the detect a content change between the current loaded trl and new trl. 

## TRL format

The trl have a simple text format. Even if it is not the most compact format, you can easily look if the token is revoke inside or not.
 
The file is formatted line per line. Each line should contains :

 * a token identifier
 * an application name (prefixed with the character '+')
 * a comment (prefixed with the character '#')
 
### Example:

```
# specific token revoked
fa1bbd91a96cc59e
# specific application revoked 
+app.revoked
```

Note: the *token identifier* if given with the token delivery.
 
 

