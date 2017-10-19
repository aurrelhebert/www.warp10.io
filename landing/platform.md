## Platform components ##

Readings are pushed into the Warp 10 platform via a HTTP call to a component called *Ingress*. In the distributed 
version of the platform, the Ingress component can be instantiated multiple times to support very high ingestion rates.

Once data is dealt with by Ingress it is considered persisted by the Warp 10 storage layer called *Continuum* (for the 
spacetime continuum).

Warp 10 also offers streaming endpoints to push data using a WebSocket or to consume data as it enters the platform to 
build dynamic dashboards and integrate Warp 10 into a more elaborate stream processing workflow.

Security and privacy have also been addressed by Warp 10 since its very inception, this includes fine grain access 
control mechanisms, encryption capabilities and throttling management to enable full multi-tenancy of the platform.
