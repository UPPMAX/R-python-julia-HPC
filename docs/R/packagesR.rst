Packages
========

.. admonition:: R packages

   - R packages is the main way of extending the functionallity of R and
     **broadens the use of R** to almost infinity! 

   - Instead of writing code yourself there may be others that have done the
     same!

   - Many **scientific tools** are distributed as **R packages**, making it
     possible to run a script in the prompt and there define files to be
     analysed and arguments defining exactly what to do.

   - For more details about packages and in particular developing your own,
     see: `R packages <https://r-pkgs.org>`_

.. questions::
   - What is an R package?
   - How do I find which packages and versions are available?
   - What to do if I need other packages?
   - Are there differences between HPC2N and UPPMAX?
   
.. objectives:: 
   - Understand the basics of what an R package is
   - Show how to check for R packages
   - show how to install own packages on the different clusters


R packages: A short Primer
--------------------------

Whats is a package?
###################

An R package is essentialy a contained folder and file structure containing R
code (and possibly C/C++ or other code) and other files relevant for the
package e.g. documentation, licensing and configuration files. Let us look at a
very simple example


.. code-block:: sh

   git clone 


Packages can be 


Package states
##############

.. figure:: ../../img/R-pkg-states.png
   :width: 450
   :align: center


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

To see which Python packages you, yourself, has installed, you can use ``pip list --user`` while the environement you have installed the packages in are active.

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

	The python application at HPC2N comes with several preinstalled packages - check first before installing yourself!. HPC2N has both Python 2.7.x and Python 3.x installed. We will be using Python 3.x in this course.  For this course, the recommended version of Python to use on Kebnekaise is 3.9.5

	NOTE:  HPC2N do NOT recommend (and do not support) using Anaconda/Conda on our systems. You can read more about this here: https://www.hpc2n.umu.se/documentation/guides/anaconda


	This is a selection of the packages and libraries installed at HPC2N. These are all installed as **modules** and need to be loaded before use. 
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



Installing your own packages
----------------------------



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