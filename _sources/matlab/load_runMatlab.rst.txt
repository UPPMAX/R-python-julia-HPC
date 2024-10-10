Load and Run MATLAB
===================

Different recommended procedures for each HPC center:
  - **UPPMAX and HPC2N**: use module system to load at command line
  - **LUNARC**: recommended to use Desktop On-Demand menu, but interactive and non-interactive command lines available

Most HPC centres in Sweden is using the same or similar module system for their software. The difference lies in which modules are installed and their versions/naming. The general examples below will be the same for all/most HPC centres in Sweden - the specific names for the modules will vary a little.
   
.. objectives:: 

   - Be able to load MATLAB
   - Be able to run MATLAB scripts and start the MATLAB graphical user interface (GUI)

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
   
   - Note that the module systems at UPPMAX, HPC2N, and LUNARC are slightly different. 
   - While all modules at UPPMAX not directly related to bio-informatics are shown by ``ml avail``, modules at HPC2N and LUNARC may be hidden until one has loaded a prerequisite like the compiler ``GCC``.
   - Thus, you need to use ``module spider`` to see all modules at HPC2N and LUNARC, and ``ml avail`` for those available to load given your currently loaded prerequisites.  
   - There is no system MATLAB that comes preloaded like Python, but `ml load matlab` with no release date will load the latest release, which is periodically updated. For reproducibility reasons, you should be sure to load the same release throughout a given project.

Check for MATLAB versions
-------------------------

.. type-along::
   
   Checking for MATLAB versions 
   
   .. tabs::

      .. tab:: UPPMAX

         Check all available MATLAB versions with:

         .. code-block:: console

            $ module avail matlab


      .. tab:: HPC2N
   
         Check all available version MATLAB versions with:

         .. code-block:: console
 
            $ module spider matlab
      
         To see how to load a specific version of MATLAB, including the prerequisites, do 

         .. code-block:: console
   
            $ module spider matlab/<version>

         Example for MATLAB R2023b 

         .. code-block:: console

            $ module spider matlab/2023b 


      .. tab:: LUNARC
    
        See all available MATLAB versions at the command line with:

        .. code-block:: console

            $ ml spider matlab

        Or, if on Desktop On-Demand, select ``Applications`` in the top left corner and hover over ``Applications - Matlab``

.. note::
  
  In this course we will use MATLAB R202??.

.. admonition:: Output at HPC2N (Kebnekaise) as of 26 Sep 2024  
    :class: dropdown

        .. code-block:: console

            $ ml spider MATLAB
            ----------------------------------------------------------------------------
              MATLAB:
            ----------------------------------------------------------------------------
                Description:
                  MATLAB is a high-level language and interactive environment that
                  enables you to perform computationally intensive tasks faster than
                  with traditional programming languages such as C, C++, and Fortran.
            
                 Versions:
                    MATLAB/2019b.Update2
                    MATLAB/2021a
                    MATLAB/2021b
                    MATLAB/2022b.Update3
                    MATLAB/2023a.Update4
                 Other possible modules matches:
                    MATLAB-parallel-support
            
            ----------------------------------------------------------------------------


.. admonition:: Output at LUNARC (Cosmos nodes) as of 4 Sep 2024  
    :class: dropdown

        .. code-block:: console

            $ ml spider matlab
            ----------------------------------------------------------------------------
            matlab:
            ----------------------------------------------------------------------------
                Versions:
                    matlab/2022a
                    matlab/2023a
                    matlab/2023b
                  
            ----------------------------------------------------------------------------
            For detailed information about a specific "matlab" package (including how to load the modules) use the module's full name. Note that names that have a trailing (E) are extensions provided by other modules.
            For example:
                  
            $ module spider matlab/2023b
            ----------------------------------------------------------------------------


Load a MATLAB module
--------------------

For reproducibility, we recommend ALWAYS loading a specific module instead of using the default version! 

For this course, we recommend using MATLAB R2023x at UPPMAX (202??), LUNARC (2023b), and HPC2N (202??).

.. type-along::
    
   Loading a Matlab module at the command line, here R2023b

   .. tabs::

      .. tab:: UPPMAX and LUNARC
   
         Go back and check which MATLAB modules were available. To load version 2023b, do:

         .. code-block:: console

            $ module load matlab/2023b
        
         Note: all lowercase.
         For short, you can also use: 

         .. code-block:: console

            $ ml matlab/2023b

 
      .. tab:: HPC2N 

         .. code-block:: console

            $ module load MATLAB/2023B

         Note: all Uppercase except for the letter after the year.   
         For short, you can also use: 

         .. code-block:: console

            $ ml MATLAB/2023b
    

Start MATLAB and Run a Script
-----------------------------
Most of the time, you will run either MATLAB live scripts (``.mlx``) or basic script or function files (``.m``). Live scripts can only be opened and worked on in the GUI, while basic function or script files can also be run from a batch script and/or at the command line.

It is important to note that at the command line, function definition is typically not supported unless the function is short and anonymous; user-defined functions must generally be written up and saved to separate ``.m`` files.

The GUI is typically the recommended interface where it is offered. The GUI provides ways to set up SLURM jobs through the ``Parallel Computing Toolbox``, which will be discussed later. 

.. type-along::
    
   Starting MATLAB at the command line, here R2023b

   .. tabs::

      .. tab:: UPPMAX
   
         Once you've loaded matlab/2023b, or your preferred version, type:

         .. code-block:: console

            $ matlab

         to start the GUI, or

         .. code-block:: console

            $ matlab -nodisplay

         to start MATLAB in the terminal.
 
      .. tab:: HPC2N 

         The GUI can be started in a Thinlinc session by going to "Application" &rarr; "HPC2N Applications" &rarr; "Applications" &rarr; "Matlab <version>" and clicking the desired version.

         To start MATLAB in the terminal, load matlab/2023b or your preferred version, and then type:

         .. code-block:: console

            $ matlab -singleCompThread -nodisplay

         to start MATLAB in the terminal. The ``-singleCompThread`` is important to prevent MATLAB from hogging a whole node, and the `-nodisplay` flag prevents the GUI from launching.

      .. tab:: LUNARC 

         It is recommended that GUI be started in Thinlinc at the LUNARC HPC Desktop On-Demand by going to ``Applications`` &rarr; ``Applications - Matlab`` &rarr; ``Matlab <version>`` and clicking the desired version number. A GfxLauncher window will pop up where you can specify your account, requested resources, and walltime for the GUI itself; these settings are distinct from and do not constrain SLURM jobs sent from the GUI to the compute nodes. For more details, see the section on `Desktop On-Demand https://uppmax.github.io/R-python-julia-matlab-HPC/common/ondemand-desktop.html`_

         To start MATLAB in the terminal, load matlab/2023b or your preferred version, and then type:

         .. code-block:: console

            $ matlab -singleCompThread -nodisplay

         There are 2 possible terminals: one in ``Applications`` &rarr; ``Favorites`` &rarr; ``Terminal``, which runs on a login node, and one at ``Applications`` &rarr; ``Applications - General`` &rarr; ``Interactive Terminal``, which can safely launch either the MATLAB GUI or MATLAB command line on a compute node. Starting the latter will open the GfxLauncher (the user and prompt you for your account and resource requests first. 

The ``-singleCompThread`` is usually required to prevent MATLAB from spawning as many processes as it thinks it needs, which can cause the user to accidentally take over a full node. Most terminal instances launch MATLAB (either the GUI or command line) on a login node by default, so hogging a node can stall other users' jobs, a violation of the NAISS user agreement. Setting ``-singleCompThread`` does **not** prevent MATLAB from sending parallelized and/or multi-threaded jobs to SLURM or the MATLAB Distributed Computing Server (MDCS).

Examples
^^^^^^^^
Try them yourself!

1. Load MATLAB in the terminal and do a few simple commands.

.. code-block:: console

   $ ml matlab/2023b
   $ matlab -singleCompThread -nodisplay
                               < M A T L A B (R) >
                  Copyright 1984-2023 The MathWorks, Inc.
             R2023b Update 7 (23.2.0.2515942) 64-bit (glnxa64)
                              January 30, 2024
   To get started, type doc.
   For product information, visit www.mathworks.com.
   >> a = 5;
   >> b = eye(2);
   >> c = a+b
   c =
       6     5
       5     6

2. Run an example function, ``add2(a,b)`` (the function file is in the exercises folder).

.. code-block:: console

   >> sum2 = add2(5,8);
   result =
       13
   The sum of 5 and 8 is 13
   >> sum2
   sum2 =
       13

3. Exit the MATLAB command line with ``quit`` or ``exit`` (this can take a few seconds).

.. code-block:: console

   >> exit

.. keypoints::

   - You can start MATLAB either in a GUI (recommended) or, with the ``-nodisplay`` flag, run it in the terminal.
   - If you start either interface from the terminal, you must first load the correct module and always include ``-singleCompThread`` to avoid hogging a login node.
