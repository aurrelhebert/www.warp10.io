---
title: "WarpScript and Processing"
layout: "function"
isPage: "true"
categoryTree: ["processing"]
category: "processing"
---

[Processing](http://processing.org/) is a language used in the context of visual arts, we thought it would be a great addition to WarpScript to create great visualization from the data you have manipulated. So we integrated a large set of Processing's own functions directly into WarpScript so you can build nice graphs right where the data resides.

The overall integration is done by creating WarpScript functions which mimic the behavior of their Processing counterpart. The WarpScript function is prefixed with the letter *P* (for Processing), the rest of its name is the name of the corresponding Processing function, so for example the Processing function `color` is `Pcolor` in WarpScript. The arguments of the functions have to be pushed on the stack in the order in which they appear in the signature of the Processing function. So continuing with our `color` example, the following Processing code:

    color(255, 204, 0);

would be expressed as follows in WarpScript:

    255 204 0 Pcolor

In addition to the parameters of the original Processing functions, their WarpScript equivalent needs an extra first parameter which is an instance of `PGraphics`. Processing functions integrated in WarpScript operate on this instance of PGraphics and will push it back on the stack before any result they may themselves produce.

An instance of PGraphics is obtained in the following way (note that for now WarpScript does not support a 3D renderer, so all PGraphics instance need to be 2D):

    width height '2D' PGraphics

Also note that Processing constants are specified as a String in WarpScript (*eg* `2D` becomes `'2D'`).

The WarpScript stack may limit the total number of pixels that the PGraphics instance may contain.

Once you are done manipulating a PGraphics instance, use ```Pencode``` to transform it into a *data* URI which can be displayed in a browser. Conversely, calling `Pdecode` on a *data* URI whith an `image/...` media type and a base64 encoding will produce an instance of *PImage* which can be passed as argument to the function `Pimage`.

The following Processing functions are supported. We mention the name of the WarpScript equivalent but redirect to the Processing reference documentation for each one.

<div class="row small-p">
<div class="col-sm-3">


### Structure

[PpopStyle](https://processing.org/reference/popStyle_.html)

[PpushStyle](https://processing.org/reference/pushStyle_.html)


### Shape

#### 2D Primitives

[Parc](https://processing.org/reference/arc_.html)

[Pellipse](https://processing.org/reference/ellipse_.html)

[Pline](https://processing.org/reference/line_.html)

[Ppoint](http://processing.org/reference/point_.html)

[Pquad](https://processing.org/reference/quad_.html)

[Prect](https://processing.org/reference/rect_.html)

[Ptriangle](https://processing.org/reference/triangle_.html)


#### Curves

[Pbezier](https://processing.org/reference/bezier_.html)

[PbezierDetail](https://processing.org/reference/bezierDetail_.html)

[PbezierPoint](https://processing.org/reference/bezierPoint_.html)

[PbezierTangent](https://processing.org/reference/bezierTangent_.html)

[Pcurve](https://processing.org/reference/curve_.html)

[PcurveDetail](https://processing.org/reference/curveDetail_.html)

[PcurvePoint](https://processing.org/reference/curvePoint_.html)

[PcurveTangent](https://processing.org/reference/curveTangent_.html)

[PcurveTightness](https://processing.org/reference/curveTightness_.html)


#### 3D Primitives

[Pbox](https://processing.org/reference/box_.html)

[Psphere](https://processing.org/reference/sphere_.html)

[PsphereDetail](https://processing.org/reference/sphereDetail_.html)


#### Attributes

[PellipseMode](https://processing.org/reference/ellipseMode_.html)

[PrectMode](https://processing.org/reference/rectMode_.html)

[PstrokeCap](https://processing.org/reference/strokeCap_.html)

[PstrokeJoin](https://processing.org/reference/strokeJoin_.html)

[PstrokeWeight](https://processing.org/reference/strokeWeight_.html)


#### Vertex

[PbeginContour](https://processing.org/reference/beginContour_.html)

[PbeginShape](https://processing.org/reference/beginShape_.html)

[PbezierVertex](https://processing.org/reference/bezierVertex_.html)

[PcurveVertex](https://processing.org/reference/curveVertex_.html)

[PendContour](https://processing.org/reference/endContour_.html)

[PendVertex](https://processing.org/reference/endVertex_.html)

[PquadraticVertex](https://processing.org/reference/quadraticVertex_.html)

[Pvertex](https://processing.org/reference/vertex_.html)


#### Loading &amp; Displaying

[PshapeMode](https://processing.org/reference/shapeMode_.html)



</div>
<div class="col-sm-3">

### Transform

[PpopMatrix](https://processing.org/reference/popMatrix_.html)

[PpushMatrix](https://processing.org/reference/pushMatrix_.html)

[PresetMatrix](https://processing.org/reference/resetMatrix_.html)

[Protate](https://processing.org/reference/rotate_.html)

[ProtateX](https://processing.org/reference/rotateX_.html)

[ProtateY](https://processing.org/reference/rotateY_.html)

[ProtateZ](https://processing.org/reference/rotateZ_.html)

[Pscale](https://processing.org/reference/scale_.html)

[PshearX](https://processing.org/reference/shearX_.html)

[PshearY](https://processing.org/reference/shearY_.html)

[Ptranslate](https://processing.org/reference/translate_.html)


### Color

#### Setting

[Pbackground](https://processing.org/reference/background_.html)

[Pclear](https://processing.org/reference/clear_.html)

[PcolorMode](https://processing.org/reference/colorMode_.html)

[Pfill](https://processing.org/reference/fill_.html)

[PnoFill](https://processing.org/reference/noFill_.html)

[PnoStroke](https://processing.org/reference/noStroke_.html)

[Pstroke](https://processing.org/reference/stroke_.html)


#### Creating &amp; Reading

[Palpha](https://processing.org/reference/alpha_.html)

[Pblue](https://processing.org/reference/blue_.html)

[Pbrightness](https://processing.org/reference/brightness_.html)

[Pcolor](https://processing.org/reference/color_.html)

[Pgreen](https://processing.org/reference/green_.html)

[Phue](https://processing.org/reference/hue_.html)

[PlerpColor](https://processing.org/reference/lerpColor_.html)

[Pred](https://processing.org/reference/red_.html)

[Psaturation](https://processing.org/reference/saturation_.html)


### Image

#### Loading &amp; Displaying

[Pimage](https://processing.org/reference/image_.html)

[PimageMode](https://processing.org/reference/imageMode_.html)

[PnoTint](https://processing.org/reference/noTint_.html)

[Ptint](https://processing.org/reference/tint_.html)


#### Pixels

[Pblend](https://processing.org/reference/blend_.html)

[Pcopy](https://processing.org/reference/copy_.html)

[Pfilter](https://processing.org/reference/filter_.html)

[Pget](https://processing.org/reference/get_.html)

[Ppixels](https://processing.org/reference/pixels_.html)

[Pset](https://processing.org/reference/set_.html)

[PupdatePixels](https://processing.org/reference/updatePixels_.html)

</div>
<div class="col-sm-3">

### Rendering

[PblendMode](https://processing.org/reference/blendMode_.html)

[Pclip](https://processing.org/reference/clip_.html)

[PnoClip](https://processing.org/reference/noClip_.html)


### Typography

#### Loading &amp; Displaying

[PcreateFont](https://processing.org/reference/createFont_.html)

[Ptext](https://processing.org/reference/text_.html)

[PtextFont](https://processing.org/reference/textFont_.html)


#### Attributes

[PtextAlign](https://processing.org/reference/textAlign_.html)

[PtextLeading](https://processing.org/reference/textLeading_.html)

[PtextMode](https://processing.org/reference/textMode_.html)

[PtextSize](https://processing.org/reference/textSize_.html)

[PtextWidth](https://processing.org/reference/textWidth_.html)


#### Metrics

[PtextAscent](https://processing.org/reference/textAscent_.html)

[PtextDescent](https://processing.org/reference/textDescent_.html)


### Math

#### Calculation

[Pconstain](https://processing.org/reference/constrain_.html)

[Pdist](https://processing.org/reference/dist_.html)

[Plerp](https://processing.org/reference/lerp_.html)

[Pmag](https://processing.org/reference/mag_.html)

[Pmap](https://processing.org/reference/map_.html)

[Pnorm](https://processing.org/reference/norm_.html)
