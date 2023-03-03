Load and run python
===================

At both UPPMAX and HPC2N we call the applications available via the module system modules. 
    - https://www.uppmax.uu.se/resources/software/module-system/ 
    - https://www.hpc2n.umu.se/documentation/environment/lmod 

   
.. objectives:: 

   - Show how to load Python
   - Show how to run Python scripts and start the Python command line

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
   
   - Note that the module systems at UPPMAX and HPC2N are slightly different. 
   - While all modules at UPPMAX not directly related to bio-informatics are shown by ``ml avail``, modules at HPC2N are hidden until one has loaded a prerequisite like the compiler ``GCC``.


- For reproducibility reasons, you should always load a specific version of a module instead of just the default version
- Many modules have prerequisite modules which needs to be loaded first (at HPC2N this is also the case for the Python modules). When doing ``module spider <module>/<version>`` you will get a list of which other modules needs to be loaded first


Check for Python versions
-------------------------

.. tip::
    
   **Code along!**

.. tabs::

   .. tab:: UPPMAX

     Check all available Python versions with:

      .. code-block:: sh

          $ module avail python


   .. tab:: HPC2N
   
      Check all available version Python versions with:

      .. code-block:: sh
 
         $ module spider Python
      
      To see how to load a specific version of Python, including the prerequisites, do 

      .. code-block:: sh
   
         $ module spider Python/<version>

      Example for Python 3.9.5

      .. code-block:: sh

         $ module spider Python/3.9.5 

.. admonition:: Output at UPPMAX as of Feb 7 2023
   :class: dropdown
    
       .. code-block::  tcl
    
          -------------------------------------- /sw/mf/rackham/applications ---------------------------------------
           python_ML_packages/3.9.5    wrf-python/1.3.1

           --------------------------------------- /sw/mf/rackham/compilers ----------------------------------------
           python/2.7.6     python/3.3      python/3.6.0    python/3.9.5           python3/3.7.2
           python/2.7.9     python/3.3.1    python/3.6.8    python/3.10.8 (L,D)    python3/3.8.7
           python/2.7.11    python/3.4.3    python/3.7.2    python3/3.6.0          python3/3.9.5
           python/2.7.15    python/3.5.0    python/3.8.7    python3/3.6.8          python3/3.10.8 (D)

           Where:
           D:  Default Module

           Use module spider" to find all possible modules and extensions.
           Use "module keyword key1 key2 ..." to search for all possible modules matching any of the "keys".

.. admonition:: Output at HPC2N as of 7 Feb 2023
    :class: dropdown

        .. code-block:: tcl

           b-an01 [~]$ module spider Python
           ----------------------------------------------------------------------------
           Python:
           ----------------------------------------------------------------------------
           Description:
               Python is a programming language that lets you work more quickly and
               integrate your systems more effectively.
    
            Versions:
                Python/2.7.15   
                Python/2.7.16  
                Python/2.7.18-bare 
                Python/2.7.18  
                Python/3.7.2   
                Python/3.7.4   
                Python/3.8.2   
                Python/3.8.6   
                Python/3.9.5-bare  
                Python/3.9.5   
                Python/3.9.6-bare  
                Python/3.9.6   
                Python/3.10.4-bare
                Python/3.10.4
            Other possible modules matches:
                Biopython  Boost.Python  GitPython  IPython  flatbuffers-python  ...
           ----------------------------------------------------------------------------
           To find other possible module matches execute:
               $ module -r spider '.*Python.*'
           ----------------------------------------------------------------------------
           For detailed information about a specific "Python" package (including how to load the modules) use the module's full name.
               Note that names that have a trailing (E) are extensions provided by other modules.
       
           For example:
            $ module spider Python/3.9.5
           ----------------------------------------------------------------------------

Load a Python module
--------------------

For reproducibility, we recommend ALWAYS loading a specific module instad of using the default version! 

For this course, we recommend using Python 3.9.5.

.. tip::
    
   **Code along!**


.. tabs::

   .. tab:: UPPMAX
   
      Go back and check which Python modules were available. To load version 3.9.5, do:

      .. code-block:: sh

        $ module load python/3.9.5
        
      Note: Lowercase ``p``.
      For short, you can also use: 

      .. code-block:: sh

         $ ml python/3.9.5

 
   .. tab:: HPC2N

 
      .. code-block:: sh

         $ module load GCC/10.3.0 Python/3.9.5

      Note: Uppercase ``P``.   
      For short, you can also use: 

      .. code-block:: sh

         $ ml GCC/10.3.0 Python/3.9.5

.. warning::

   + UPPMAX: Don’t use system-installed python (2.7.5)
   + UPPMAX: Don't use system installed python3 (3.6.8)
   + HPC2N: Don’t use system-installed python (2.7.18)
   + HPC2N: Don’t use system-installed python3  (3.8.10)
   + ALWAYS use python module

.. admonition:: Why are there both Python/2.X.Y and Python/3.Z.W modules?

    Some existing software might use `Python2` and some will use `Python3`. Some of the Python packages have both `Python2` and `Python3` versions. Check what your software as well as the installed modules need when you pick!   
    
.. admonition:: UPPMAX: Why are there both python/3.X.Y and python3/3.X.Y modules?

    Sometimes existing software might use `python2` and there's nothing you can do about that. In pipelines and other toolchains the different tools may together require both `python2` and `python3`.
    Here's how you handle that situation:
    
    + You can run two python modules at the same time if ONE of the module is ``python/2.X.Y`` and the other module is ``python3/3.X.Y`` (not ``python/3.X.Y``).
    
Run
---

Run Python script
#################

    
You can run a python script in the shell like this:

.. code-block:: sh

   $ python example.py

or, if you loaded a python3 module, you can use:

.. code-block:: sh

   $ python3 example.py

since python is a symbolic link to python3 in this case. 

NOTE: *only* run jobs that are short and/or do not use a lot of resources from the command line. Otherwise use the batch system!
    
.. note::

   Real cases will be tested in the **batch session** (https://uppmax.github.io/R-python-julia-HPC/python/batchPython.html). 

Run an interactive Python shell
###############################

For more interactiveness you can run Ipython.

.. tip::
    
   **Code along!**



.. tabs::

   .. tab:: UPPMAX

      NOTE: remember to load a python module first. Then start IPython from the terminal
      
      .. code-block:: sh

         $ ipython 
    
      or 

      .. code-block:: sh

         $ ipython3 
         
      UPPMAX has also ``jupyter-notebook`` installed and available from the loaded Python module. Start with
       
      .. code-block:: sh

         $ jupyter-notebook 
         
    
   .. tab:: HPC2N
      
      NOTE: remember to load an IPython module first. You can see possible modules with 

      .. code-block:: sh

         $ module spider IPython
         $ ml IPython/7.25.0
         
      Then start Ipython with (lowercase):
      
      .. code-block:: sh

         $ ipython 

**Example**

.. code-block:: python

   >>> a=3
   >>> b=7
   >>> c=a+b
   >>> c
   10


- Exit Python or IPython with <Ctrl-D>, "quit()" or 'exit()’ in the python prompt

Python

.. code-block:: python

    >>> <Ctrl-D>
    >>> quit()
    >>> exit()

iPython

.. code-block:: ipython

    In [2]: <Ctrl-D>
    In [12]: quit()
    In [17]: exit()


.. keypoints::

   - Before you can run Python scripts or work in a Python shell, first load a python module and probable prerequisites
   - Start a Python shell session either with ``python`` or ``ipython``
   - Run scripts with ``python <script.py>``
    

