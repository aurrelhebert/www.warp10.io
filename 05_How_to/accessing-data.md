---
title: Accessing your data
layout: function
isPage: true
oldPath: 30-accessing-data.html.md.eco
category: howto
---


To retrieve and analyse data in the Continuum storage platform you use the [WarpScript data manipulation language]({{ site.baseurl }}/reference).

You can either send your WarpScripts directly to Cityzen Data API or use the Quantum requesting interface. This tutorial aims to teach you to use Quantum to make some simple manipulation of sample data in the platform.

## Quantum requesting interface ##
[Warp 10's Quantum]({{ site.baseurl }}/tools/quantum) is a web application aiming to allow users to interact with the platform in an user-friendly way, offering an alternative to command-line interaction.

> A standalone version of Quantum is packaged in the Docker image you have just installed, listening on the port 8081. In a Linux system (with binding between Warp 10 API address and the host) you can access Quantum at `127.0.0.1:8081`. In Mac OS or Windows, there is no binding between Warp 10 API address and the host, you need to replace 127.0.0.1 by the real Ip address of the container as explained in the precedent section.

Quantum has three main functions:

* WarpScript: allows to interactively write your WarpScript, send it to a Warp 10 platform, get the response and done some plotting of the resulting stack

  ![Quantum - WarpScript]({{ site.baseurl }}/img/getting-started/quantum-warpscript.png)

* Ingress: used to send data to the platform, as an alternative to the command-line

  ![Quantum - Ingress]({{ site.baseurl }}/img/getting-started/quantum-ingress.png)

* Delete: used to erase data from the platform, as an alternative to the command-line

  ![Quantum - Delete]({{ site.baseurl }}/img/getting-started/quantum-delete.png)


Quantum is done entirely as [https://www.polymer-project.org/](Polymer) elements, and that gives the application a lot of flexibility, it can be used as a full app but you can also take only the widget you need, as we have done with the headless embeddable version of Quantum's WarpScript widget that allows you to interactively try the examples on this doc.
