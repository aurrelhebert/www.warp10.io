---
title: Pushing data using the WebSocket interface
layout: function
isPage: true
oldPath: 21-websocket-push.html.md.eco
category: howto
---


The Warp platform offers an alternative to the standard [POST](pushing-data) interface for pushing data.

This alternate write path is based on HTML5 [WebSockets](https://en.wikipedia.org/wiki/WebSocket).

The WebSocket endpoint is `wss://API_ENDPOINT/api/vX/streamupdate`, where `API_ENDPOINT` is a [valid endpoint](../api/endpoints).

The WebSocket interface supports individual messages of up to 1000000 bytes. Each message is transmitted in a dedicated WebSocket frame.

## Valid WebSocket messages ##

### Token specification ###

```
   TOKEN <token>
```

This message sets the current write token for the WebSocket connection.

### Token reset ###

```
   CLEARTOKEN
```

This message resets the current write token. Any data update attempt will fail until `TOKEN <token>` is called first.

### No Operation ###

```
   NOOP
```

This message does nothing apart from keeping the connection alive.

### Error handling ###

```
   ONERROR MESSAGE|CLOSE
```

Sets the error handling mode. If 'MESSAGE' is specified, errors will generate a WebSocket message of the format `ERROR message` but will leave the connection open. If 'CLOSE' is specified, errors will throw an exception and will close the connection. The default error handling mode is 'CLOSE'.

### Data update ###

```
   TS/LAT:LON/ELEV class{labels} VALUE
   ...
```

This message pushes the given data using the current write token. The format of this message is the same as the one accepted by the [POST](pushing-data) endpoint.


## Responses ##

After successfull execution of one of the messages above, a response message with the following syntax is sent:

```
   OK <seqno> ...
```

Depending on the error handling mode set via `ONERROR`, a failed operation will either lead to an `ERROR ...` message or to an exception which will close the WebSocket.
