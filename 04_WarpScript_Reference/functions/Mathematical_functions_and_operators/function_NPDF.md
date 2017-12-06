---
title: "NPDF"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Parametrable function to create NDPF (Normal Distribution Probability Density Functions)"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","9150-function_NPDF.html.md"]
category: "reference"
---
 

The `NPDF` command is a parametrable function, i.e. a function that gets some parameters when built and the result for a given input is dependant of those parameters. 

*NPDF* stands for Normal (Gaussian) distribution Probability Density Function, it's a family of functions whose parameters are the mean (*mu*) and the standard deviation (*sigma*)  The `NPDF` command allows to create a NPDF function with a given *mu* and *sigma*, *N<sub>mu, sigma</sub>* and then this function can be applied to a numeric input *x* to get the result *N<sub>mu, sigma</sub>(x)*.



The usual way of using `NPDF` is to create an instance of *NPDF* with the good values of *mu* and *sigma* (*N<sub>mu, sigma</sub>* ), storing it in a variable and calling it using [`EVAL`]({{ site.baseurl}}/reference/functions/function_EVAL). 

To generate the *N<sub>mu, sigma</sub>* instance you need to put onto the stack the two parameters *mu* and *sigma* and call `NPDF`.
Then you store it in a variable using [`STORE`]({{ site.baseurl}}/reference/functions/function_STORE). 

To calculate the value *N<sub>mu, sigma</sub>(x)* for a given *x*, you put *x* onto the stack, then the variable and then call `EVAL`.



## Example ##

WarpScript commands:

    0.0 1.0 NPDF    // Creating a NPDF with mu=0 and sigma=1
    'normal' STORE  // And storing it in $normal
    0.75            // The value to calculate its normal
    $normal EVAL

Stack: 

    TOP: 0.30113743215480443


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">0.0 1.0 NPDF    // Creating a NPDF with mu=0 and sigma=1
'normal' STORE  // And storing it in $normal
0.75            // The value to calculate its normal
$normal EVAL
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">44 2 -0.0 1.0 NPDF    // Creating a NPDF with mu=0 and sigma=1
'normal' STORE  // And storing it in $normal
0.75            // The value to calculate its normal
$normal EVAL
0.30113743215480443 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
