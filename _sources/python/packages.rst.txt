Packages
========

.. admonition:: Python modules AKA Python packages

   - Python **packages broaden the use of python** to almost infinity! 

   - Instead of writing code yourself there may be others that have done the same!

   - Many **scientific tools** are distributed as **python packages**, making it possible to run a script in the prompt and there define files to be analysed and arguments defining exactly what to do.

   - A nice **introduction to packages** can be found here: https://aaltoscicomp.github.io/python-for-scicomp/dependencies/ 

.. questions::

   - How do I find which packages and versions are available?
   - What to do if I need other packages?
   - Are there differences between HPC2N and UPPMAX?
   
.. objectives:: 

   - Show how to check for Python packages
   - show how to install own packages on the different clusters


.. admonition:: There are two package installation systems

    - **PyPI** (``pip``) is traditionally for Python-only packages but it is no problem to also distribute packages written in other languages as long as they provide a Python interface.

    - **Conda** (``conda``) is more general and while it contains many Python packages and packages with a Python interface, it is often used to also distribute packages which do not contain any Python (e.g. C or C++ packages).
    	- Creates its own environment that does not interact with other python installations
	- At HPC2N, Conda is not recommended, and we do not support it there

    - Many libraries and tools are distributed in both ecosystems.


Check current available packages
--------------------------------

General for both centers
########################

Some python packages are working as stand-alone tools, for instance in bioinformatics. The tool may be already installed as a module. Check if it is there by:

.. code-block:: sh 

   $ module spider <tool-name or tool-name part> 
    
Using ``module spider`` lets you search regardless of upper- or lowercase characters.



.. tabs::

   .. tab:: UPPMAX

	Check the pre-installed packages of a specific python module:

	.. code-block:: sh 

	   $ module help python/<version> 
  
	
	
   .. tab:: HPC2N
   
	At HPC2N, a way to find Python packages that you are unsure how are names, would be to do

	.. code-block:: sh 

	   $ module -r spider ’.*Python.*’
   
	or

	.. code-block:: sh 

	   $ module -r spider ’.*python.*’
   
	Do be aware that the output of this will not just be Python packages, some will just be programs that are compiled with Python, so you need to check the list carefully.   
   
Check the pre-installed packages of a loaded python module, in shell:

.. code-block:: sh 

   $ pip list

To see which Python packages you, yourself, has installed, you can use ``pip list --user`` while the environment you have installed the packages in are active.

You can also test from within python to make sure that the package is not already installed:

.. code-block:: python 

    >>> import <package>
    
Does it work? Then it is there!
Otherwise, you can either use ``pip`` or ``conda``.


**NOTE**: at HPC2N, the available Python packages needs to be loaded as modules before using! See a list of some of them here: https://uppmax.github.io/HPC-python/intro.html#python-at-hpc2n or find more as mentioned above, using ``module spider -r ....```

A selection of the Python packages and libraries installed on UPPMAX and HPC2N are:

.. tabs::

   .. tab:: UPPMAX

	The python application at UPPMAX comes with several preinstalled packages.
	A selection of the Python packages and libraries installed on UPPMAX are:

	  - ``Numpy``
	  - ``Pandas``
 	  - ``Scipy``
	  - ``Matplotlib``
	  - ``Jupyter notebook``
	  - ``pip``
	  - ``cython``
	  - ``ipython``
	  - ``networkx``
	  - ``graphviz/0.16``
	In addition there are packages available from the module system
  	  - ``biopython``
  	  - ``python_ML_packages``
    	  - ``sklearn/scikit-learn``
	  - ``TensorFlow`` 
	  - ``torch``
    	  - ``mpi``
    	  - ``mpi4py``
  	  - ``bwa``
  	  - ``Graphviz/2.40.1``
  	  - ``HiChipper``
  	  - ``Homer``
  	  - ``pysam``

   .. tab:: HPC2N

      - The python application at HPC2N comes with several preinstalled packages - check first before installing yourself!. 
      - HPC2N has both Python 2.7.x and Python 3.x installed. 
      - We will be using Python 3.x in this course.  For this course, the recommended version of Python to use on Kebnekaise is 3.9.5

	NOTE:  HPC2N do NOT recommend (and do not support) using Anaconda/Conda on our systems. You can read more about this here: https://www.hpc2n.umu.se/documentation/guides/anaconda


      - This is a selection of the packages and libraries installed at HPC2N. These are all installed as **modules** and need to be loaded before use. 
	
	  - ``ASE``
	  - ``Keras``
	  - ``PyTorch``
	  - ``SciPy-bundle`` (Bottleneck, deap, mpi4py, mpmath, numexpr, numpy, pandas, scipy - some of the versions have more)
	  - ``TensorFlow``
	  - ``Theano``
	  - ``matplotlib``
	  - ``scikit-learn``
	  - ``scikit-image``
	  - ``pip``
	  - ``iPython``
	  - ``Cython``
	  - ``Flask``



Install with pip
----------------

You use ``pip`` this way, in a Linux shell OR a python shell: 

.. code-block:: sh 

    $ pip install --user <package>
    
Use ``pip3`` if you loaded python3.

Then the package ends up in ``~/.local/lib/python<version>/site-packages/`` .

Note that python<version> is omitting the last number (bug fix), like 3.8 for python-3.8.7.
We HIGHLY recommend using a virtual environment during installation, since this makes it easier to install for different versions of Python.  More information will follow later in this course (https://uppmax.github.io/HPC-python/isolated.html). 



.. note::
   
   You will test this in the separated sessions about isolated environments in a while.

.. keypoints::

   - You can check for packages 
   
   	- from the Python shell with the ``import`` command
	- from BASH shell with the 
	
		- ``pip list`` command at both centers
		- ``ml help python/3.9.5`` at UPPMAX
		
   - Installation of Python packages can be done either with **PYPI** or **Conda**
   - You install own packages with the ``pip install`` command (This is the recommended way on HPC2N)
   - At UPPMAX Conda is also available (See Conda section)

Conda
-----

.. questions::

   - What does Conda do?
   - How to create a Conda environment
   
.. objectives::

   - Learn pros and cons with Conda
   - Learn how to install packages and work with the Conda (isolated) environment
   
.. hint::

   - On Bianca (with no internet), Conda is the first choice when installing packages, because there is a local mirror of most of the Conda repositories.

Using Conda
'''''''''''
      
.. admonition:: Conda cheat sheet    
   
   - List packages in present environment:	``conda list``
   - List all environments:			``conda info -e`` or ``conda env list``
   - Install a package: ``conda install somepackage``
   - Install from certain channel (conda-forge): ``conda install -c conda-forge somepackage``
   - Install a specific version: ``conda install somepackage=1.2.3``
   - Create a new environment: ``conda create --name myenvironment``
   - Create a new environment from requirements.txt: ``conda create --name myenvironment --file requirements.txt``
   - On e.g. HPC systems where you don’t have write access to central installation directory: conda create --prefix /some/path/to/env``
   - Activate a specific environment: ``conda activate myenvironment``
   - Deactivate current environment: ``conda deactivate``


Install with conda (UPPMAX)
'''''''''''''''''''''''''''

.. Note::

    We have mirrored all major conda repositories directly on UPPMAX, on both Rackham and Bianca. These are updated every third day.
    We have the following channels available:
    
    - bioconda
    - biocore
    - conda-forge
    - dranew
    - free
    - main
    - pro
    - qiime2
    - r
    - r2018.11
    - scilifelab-lts
    
    You reach them all by loading the conda module. You don't have to state the specific channel when using UPPMAX. Otherwise you do with ``conda -c <channel> ...``
    
First steps
'''''''''''

.. tip::
    
   There will be an exercise in the end! 

1. First load our conda module (there is no need to install you own miniconda, for instance)

  .. prompt:: bash $

        module load conda
    
  - This grants you access to the latest version of Conda and all major repositories on all UPPMAX systems.

  - Check the text output as conda is loaded, especially the first time, see below
  
   .. admonition:: Conda load output
          :class: dropdown

       - The variable CONDA_ENVS_PATH contains the location of your environments. Set it to your project's environments folder if you have one.

       - Otherwise, the default is ~/.conda/envs. 

       - You may run ``source conda_init.sh`` to initialise your shell to be able to run ``conda activate`` and ``conda deactivate`` etc.

       - Just remember that this command adds stuff to your shell outside the scope of the module system.

       - REMEMBER TO ``conda clean -a`` once in a while to remove unused and unnecessary files


2. First time
        
  - The variable CONDA_ENVS_PATH contains the location of your environments. Set it to your project's environments folder if you have one.
  - Otherwise, the default is ~/.conda/envs. 
  - Example:
  
      .. prompt:: bash $
 
          export CONDA_ENVS_PATH=/proj/<your-project-id>/nobackup/<username>
  
   .. admonition:: By choice
      :class: dropdown
 
      Run ``source conda_init.sh`` to initialise your shell (bash) to be able to run ``conda activate`` and ``conda deactivate`` etcetera instead of ``source activate``. It will modify (append) your ``.bashrc`` file.
      
  
   - When conda is loaded you will by default be in the base environment, which works in the same way as other conda environments. include a Python installation and some core system libraries and dependencies of Conda. It is a “best practice” to avoid installing additional packages into your base software environment.


3. Create the conda environment

  - Example:
  
    .. prompt:: bash $

        conda create --name python36-env python=3.6 numpy=1.13.1 matplotlib=2.2.2
	
    .. admonition:: The ``mamba`` alternative 
        :class: dropdown
    
	- ``mamba`` is a fast drop-in alternative to conda, using "libsolv" for dependency resolution. It is available from the ``conda`` module.
	- Example:  
	
          .. prompt:: bash $

	      mamba create --name python37-env python=3.7 numpy=1.13.1 matplotlib=2.2.2

4. Activate the conda environment by:

    .. prompt:: bash $

	source activate python36-env

    - You will see that your prompt is changing to start with ``(python-36-env)`` to show that you are within an environment.
    
5. Now do your work!

6. Deactivate

 .. prompt:: 
    :language: bash
    :prompts: (python-36-env) $
    
    conda deactivate

.. warning::
 
    - Conda is known to create **many** *small* files. Your diskspace is not only limited in GB, but also in number of files (typically ``300000`` in $home). 
    - Check your disk usage and quota limit with ``uquota``
    - Do a ``conda clean -a`` once in a while to remove unused and unnecessary files
    
    
- `More info about Conda on UPPMAX <https://uppmax.uu.se/support/user-guides/conda-user-guide/>`_


Working with Conda environments defined by files
''''''''''''''''''''''''''''''''''''''''''''''''

- Create an environment based on dependencies given in an environment file:: 

   $ conda env create --file environment.yml
   
- Create file from present conda environment::

   $ conda env export > environment.yml
  

``environments.yml`` (for conda) is a yaml-file which looks like this:

.. code-block:: yaml

   name: my-environment
   channels:
     - defaults
   dependencies:
     - numpy
     - matplotlib
     - pandas
     - scipy

``environments.yml`` with versions:

.. code-block:: yaml

    name: my-environment
    channels:
      - defaults
    dependencies:
      - python=3.7
      - numpy=1.18.1
      - matplotlib=3.1.3
      - pandas=1.1.2
      - scipy=1.6.2

.. admonition:: More on dependencies

   - Dependency management from course `Python for Scientific computing <https://aaltoscicomp.github.io/python-for-scicomp/dependencies/>`_

Exercises
---------

.. challenge:: UPPMAX: Create a conda environment and install some packages
    
   - First check the current installed packages while having ``python/3.9.5`` loaded
   - Open a new terminal and have the old one available for later comparison
   - Use the conda module on Rackham and create an environment with name ``HPC-python23`` with ``python 3.7``  and ``numpy 1.15``
   
   	- Use your a path for ``CONDA_ENVS_PATH`` of your own choice or ``/proj/py-r-jl/<user>/python``
        - (It may take a minute or so)
	
   - Activate!
   - Check with ``pip list`` what is there. Compare with the environment given from the python module in the first terminal window. 
   
   	- Which version of Python did you get?
	
   - Don't forget to deactivate the Conda environment before doing other exercises!

.. solution:: Solution for UPPMAX
    :class: dropdown
    
          Write this in the terminal
          
          .. code-block:: sh

            $ module load conda
            $ export CONDA_ENVS_PATH=/proj/py-r-jl/<user>/python
            $ conda create --name HPC-python23 python=3.7 numpy=1.15
            $ source activate HPC-python23
            $ pip list
            $ python -V
            $ source deactivate


.. keypoints::

   - Conda is an installer of packages but also bigger toolkits
   - Conda creates isolated environments (see next section) not clashing with other installations of python and other versions of packages
   - Conda environment requires that you install all packages needed by yourself. 
   
      - That is, you cannot load the python module and use the packages therein inside you Conda environment.
    
