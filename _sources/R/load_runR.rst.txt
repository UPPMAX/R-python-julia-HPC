Load and run R
===================

At both UPPMAX and HPC2N we call the applications available via the module system modules. 
    - https://www.uppmax.uu.se/resources/software/module-system/ 
    - https://www.hpc2n.umu.se/documentation/environment/lmod 

   
.. objectives:: 

   - Show how to load R
   - Show how to run R scripts and start R on the command line

.. admonition:: Short cheat sheet
    :class: dropdown 
    
    - See which modules exists: ``module spider`` or ``ml spider``
    - Find module versions for a particular software: ``module spider <software>``
    - Modules depending only on what is currently loaded: ``module avail`` or ``ml av``
    - See which modules are currently loaded: ``module list`` or ``ml``
    - Load a module: ``module load <module>/<version>`` or ``ml <module>/<version>``
    - Unload a module: ``module unload <module>/<version>`` or ``ml -<module>/<version>``
    - More information about a module: ``module show <module>/<version>`` or ``ml show <module>/<version>``
    - Unload all modules except the 'sticky' modules: ``module purge`` or ``ml purge``
    
.. warning::
   Note that the module systems at UPPMAX and HPC2 are slightly different. While all modules at UPPMAX not directly related to bio-informatics are shown by ``ml avail``, most modules at HPC2N are hidden until one has loaded a prerequisite like the compiler ``GCC``.


- For reproducibility reasons, you should always load a specific version of a module instead of just the default version
- Many modules have prerequisite modules which needs to be loaded first (at HPC2N this is also the case for the R modules). When doing ``module spider <module>/<version>`` you will get a list of which other modules needs to be loaded first


Check for R versions
-------------------------


.. tabs::

   .. tab:: UPPMAX

     Check all available R versions with:

      .. code-block:: sh
 
           $ module spider R

     OR

      .. code-block:: sh

           $ module avail R
 
     Note that the latter option also lists other software modules matching the string "R". 


   .. tab:: HPC2N
   
      Check all available version R versions with:

      .. code-block:: sh
 
         $ module spider R
      
      To see how to load a specific version of R, including the prerequisites, do 

      .. code-block:: sh
   
         $ module spider R/<version>

      Example for R 4.0.4 (recommended version)

      .. code-block:: sh

         $ module spider R/4.0.4 

.. admonition:: Output at UPPMAX as of January 24 2023
   :class: dropdown
    
       .. code-block::  tcl
    
          [bbrydsoe@rackham3 bbrydsoe]$ module spider  R

          ----------------------------------------------------------------------------
          R:
          ----------------------------------------------------------------------------
             Versions:
                R/3.0.2
                R/3.2.3
                R/3.3.2
                R/3.4.0
                R/3.4.3
                R/3.5.0
                R/3.5.2
                R/3.6.0-foss-2019a
                R/3.6.0
                R/3.6.1
                R/4.0.0
                R/4.0.4
                R/4.1.1
                R/4.2.1
             Other possible modules matches:
                454-dataprocessing  ADMIXTURE  ANTLR  ARCS  ARC_assembler  ARPACK-NG  ..
          .
          ----------------------------------------------------------------------------
            To find other possible module matches execute:
            
                $ module -r spider '.*R.*'

          ----------------------------------------------------------------------------
            For detailed information about a specific "R" package (including how to load the modules) use the module's full name.
            Note that names that have a trailing (E) are extensions provided by other modules.
            For example:
            
               $ module spider R/4.2.1
          ----------------------------------------------------------------------------


.. admonition:: Output at HPC2N as of 20 January 2023
    :class: dropdown

        .. code-block:: tcl

           b-an01 [~]$ module spider R

           -----------------------------------------------------------------------------------------------------------------------------------------------
           R:
           -----------------------------------------------------------------------------------------------------------------------------------------------
             Description:
               R is a free software environment for statistical computing and graphics.
               
              Versions:
                 R/4.0.0
                 R/4.0.4
                 R/4.1.0
                 R/4.1.2
              Other possible modules matches:
                 AMPtorch  Amber  Armadillo  Arrow  Bader  BerkeleyGW  BioPerl  Brotli  CUDAcore  ChimeraX  CloudCompare  CubeWriter  DendroPy  ESPResSo  ...
                    
           -----------------------------------------------------------------------------------------------------------------------------------------------
             To find other possible module matches execute:
             
                 $ module -r spider '.*R.*'
                 
           -----------------------------------------------------------------------------------------------------------------------------------------------
             For detailed information about a specific "R" package (including how to load the modules) use the module's full name.
             Note that names that have a trailing (E) are extensions provided by other modules.
             For example:
             
                $ module spider R/4.1.2
           -----------------------------------------------------------------------------------------------------------------------------------------------


Load an R module
--------------------

For reproducibility, we recommend ALWAYS loading a specific module instad of using the default version! 

For this course, we recommend using R 4.0.4

.. tabs::

   .. tab:: UPPMAX
   
      Go back and check which R modules were available. To load version 4.0.4, do:

      .. code-block:: sh

        $ module load R/4.0.4
        
      For short, you can also use: 

      .. code-block:: sh

         $ ml R/4.0.4

 
   .. tab:: HPC2N

 
      .. code-block:: sh

         $ module load GCC/10.2.0  OpenMPI/4.0.5  R/4.0.4
      
         (or 'module load GCC/10.2.0  CUDA/11.1.1  OpenMPI/4.0.5  R/4.0.4' if you need CUDA)

      For short, you can also use: 

      .. code-block:: sh

         $ ml GCC/10.2.0  OpenMPI/4.0.5  R/4.0.4

.. warning::

   + UPPMAX: Don’t use system-installed R/3.6.0
   + HPC2N: No system installed R 
   + ALWAYS use R module


Run
---

Run R from command line 
#######################

After loading the R module (and its prerequisites), you start R like this (Kebnekaise, R/4.0.4): 

  .. code-block:: sh

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
     
     > 
     
     
Run R script
#####################
    
You can run an R script in the shell like this:

.. code-block:: sh

   $ Rscript example.R

NOTE: *only* run jobs that are short and/or do not use a lot of resources from the command line. Otherwise ALWAYS use the batch system!
    
More information will follow on running R from within a **batch job**. 

Exit R with q() in the R prompt. Decide if you want to save your workspace image or not. 

Here is an example of running a short, serial R program at Kebnekaise: 

  .. admonition:: Serial R program (add2.R) to add two arguments
      :class: dropdown

          .. code-block:: tcl
        
         
             args <- commandArgs(trailingOnly = TRUE)
             num1 <- as.numeric(args[1])
             num2 <- as.numeric(args[2])
            
             answer <- num1 + num2
             cat("Sum of arguments is: ", answer)
             cat("\n")
           
           
  .. code-block:: sh

    b-an01 [~]$ Rscript add2.R 3 4
    Sum of arguments is:  7
    b-an01 [~]$

.. admonition:: Workflow

   In addition to loading R, you will also often need to (install and) use own-installed R packages. The work-flow would be something like this: 
    
   1) Load R and prerequisites: ``module load <pre-reqs> R/<version>``
   2) Check which extensions your R version has. They are generally listed under "Extensions" when you do: 
   
      - ``module spider R/<version>``. 
      - Otherwise, you can do ``installed.packages()`` from within R. 
      - NOTE that the latter option generates a LOT of output, but also gives versions of the R packages (Extensions, as they are called by the module system). 
      
   3) Install any extra R packages you need (optional): 
    
      - Automatical download and install: ``R --quiet --no-save --no-restore -e "install.packages('<r-package>', repos='http://ftp.acc.umu.se/mirror/CRAN/')"`` 
      - Manual download and install: ``R CMD INSTALL -l <path-to-R-package>/R-package.tar.gz``
    
   4) 
    
      - Start R: ``R``
      - run ``Rscript <program.R>``
      - batch job for R program: ``sbatch <my-R-batch-job.sh>``

   - Installed R packages can be accessed within R with ``library("package")`` as usual. 

   - The command ``installed.packages()`` given within R will list the available packages to import. 

   - More about installing your own R packages to follow in later sections of the course! 


.. keypoints::

   - Before you can run R scripts or work in an R shell, first load an R module and any needed prerequisites. 
   - Start an R shell session with ``R``.
   - Run scripts with ``Rscript <script.R>``
    

Exercises
---------

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
    
    .. code-block:: sh
    
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
      
