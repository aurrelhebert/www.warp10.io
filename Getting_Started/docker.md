---
title: "Docker"
layout: "function"
isPage: "true"
link: "/docker"
categoryTree: ["getting-started"]
category: "getting-started"
---


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

### For Windows users

First, you have to install [Docker](https://docs.docker.com/docker-for-windows/install/#start-docker-for-windows)
and optionally [Kitematic](https://kitematic.com/).

 
```bash
docker run --volume=c:\\warp10:/data -p 8080:8080 -p 8081:8081 -d -i warp10io/warp10:1.0.7
```