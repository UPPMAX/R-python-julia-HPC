Packages
========

[RB: All my feedback is added like this: between square brackets
and starting with ``RB:``.

Feel free to ignore all this. The goal is to make one consider or
reconsider, not bluntly accepting other's (potentially worse!) ideas.

I enjoy to see enthusiasm put into this chapter, with a large amount
and detailed information. It does match the teaching goal
'To understand the basics of an R package' when 'the basics' includings
reading 'Advanced R' and/or 'R packages' by Hadley Wickham.

I feel that these teaching goals,
however, are in the incorrect context to be achieved: the learners are not
ready for this yet. Instead, I suggest to let the learners first load
and use an R package. I feel this session, at this point in the day,
should be just that: load and run a pre-installed package.
This is what the learners need the rest of the day.
I understand the eagerness to ask 'But what if they want to use a package
that is not pre-installed?' and will answer with that we should first
focus on the majority; those that want to run the most-used and pre-installed
packages. I suggest to focus on getting the basics that are needed by all
uses practiced first and maybe doing the more specific not-done-by-all
things in an optional later session (note I don't think there should be
such a session).

A weakness in my feedback is that I do not know the Kebnekaise setup.
I've seen somewhere in the HPC2N doc that there is a Bioconductor package
with the 750 most used R packages, but it is missing from the main page
about R at https://www.hpc2n.umu.se/resources/software/r ...?

Again, feel free to ignore all this. The goal is to make one consider or
reconsider, not bluntly accepting other's (potentially worse!) ideas.]

.. admonition:: R packages

   - R packages is the main way of extending the functionality of R and
     **broadens the use of R** to almost infinity!
     [RB: I enjoy writing down why packages are important. 
     I feel 'R packages extend what R can do' is a more succint way of writing
     this] 

   - Instead of writing code yourself there may be others that have done the
     same!
     [RB: I enjoy writing down why packages are important. 
     I feel 'R packages alow to re-use code written by others'
     is a more succint way of writing
     this] 

   - Many **scientific tools** are distributed as **R packages**, making it
     possible to run a script in the prompt and there define files to be
     analysed and arguments defining exactly what to do.
     [RB: I enjoy writing down why packages are important. 
     I feel 'Most scientific tools are R packages'
     is a more succint way of writing this] 

   - For more details about packages and in particular developing your own,
     see: `R packages <https://r-pkgs.org>`_

.. questions::
   
   - What is an R package?
   - How do I find which packages and versions are available?
   - What to do if I need other packages?
   - Are there differences between HPC2N and UPPMAX?
   
.. objectives:: 

   - Understand the basics of what an R package is [RB: I think this objective
     is phrased broader than useful at this part of the course. I suggest
     to rewrite it more to 'Load and use an R package']
   - Show how to check for R packages [RB: I think the goal is that learners
     can check if an R package is installed, else we could just show a YouTube
     video. I suggest to rephrase to 'Check if an R package is installed']
   - show how to install own packages on the different clusters 
     [RB: I think the goal is that learners
     can install their own packages on the different clusters,
     else we could just show a YouTube video.
     I suggest to rephrase to 'Install a custom R package'.
     On the other hand, that goal seems to be too big in this point in time.
     I think a goal like 'Use a pre-installed R package' would fit better]


R packages: A short Primer
--------------------------

What is a package, really?
##########################

[RB: this feels way too detailed. The goal is how to use a package, not write
one. This level of detail does not help learners use a package. If one
desires this level of detail, in a first session,
let the learners use a package, in a later session, let the users
write a package]

An R package is essentially a contained folder and file structure containing R
code (and possibly C/C++ or other code) and other files relevant for the
package e.g. documentation(vignettes), licensing and configuration files. Let
us look at a very simple example 


.. code-block:: console

   $ git clone https://github.com/MatPiq/R_example.git

   $ cd R_example

   $ tree
   .
   ├── DESCRIPTION
   ├── NAMESPACE
   ├── R
   │   └── hello.R
   ├── man
   │   └── hello.Rd
   └── r_example.Rproj


.. admonition:: Installing tree as non-root on Linux Ubuntu
   :class: dropdown

      If you are on a Linux Ubuntu system where tree is not installed, and you do not have root permissions, you can do this to install it in your own area 

      1) Create a directory (in your home folder) to install in: 

      .. code-block: console 

         mkdir ~/mytree

      Change to that directory: 

      .. code-block:: console

         cd ~/mytree

      Now download tree: 

      .. code-block:: console

         apt download tree

      Unpack the files: 

      .. code-block:: console 

         dpkg-deb -xv ./*deb ./

      You can use tree like this now, giving the full path: 
   
      .. code-block:: console

         ~/mytree/usr/bin/tree

      **Note**: if you want to be able to use it with the command "tree" you could set an alias in your ~/.bashrc file and then ``source`` it: 

      .. code-block:: console 

         echo 'alias tree="$HOME/mytree/usr/bin/tree"' >> ~/.bashrc
         source ~/.bashrc


Package states
##############

[RB: this feels way too detailed. The goal is how to use a pre-installed
package, not to understand the types and states of R packages. Sure,
one needs to load an R package before using it and that is part of
the objectives. But knowing if a package is source or bundled or
binary is useless for a learner that tries to run his/her first R package
on a cluster]

An R packages can exist in five possible states

- Source: "source code" or "source files". Development form.
- Bundled: The source code compressed into a single file, usually `tar.gz` and
  sometimes referred to as "source tarballs". Files in `.Rbuildignore` are
  excluded.
- Binary: A compressed and pre-compiled version of a bundle built for a
  specific architecture. Usually how the package is provided by CRAN. Much
  faster than having to compile yourself and no need for dev/build tools.
- Installed: A decompressed binary package located in a package _library_ (more
  on this later).
- In-memory: When the installed package has been loaded from the library into
  memory, using `require(pkg)` or `library(pkg)`.


.. figure:: ../../img/R-pkg-states.png
   :width: 600
   :align: left

.. role:: raw-html(raw)
    :format: html

:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`
:raw-html:`<br />`

| Source: 
| https://r-pkgs.org/structure.html and
| https://nbisweden.github.io/RaukR-2021/rpackages_Sebastian/presentation/rpackages_Sebastian.html

Package libraries
#################

    In R, a library is a directory containing installed packages, sort of like
    a library for books. Unfortunately, in the R world, you will frequently
    encounter confused usage of the words “library” and “package”. It’s common
    for someone to refer to dplyr, for example, as a library when it is
    actually a package (Wickham & Hadley, 2023).

    [RB: this feels way too detailed. This session is about packages. Stating
    that these are sometimes called 'libraries' too suffices. Even that I'd
    suggest to remove, as it is not part of the teaching goal on how to use
    R packages]

We might want to know where the ``R`` interpreter will be searching for
packages, i.e. where the libraries are located (could be several). The easiest
way to check is probably starting the interpreter and running the ``libPaths()`` function.

[RB: No, we don't need to know where the R interpreter looks for libraries:
this session is about using pre-installed R packages. They Should Just Work.
This session will not help the learners at all to use their first R package
on a cluster]


.. tabs::

   .. tab:: UPPMAX

      Load ``R``, e.g. version 4.1.1 and start the Interpreter

      .. code-block:: console 

         $ ml R/4.1.1
         $ R

      Then check find the path of the library using the ``libPaths()`` function.

      .. code-block:: rconsole
      
         > .libPaths()
         [1] "/sw/apps/R/4.1.1/rackham/lib64/R/library"
	
   .. tab:: HPC2N
   
      Load ``R``, e.g. version 4.1.2 and start the Interpreter

      .. code-block:: console 

         $ ml GCC/11.2.0  OpenMPI/4.1.1  R/4.1.2
         $ R

      Then check find the path of the library using the ``libPaths()`` function.

      .. code-block:: rconsole
      
         > .libPaths()
         [1] "/pfs/stor10/users/home/b/bbrydsoe/R-packages-4.1.2"                                     
         [2] "/cvmfs/ebsw.hpc2n.umu.se/amd64_ubuntu2004_bdw/software/R/4.1.2-foss-2021b/lib/R/library"


Preinstalled package libraries
------------------------------

Both UPPMAX and HPC2N offer a large amount of preinstalled packages.

.. admonition:: HPC2N

   - On HPC2N most of these (around 750 packages) come with the ``R`` module and additional ones in the ``R-bundle-Bioconductor``.

   - NOTE: that on HPC2N, there are currently only two versions of the ``R-bundle-Bioconductor`` module, one that is compatible with ``R/4.0.0`` and one with ``R/4.1.2``. Thus, if you need the extra packages included in the ``R-bundle-Bioconductor`` module, you should use one of the compatible R versions. Use ``module spider <module>/<version>`` to check for prerequisites, as usual. 

.. admonition:: UPPMAX

   On UPPMAX the module ``R_packages`` is a package library containing almost all packages in the CRAN and BioConductor repositories. As of 2023-10-11 there are a total of:

   - A total of 23476 R packages are installed
   - A total of 23535 packages are available in CRAN and BioConductor
   
      - 19809 CRAN packages are installed, out of 19976 available
      - 3544 BioConductor-specific packages are installed, out of 3559 available
   - 121 other R packages are installed. These are not in CRAN/BioConductor, are only available in the CRAN/BioConductor archives, or are hosted on github, gitlab or elsewhere


There are many different ways to check if the package you are after is already installed - chances are it is! The simplest way is probably to simply try loading the package from within ``R``

[RB: I love having one simple way! Please keep!]

.. code-block:: R

   library(package-name)

Another option would be to create a dataframe of all the installed packages

[RB: I think having one simple way is enough. I suggest to remove this fancy
looking, non-Tidyverse style, complex code below]


.. code-block:: R

   ip <- as.data.frame(installed.packages()[,c(1,3:4)])

   rownames(ip) <- NULL

   ip <- ip[is.na(ip$Priority),1:2,drop=FALSE]

   print(ip, row.names=FALSE)

However, this might not be so helpful unless you do additional filtering.
[RB: agree, hence remove this code and this additional statement]

<br>

Another simple option is to ``grep`` the library directory. For example, both when loading ``R_packages`` at UPPMAX and ``R-bundle-Bioconductor`` at HPC2N the environment variable ``R_LIBS_SITE`` will be set to the path of the package
library.
[RB: I think having one simple way is enough. I suggest to remove this fancy
looking way that does not even use R]


.. tabs::

   .. tab:: UPPMAX

      Load ``R_packages``

      .. code-block:: console 

         $ ml R_packages/4.1.1

      Then grep for some package

      .. code-block:: console

         $ ls -l $R_LIBS_SITE | grep glmnet
         dr-xr-sr-x  9 douglas sw  4096 Sep  6  2021 EBglmnet
         dr-xr-sr-x 11 douglas sw  4096 Nov 11  2021 glmnet
         dr-xr-sr-x  8 douglas sw  4096 Sep  7  2021 glmnetcr
         dr-xr-sr-x  7 douglas sw  4096 Sep  7  2021 glmnetUtils
	
   .. tab:: HPC2N
   
      Load ``R-bundle-Bioconductor``

      .. code-block:: console 

         $ ml GCC/11.2.0  OpenMPI/4.1.1 R-bundle-Bioconductor/3.14-R-4.1.2

      Check the ``R_LIBS_SITE`` environment variable

      .. code-block:: console
         
         $ echo $R_LIBS_SITE
         /hpc2n/eb/software/R-bundle-Bioconductor/3.14-foss-2021b-R-4.1.2:/hpc2n/eb/software/arrow-R/6.0.0.2-foss-2021b-R-4.1.2

      Then grep for some package in the BioConductor package library

      .. code-block:: console 

         $ ls -l /hpc2n/eb/software/R-bundle-Bioconductor/3.14-foss-2021b-R-4.1.2 | grep RNA
         drwxr-xr-x  9 easybuild easybuild 4096 Dec 30  2021 DeconRNASeq/
         drwxr-xr-x  7 easybuild easybuild 4096 Dec 30  2021 RNASeqPower/


Installing your own packages
----------------------------

Sometimes you will need R packages that are not already installed.
[RB: the teaching goal is to use an existing R package. Both clusters
have many pre-installed R packages, so running a pre-installed R package
is an achievable first teaching goal, that I suggest to do first.]

The solution
to this is to install your own packages. These packages will usually come from
CRAN (https://cran.r-project.org/) - the Comprehensive R Archive Network, or
sometimes from other places, like GitHub or R-Forge

Here we will look at installing R packages with automatic download and with
manual download. It is also possible to install from inside Rstudio. 

Setup
#####

We need to create a place for the own-installed packages to be and to tell R
where to find them. The initial setup only needs to be done once, but separate
package directories need to be created for each R version used. 

R reads the ``$HOME/.Renviron`` file to setup its environment. It should be
created by R on first run, or you can create it with the command: ``touch
$HOME/.Renviron``

**NOTE**: In this example we are going to assume you have chosen to place the R packages in a directory under your home directory, but in general it might be good to use the project storage for space reasons. As mentioned, you will need
separate ones for each R version.

If you have not yet installed any packages to R yourself, the environment file should be empty and you can update it like this: 

.. code-block:: console 

   $ echo R_LIBS_USER="$HOME/R-packages-%V" > ~/.Renviron

.. warning::

   - If it is **not empty**, you can edit ``$HOME/.Renviron`` with your favorite editor so that ``R_LIBS_USER`` contains the path to your chosen directory for own-installed R packages. 


It should look something like this when you are done:

.. code-block:: console 

   $ R_LIBS_USER="/home/u/user/R-packages-%V"


**NOTE** Replace ``/home/u/user`` with the value of ``$HOME``. Run ``echo $HOME`` to see its value.
**NOTE** The ``%V`` should be written as-is, it's substituted at runtime with the active R version.

For each version of R you are using, create a directory matching the pattern
used in ``.Renviron`` to store your packages in. This example is shown for R
version 4.1.1:

.. code-block:: sh 

   $ mkdir -p $HOME/R-packages-4.1.1


Automatical download and install from CRAN
##########################################

[RB: all clusters have these packages pre-installed. This section can
be removed]

.. note:: 

    You find a list of packages in CRAN (https://cran.r-project.org/) and a list of repos here: https://cran.r-project.org/mirrors.html 

    Please choose a location close to you when picking a repo. 


.. tabs::

   .. tab:: From command line

      .. code-block:: console 

         $ R --quiet --no-save --no-restore -e "install.packages('<r-package>', repos='<repo>')"
    
   .. tab:: From inside R

      .. code-block:: R 

          install.packages('<r-package>', repos='<repo>')
       

In either case, the dependencies of the package will be downloaded and
installed as well. 

      
Example
*******

[RB: I suggest to remove this section. Let's use pre-installed packages first]

In this example, we will install the R package ``stringr`` and use the
repository http://ftp.acc.umu.se/mirror/CRAN/ 

**Note**: You need to load R (and any prerequisites, and possibly R-bundle-Bioconductor if you need packages from that) before installing packages. 

.. tabs::

   .. tab:: From command line

      .. code-block:: console 

         $ R --quiet --no-save --no-restore -e "install.packages('stringr', repos='http://ftp.acc.umu.se/mirror/CRAN/')"
       
   .. tab:: From inside R

      .. code-block:: R 

          install.packages('stringr', repos='http://ftp.acc.umu.se/mirror/CRAN/')



Automatic download and install from GitHub
##########################################

[RB: I suggest to remove this section. Let's use pre-installed packages first]

If you want to install a package that is not on CRAN, but which do have a
GitHub page, then there is an automatic way of installing, but you need to
handle prerequsites yourself by installing those first. It can also be that the
package is not in as finished a state as those on CRAN, so be careful. 

To install packages from GitHub directly, from inside R, you first need to
install the devtools package. Note that you only need to install this **once**. 

This is how you install a package from GitHub, inside R:

 .. code-block:: R
 
    install.packages("devtools")   # ONLY ONCE
    devtools::install_github("DeveloperName/package")
    

Example
*******

.. type-along::

   In this example we want to install the package ``quantstrat``. It is not on CRAN, so let's get it from the GitHub page for the project:
   https://github.com/braverock/quantstrat 

   We also need to install devtools so we can install packages from GitHub. In
   addition, ``quantstrat`` has some prerequisites, some on CRAN, some on GitHub,
   so we need to install those as well. 

   .. code-block:: R 

      install.packages("devtools") # ONLY ONCE
      install.packages("FinancialInstrument") 
      install.packages("PerformanceAnalytics") 
   
      devtools::install_github("braverock/blotter")
      devtools::install_github("braverock/quantstrat")

    
Manual download and install
###########################

[RB: I suggest to remove this section. Let's use pre-installed packages first]

If the package is not on CRAN or you want the development version, or you for
other reason want to install a package you downloaded, then this is how to
install from the command line: 

.. code-block:: console 

   $ R CMD INSTALL -l <path-to-R-package>/R-package.tar.gz
    

**NOTE** that if you install a package this way, you need to handle any
dependencies yourself. 

.. note:: 

   Places to look for R packages
   
   - CRAN (https://cran.r-project.org/)
   - R-Forge (https://r-forge.r-project.org/)
   - Project's own GitHub page
   - etc.
   

.. keypoints::

   - You can check for installed packages 
   	- from inside R with ``installed.packages()``
	- from BASH shell with the 
		- ``ml help R/<version>`` at UPPMAX
		- ``ml spider R/<version>`` at HPC2N
   - Installation of R packages can be done either from within R or from the
     command line (BASH shell)
   - CRAN is the recommended place to look for R-packages, but many packages
     can be found on GitHub and if you want the development version of a
     package you likely need to get it from GitHub or other place outside CRAN.
     You would then either download and install manually or install with
     something like devtools, from within R. 

Install own packages on Bianca
------------------------------

[RB: I suggest to remove this section. Let's use pre-installed packages first]

- If an R package is not not available on Bianca already (like Conda repositories) you may have to use the wharf to install the library/package
- Typical workflow

   - Install on Rackham
   - Transfer to Wharf
   - Move package to local Bianca R package path
   - Test your installation
- Demo and exercise from our Bianca course:
   - `Installing R packages on Bianca <https://uppmax.github.io/bianca_workshop/rpackages/>`_


Exercises
---------

[RB: I miss an exercise about (1) loading the modules for R and R packages,
(2) then using a pre-installed R package]

[RB: I feel this exercise should either be removed or be optional]

.. challenge:: Install a package with automatic download

   1. First do the setup of `.Renviron` and create the directory for installing R packages (Recommended load R version 4.1.1 on Rackham, 4.1.2 on Kebnekaise)
   2. From the command line. Suggestion: ``anomalize``
   3. From inside R. Suggestion: `tidyr`
   4. Start R and see if the library can be loaded. 
   
   These are both on CRAN, and this way any dependencies will be installed as well. 
   
   Remember to pick a repo that is nearby, to install from: https://cran.r-project.org/mirrors.html 


.. solution:: Solution for 4.1.1 on Rackham (change <user>) 

   .. tabs:: 

      .. tab:: Setup
      
            .. code-block:: console
	 
               $ echo R_LIBS_USER=\"$HOME/R-packages-%V\" > ~/.Renviron
	       R_LIBS_USER="/home/<user>/R-packages-%V"
	       $ mkdir -p $HOME/R-packages-4.1.1
	    

      .. tab:: Command line
      
            Installing package "anomalize". Using the repo http://ftp.acc.umu.se/mirror/CRAN/
         
            .. code-block:: console
	 
	       $ R --quiet --no-save --no-restore -e "install.packages('anomalize', repo='http://ftp.acc.umu.se/mirror/CRAN/')"
	  
            This assumes you have already loaded the R module. If not, then do so first. 
	 
      .. tab:: Inside R
      
            Installing package "tidyr". Using the repo http://ftp.acc.umu.se/mirror/CRAN/

            .. code-block:: R 

               > install.packages('tidyr', repo='http://ftp.acc.umu.se/mirror/CRAN/')	     
	     
      .. tab:: Load library

            .. code-block:: R
	 
	       $ R
	       > library("anomalize")
	       > library("tidyr")
	    
	   "anomalize" outputs some text/advertisment when loaded. You can ignore this. 
