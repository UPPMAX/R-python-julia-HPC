Using RStudio
===============

On UPPMAX
----------

There is a system installed version, available via the "rstudio" command (you
will get RStudio/1.1.423). 

However, we recommend you to use a RStudio module.

Also, we recommend to use ThinLinc. Login using

- server: rackham-gui.uppmax.uu.se
- username
- password


- Choose Xfce as the desktop environment (faster)
- start a command line window
- load R_packages/4.1.1, use 'module help R_packages/4.1.1' to see what is
  available in this certain version module load RStudio/1.4.1106
- run 'rstudio &' from the command line, and wait
  - it might take 5-10 minutes for RStudio to start, but once it starts, there
    should be no further delays
  - do *not* start RStudio through the graphical menu system in ThinLinc, this
    will not have access to loaded modules.
  - if it takes a long time and might be due to that you have saved a lot of
    workspace
  

Example:

.. code:: bash 

   $ module load R_packages/4.1.1
   $ module load RStudio/2022.02.0-443
   $ rstudio &


If you're going to run heavier computations within RStudio then you have to
remember that you need to do it inside an interactive session on one of the
computation nodes, and not on a login node. But if you mostly want to use it as
a pretty code editor then you can run it on the login node as well.

To use Rstudio on a compute node, start by asking SLURM for an interactive
allocation (within the ThinLink session). E.g.


.. code:: bash

   $ interactive -A naiss2023-22-44 -p devcore -n 4 -t 10:00


On Bianca
''''''''''

When logging onto Bianca, you are placed on a login node, which nowadays has 2
CPU and a few GB of RAM. This is sufficient for doing some lightweight
calculations, but interactive sessions and batch jobs provide access to much
more resources and should be requested via the SLURM system.

The desktop client version of ThinLinc does not work for Bianca. Instead you
run and login to ThinLinc in the browser:

- https://bianca.uppmax.uu.se

On HPC2N
--------

Rstudio also exists on Kebnekaise but is only installed on the ThinLinc login nodes and not on the compute nodes (and also not on the regular login nodes accessible with SSH). 
Thus, Rstudio should only be used for development and very light analysis, since there is no way to submit a job to the compute nodes.

Login to ThinLinc desktop application by providing the following 

- server: kebnekaise-tl.hpc2n.umu.se
- username
- password

Alternatively, you can use ThinLinc in the browser: https://kebnekaise-tl.hpc2n.umu.se:300/

When in ThinLinc, you can start Rstudio either from the menu (version 4.0.4) or from the command line. If you start it from the command line you first need to load R and its prerequisites, but you can pick between several versions this way. 
