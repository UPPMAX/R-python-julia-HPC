Exercises
=========

Load and run
############

.. challenge:: Try yourself to load R, start it, check libraries, load a library, quit R
    
    .. code-block:: R
    
        1) Load R version 4.0.4 
        2) Start R. Check which libraries are installed. Load one of them.
        3) Quit R
	
    Remember to check if a module you are loading has prerequisites, and load those first if it does. In this case it depends on whether you do the exercises on Kebnekaise or Rackham. 



.. solution:: Solution

   .. tabs:: 

      .. tab:: UPPMAX
 
            This is for Rackham.
          
            .. code-block:: sh
	    
	       [bbrydsoe@rackham3 bbrydsoe]$ ml spider R/4.0.4
	    
  	       ----------------------------------------------------------------------------
	         R: R/4.0.4
	       ----------------------------------------------------------------------------
	     
	            This module can be loaded directly: module load R/4.0.4
		 
		    Help:
		        R - use R Version 4.0.4
		     
		        https://www.r-project.org
		     
		      Many, many R and Bioconductor packages are available in the module 
		      'R_packages/4.0.4'

	       [bbrydsoe@rackham3 bbrydsoe]$ module load R/4.0.4
	       Nearly all CRAN and BioConductor packages are installed and available by
   	       loading the module R_packages/4.0.4 
	       [bbrydsoe@rackham3 bbrydsoe]$
	    
	       [bbrydsoe@rackham3 bbrydsoe]$ R

               R version 4.0.4 (2021-02-15) -- "Lost Library Book"
	       Copyright (C) 2021 The R Foundation for Statistical Computing
	       Platform: x86_64-pc-linux-gnu (64-bit)
	    
	       R is free software and comes with ABSOLUTELY NO WARRANTY.
	       You are welcome to redistribute it under certain conditions.
	       Type 'license()' or 'licence()' for distribution details.
	    
	         Natural language support but running in an English locale
	      
	       R is a collaborative project with many contributors.
	       Type 'contributors()' for more information and
	       'citation()' on how to cite R or R packages in publications.
	    
	       Type 'demo()' for some demos, 'help()' for on-line help, or
	       'help.start()' for an HTML browser interface to help.
	       Type 'q()' to quit R.
	    
	       > installed.packages()
                          Package      LibPath
               base       "base"       "/sw/apps/R/x86_64/4.0.4/rackham/lib64/R/library"
	       boot       "boot"       "/sw/apps/R/x86_64/4.0.4/rackham/lib64/R/library"
	       class      "class"      "/sw/apps/R/x86_64/4.0.4/rackham/lib64/R/library"
	       cluster    "cluster"    "/sw/apps/R/x86_64/4.0.4/rackham/lib64/R/library"
	       codetools  "codetools"  "/sw/apps/R/x86_64/4.0.4/rackham/lib64/R/library"
	       compiler   "compiler"   "/sw/apps/R/x86_64/4.0.4/rackham/lib64/R/library"
	       datasets   "datasets"   "/sw/apps/R/x86_64/4.0.4/rackham/lib64/R/library"
	       foreign    "foreign"    "/sw/apps/R/x86_64/4.0.4/rackham/lib64/R/library"
	       graphics   "graphics"   "/sw/apps/R/x86_64/4.0.4/rackham/lib64/R/library"
	       grDevices  "grDevices"  "/sw/apps/R/x86_64/4.0.4/rackham/lib64/R/library"
	       grid       "grid"       "/sw/apps/R/x86_64/4.0.4/rackham/lib64/R/library"
	       KernSmooth "KernSmooth" "/sw/apps/R/x86_64/4.0.4/rackham/lib64/R/library"
	       lattice    "lattice"    "/sw/apps/R/x86_64/4.0.4/rackham/lib64/R/library"
	       MASS       "MASS"       "/sw/apps/R/x86_64/4.0.4/rackham/lib64/R/library"
	       Matrix     "Matrix"     "/sw/apps/R/x86_64/4.0.4/rackham/lib64/R/library"
	       ...
	    
	       > library("parallel")
	       > quit()
	       Save workspace image? [y/n/c]: 
	    

            The list of installed packages is very long, as you will see for yourself. 
	 
	     
      .. tab:: HPC2N
   
            This is for Kebnekaise.
          
            .. code-block:: sh
	    
	       b-an01 [~]$ ml spider R/4.0.4

               ----------------------------------------------------------------------------
	         R: R/4.0.4
	       ----------------------------------------------------------------------------
	           Description:
		     R is a free software environment for statistical computing and
		     graphics.
		     
		     
		   You will need to load all module(s) on any one of the lines below before 
		   the "R/4.0.4" module is available to load.
		   
		     GCC/10.2.0  CUDA/11.1.1  OpenMPI/4.0.5
		     GCC/10.2.0  OpenMPI/4.0.5
		     
	           This module provides the following extensions:

                      abc.data/1.0 (E), abc/2.1 (E), abe/3.0.1 (E), abind/1.4-5 (E), acepack/1.4.1 (E), 
		      adabag/4.2 (E), ade4/1.7-16 (E), ADGofTest/0.3 (E), aggregation/1.0.1 (E), 
		      AICcmodavg/2.3-1 (E), akima/0.6-2.1 (E), AlgDesign/1.2.0 (E), AnalyzeFMRI/1.1-23 (E), 
		      animation/2.6 (E), aod/1.3.1 (E), ape/5.4-1 (E), argparse/2.0.3 (E), arm/1.11-2 (E), 
		      askpass/1.1 (E), asnipe/1.1.15 (E), assertive.base/0.0-9 (E), assertive.code/0.0-3 (E), 
		      assertive.data.uk/0.0-2 (E), assertive.data.us/0.0-2 (E), assertive.data/0.0-3 (E),
		      assertive.datetimes/0.0-3 (E), assertive.files/0.0-2 (E), assertive.matrices/0.0-2 (E), 
		      assertive.models/0.0-2 (E), assertive.numbers/0.0-2 (E), assertive.properties/0.0-4 (E), 
		      assertive.reflection/0.0-5 (E), assertive.sets/0.0-3 (E), assertive.strings/0.0-3 (E), 
		      assertive.types/0.0-3 (E), assertive/0.3-6 (E), assertthat/0.2.1 (E), AUC/0.3.0 (E), 
		      ...
		      
		      b-an01 [~]$ module load GCC/10.2.0  OpenMPI/4.0.5 R/4.0.4
		      b-an01 [~]$ R
		      
		      R version 4.0.4 (2021-02-15) -- "Lost Library Book"
		      Copyright (C) 2021 The R Foundation for Statistical Computing
		      Platform: x86_64-pc-linux-gnu (64-bit)
		      
		      R is free software and comes with ABSOLUTELY NO WARRANTY.
		      You are welcome to redistribute it under certain conditions.
		      Type 'license()' or 'licence()' for distribution details.
		      
		        Natural language support but running in an English locale
			
		      R is a collaborative project with many contributors.
		      Type 'contributors()' for more information and
		      'citation()' on how to cite R or R packages in publications.
		      
		      Type 'demo()' for some demos, 'help()' for on-line help, or
		      'help.start()' for an HTML browser interface to help.
		      Type 'q()' to quit R.
		      
		      > installed.packages()
		      ... 
		      
		      > library("parallel")
		      > quit()
		      Save workspace image? [y/n/c]: 

         
	    As you can see above, the main differences here compared to Rackham is that you need to load some prerequisites before you can load R and that doing ``ml spider R/<version>`` will give you a long list of "extensions" which is what the module system calls the system installed R packages. 
 	    

.. challenge:: Load R and run a short R script from the command line
    
   1) Load R version 4.0.4 (if you have not done so already)
   2) Run the small R script called ``hello.R``, using ``Rscript``
	
   Remember to check if a module you are loading has prerequisites, and load those first if it does. In this case it depends on whether you do the exercises on Kebnekaise or Rackham. 

.. admonition:: "hello.R" (it can also be found under "R" in the "Exercises" directory on the course GitHub repository (https://github.com/UPPMAX/R-python-julia-HPC). 

   .. code-block:: R
   
      message <-"Hello World!"
      print(message) 


.. solution:: Solution

   .. tabs:: 

      .. tab:: UPPMAX
 
            This is for Rackham.
          
            .. code-block:: sh
	    
	       [bbrydsoe@rackham2 bbrydsoe]$ Rscript hello.R
	       [1] "Hello World!"
	       [bbrydsoe@rackham2 bbrydsoe]$

      .. tab:: HPC2N
 
            This is for Kebnekaise. 
          
            .. code-block:: sh
	    
	       b-an01 [~]$ Rscript hello.R
	       [1] "Hello World!"
	       b-an01 [~]$ 

	    
      As you can see, it is working the same. 
      


Packages
########

.. challenge:: Install a package with automatic download

   1) First do the setup of .Renviron and create the directory for installing R
   packages. Remember to load any modules you need.
   
   2) Install a package from the command line. Suggestion: the package "anomalize"
   
   3) Install a package from inside R. Suggestion: the package "tidyr"
   
   4) Start R and see if the library can be loaded. 
   
   These are both on CRAN, and this way any dependencies will be installed as
   well. 
   
   Remember to pick a repo that is nearby, to install from:
   https://cran.r-project.org/mirrors.html 


.. solution:: Solution

   .. tabs:: 

      .. tab:: Setup
      
            .. code-block:: sh
	 
               [bbrydsoe@rackham3 bbrydsoe]$ echo R_LIBS_USER=\"$HOME/R-packages-%V\" > ~/.Renviron R_LIBS_USER="/home/bbrydsoe/R-packages-%V"
               [bbrydsoe@rackham3 bbrydsoe]$ mkdir -p $HOME/R-packages-4.0.4
	    

      .. tab:: Command line
      
            Installing package "anomalize". Using the repo http://ftp.acc.umu.se/mirror/CRAN/
         
            .. code-block:: sh
	 
	           [bbrydsoe@rackham3 bbrydsoe]$ R --quiet --no-save --no-restore -e "install.packages('anomalize', repo='http://ftp.acc.umu.se/mirror/CRAN/')"
           
           
           This assumes you have already loaded the R module. If not, then do so first. 
	 
      .. tab:: Inside R
      
            Installing package "tidyr". Using the repo http://ftp.acc.umu.se/mirror/CRAN/

            .. code-block:: R 

               > install.packages('tidyr', repo='http://ftp.acc.umu.se/mirror/CRAN/')	     
	     
      .. tab:: Load library

            .. code-block:: R
	 
  	       [bbrydsoe@rackham3 bbrydsoe]$ R
               > library("anomalize")
               > library("tidyr")
	    
 	        "anomalize" outputs some text/advertisment when loaded. You can ignore this. 


Batch mode
##########

.. challenge:: Serial batch script for R

   Run the serial batch script shown in the session "Running R in batch mode", but for the add2.R code (see the `Exercise/R directory on GitHub <https://github.com/UPPMAX/R-python-julia-HPC/blob/main/Exercises/R/add2.R>`_). Remember the arguments.
    
.. solution:: Solution for UPPMAX
    :class: dropdown
    
          Serial script on Rackham  
          
          .. code-block:: sh
 
             #!/bin/bash
             #SBATCH -A naiss2023-22-44 # Change to your own after the course
             #SBATCH --time=00:10:00 # Asking for 10 minutes
             #SBATCH -n 1 # Asking for 1 core
             
             # Load any modules you need, here for R/4.0.4
             module load R/4.0.4
             
             # Run your R script 
             R --no-save --quiet < add2.R 2 3 


.. solution:: Solution for HPC2N
    :class: dropdown
    
          Serial script on Kebnekaise 
          
          .. code-block:: sh
 
             #!/bin/bash
             #SBATCH -A hpc2nXXXX-YYY # Change to your own project ID
             #SBATCH --time=00:10:00 # Asking for 10 minutes
             #SBATCH -n 1 # Asking for 1 core
             
             # Load any modules you need, here for R/4.0.4
             module load R/4.0.4
             
             # Run your R script 
             R --no-save --quiet < add2.R 2 3 




.. challenge:: Parallel job run

   Try running the parallel example with "foreach" from the session "Running R in batch mode". 


.. challenge:: R for ML

   Run the ML example shown in the session "Running R in batch mode". 

