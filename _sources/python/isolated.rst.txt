Isolated environments
=====================

.. note::
   Isolated environments solve a couple of problems:
   
   - You can install specific, also older, versions into them.
   - You can create one for each project and no problem if the two projects require different versions.
   - You can remove the environment and create a new one, if not needed or with errors.
   
``conda`` works as an isolated environment. Below we present the ``pip`` way with "virtual environments", as well as installing using setup.py! Installing with a virtual environment is the only recommended way at HPC2N! 

.. questions::

   - How to work with isolated environments at HPC2N and UPPMAX?
   
.. objectives:: 

   - Give a general *theoretical* introduction to isolated environments 
   - Site-specific procedures.

General procedures   
------------------

You will often have the situation that your project(s) use different versions of Python and different versions of packages. This is great if you need different versions of a package for different tasks, for instance.

As an example, maybe you have been using TensorFlow 1.x.x for your project and now you need to install a package that requires TensorFlow 2.x.x but you will still be needing the old version of TensorFlow for another package, for instance. This is easily solved with isolated environments.

- Isolated environments lets you create separate workspaces for different versions of Python and/or different versions of packages. 
- You can activate and deactivate them one at a time, and work as if the other workspace does not exist.

There are different tools for creating an isolated environement, but they all have some things in common. At both UPPMAX and HPC2N the workflow is: 

- You load the Python module you will be using, as well as any site-installed package modules (requires the ``--system-site-packages`` option)
- You create the isolated environment with something like venv, virtualenv, or conda
- You activate the environment
- You install (or update) the environment with the packages you need
- You work in the isolated environment
- You deactivate the environment after use 

**The tools**

In this course we will look at the following tools for creating and using isolated environments: 

   - venv            UPPMAX
   - virtualenv      UPPMAX+HPC2N
   - Conda           UPPMAX


.. admonition:: venv vs. virtualenv

   - These are almost completely interchangeable
   - The difference being that **virtualenv supports older python versions** and has a few more minor unique features, while **venv is in the standard library**.

.. keypoints::

   - With a virtual environment you can tailor an environment with specific versions for Python and packages, not interfering with other installed python versions and packages.
   - Make it for each project you have for reproducibility.
   - There are different tools to create virtual environemnts.
      - UPPMAX has  Conda and venv and virtualenv
      - HPC2N has virtualenv.
      - More details in the separated sessions!
 
   
Virtual environment - venv & virtualenv
'''''''''''''''''''''''''''''''''''''''

Example
#######

.. tip::
    
   **Do not code along!**

Create a ``venv``. First load the python version you want to base your virtual environment on:

.. tabs::

   .. tab:: UPPMAX

      .. code-block:: sh

         $ module load python/3.6.8
         $ python -m venv --system-site-packages Example
    
      "Example" is the name of the virtual environment. The directory “Example” is created in the present working directory. The ``-m`` flag makes sure that you use the libraries from the python version you are using.

   .. tab:: HPC2N

      .. code-block:: sh

         $ module load python/3.7.2
         $ virtualenv --system-site-packages Example
    
      "vpyenv" is the name of the virtual environment. You can name it whatever you want. The directory “Example” is created in the present working directory.


.. note::

   To save space, you should load any other Python modules you will need that are system installed before installing your own packages! Remember to choose ones that are compatible with the Python version you picked! 
   ``--system-site-packages`` includes the packages already installed in the loaded python module.

**NOTE**: since it may take up a bit of space if you are installing many Python packages to your virtual environment, we **strongly** recommend you place it in your project storage! 

**NOTE**: if you need are for instance working with both Python 2 and 3, then you can of course create more than one virtual environment, just name them so you can easily remember which one has what. 
      

If you want it in a certain place...

.. tabs::

   .. tab:: UPPMAX

      To place it in the course project folder
      
      .. code-block:: sh

         $ python -m venv --system-site-packages /proj/py-r-jl/<user>/python
    
      Activate it.

      .. code-block:: sh

          $ source /proj/py-r-jl/<user>/python/Example/bin/activate

      Note that your prompt is changing to start with (Example) to show that you are within an environment.

   .. tab:: HPC2N

      To place it in a directory below your project storage (again calling it "Example"): 

      .. code-block:: sh

         $ virtualenv --system-site-packages /proj/nobackup/your-project-id/<your-project-storage>/Example 
    
      Activate it.

      .. code-block:: sh

          $ source /proj/nobackup/your-project-id/<your-project-storage>/Example/bin/activate


Note that your prompt is changing to start with (name of your vitual environment) to show that you are within it.


Using pip
'''''''''

Install your packages with ``pip``. While not always needed, it is often a good idea to give the correct versions you want, to ensure compatibility with other packages you use: 

.. prompt:: 
    :language: bash
    :prompts: (Example) $
      
    pip install numpy==1.15.4 matplotlib==2.2.2

Deactivate it.

.. prompt:: 
   :language: bash
   :prompts: (Example) $
   
   deactivate
    
The "--no-cache-dir" option is required to avoid it from reusing earlier installations from the same user in a different environment. The "--no-build-isolation" is to make sure that it uses the loaded modules from the module system when building any Cython libraries.


Everytime you need the tools available in the virtual environment you activate it as above.

.. prompt:: bash $

   source /proj/nobackup/your-project-id/Example/bin/activate
    

Prepare the course environment
''''''''''''''''''''''''''''''

.. tip::
    
   **Code along!**


Create a virtual environment called ``vpyenv`. First load the python version you want to base your virtual environment on:

.. tabs::

   .. tab:: UPPMAX
      
      .. code-block:: sh

          $ module load python/3.9.5
          $ python -m venv --system-site-packages /proj/py-r-jl/<user>/python/vpyenv
    
      Activate it.

      .. code-block:: sh

         $ source /proj/py-r-jl/<user>/python/vpyenv/bin/activate

      Note that your prompt is changing to start with (vpyenve) to show that you are within an environment.

      Install your packages with ``pip`` (``--user`` not needed) and the correct versions, like:

      .. prompt:: 
         :language: bash
         :prompts: (vpyenv) $

         pip install spacy seaborn

      Check what was installed

      .. prompt:: 
         :language: bash
         :prompts: (vpyenv) $

         pip list

      Deactivate it.

      .. prompt:: 
         :language: bash
         :prompts: (vpyenv) $

         deactivate

      Everytime you need the tools available in the virtual environment you activate it as above.

      .. prompt:: bash $

         source /proj/py-r-jl/<user>/python/vpyenv/bin/activate

      More on virtual environment: https://docs.python.org/3/tutorial/venv.html 
      
   .. tab:: HPC2N
     
      1) **First go to the directory you want your environment in.**
      Installing spacy. Using existing modules for numpy (in SciPy-bundle) and the vpyenv we created under Python 3.9.5. Note that you need to load Python again if you have been logged out, etc. but the virtual environment remains, of course.

      .. admonition:: Load modules for Python, numpy (in SciPy-bundle), activate the environment, and install spacy on Kebnekaise at HPC2N 
         :class: dropdown
   
         .. code-block:: sh
           
            b-an01 [/proj/nobackup/support-hpc2n/bbrydsoe]$ module load GCC/10.3.0 OpenMPI/4.1.1 Python/3.9.5 SciPy-bundle/2021.05
            b-an01 [/proj/nobackup/support-hpc2n/bbrydsoe]$ source vpyenv/bin/activate
            (vpyenv) b-an01 [/proj/nobackup/support-hpc2n/bbrydsoe]$ pip install --no-cache-dir --no-build-isolation spacy 
   
      2) Installing seaborn. Using existing modules for numpy (in SciPy-bundle), matplotlib, and the vpyenv we created under Python 3.9.5. Note that you need to load Python again if you have been logged out, etc. but the virtual environment remains, of course   

      .. admonition:: Load modules for Python, numpy (in SciPy-bundle), matplotlib, activate the environment, and install seaborn on Kebnekaise at HPC2N 
         :class: dropdown
   
         .. code-block:: sh
           
            $ module load GCC/10.3.0 OpenMPI/4.1.1 Python/3.9.5 SciPy-bundle/2021.05 matplotlib/3.4.2
            $ source vpyenv/bin/activate
            (vpyenv) $ pip install --no-cache-dir --no-build-isolation seaborn 

         Deactivating a virtual environment.

         .. code-block:: sh

            (vpyenv) $ deactivate

      Every time you need the tools available in the virtual environment you activate it as above (after first loading the modules for Python, Python packages, and prerequisites)

      .. code-block:: sh

         $ source vpyenv/bin/activate
    
Using setup.py
''''''''''''''

Some Python packages are only available as downloads, for instance via github, to install with setup.py or similar file. If that is the case for the package you need, this is how you do it: 

- Pick a location for your installation (change below to fit - I am installing under a project storage)

   - ``mkdir /proj/<project>/<mystorage>/mypythonpackages``
   - ``cd /proj/<project>/<mystorage>/mypythonpackages``
   
- Load Python + (on Kebnekaise) site-installed prerequisites (SciPy-bundle, matplotlib, etc.)
- Install any remaining prerequisites. Remember to activate your Virtualenv if installing with pip!
- Download Python package, place it in your chosen installation dir, then untar/unzip it
- cd into the source directory of the Python package

   - Run ``python setup.py build``
   - Then install with: ``python setup.py install --prefix=<path to install dir>``
   
- Add the path to $HOME/.bash_profile (note that it will differ by Python version): 

   - ``export PYTHONPATH=$PYTHONPATH:<path to your install directory>/lib/python3.9/site-packages``
   
You can use it as normal inside Python (remember to load dependent modules as well as activate virtual environment if it depends on some packages you installed with pip): ``import <python-module>``


Using the self-installed packages in Python
'''''''''''''''''''''''''''''''''''''''''''

- To use the Python packages you have installed under your virtual environment, load your Python module + prerequisites, load any site-installed Python packages you used, and then activate the environment.
- Now your own packages can be accessed from within Python, just like any other Python package. 

**Test it!**

.. tip::
    
   **Code along!**


Using the virtual environment created earlier and the ``spacy`` we installed under example 1) above. 

.. admonition:: UPPMAX:Load modules for Python, activate the environment 
   :class: dropdown
   
   .. code-block:: sh
           
      $ module load Python/3.9.5
      $ source /proj/py-r-jl/<user>/python/vpyenv/bin/activate
      (vpyenv) $ python
           Python 3.9.5 (default, Jun  3 2021, 15:06:34)
           [GCC 9.3.0] on linux
           Type "help", "copyright", "credits" or "license" for more information.

           >>> import spacy
           >>> 


.. admonition:: HPC2N: Load modules for Python, numpy (in SciPy-bundle), activate the environment 
    :class: dropdown
   
        .. code-block:: sh
           
           b-an01 [/proj/nobackup/support-hpc2n/bbrydsoe]$ module load GCC/10.3.0 OpenMPI/4.1.1 Python/3.9.5 SciPy-bundle/2021.05
           b-an01 [/proj/nobackup/support-hpc2n/bbrydsoe]$ source vpyenv/bin/activate
           (vpyenv) b-an01 [/proj/nobackup/support-hpc2n/bbrydsoe]$ python
           Python 3.9.5 (default, Jun  3 2021, 02:53:39) 
           [GCC 10.3.0] on linux
           Type "help", "copyright", "credits" or "license" for more information.
           >>> import spacy
           >>> 
          

- To use self-installed Python packages in a batch script, you also need to load the above mentioned modules and activate the environment. An example of this will follow later in the course. 

- To see which Python packages you, yourself, have installed, you can use ``pip list --user`` while the environment you have installed the packages in are active. 


Working with virtual environments defined from files
''''''''''''''''''''''''''''''''''''''''''''''''''''

- First create and activate and environment (see above)
- Create an environment based on dependencies given in an environment file::
  
  $ pip install -r requirements.txt
   
- - Create file from present virtual environment::

  $ pip freeze > requirements.txt
  
``requirements.txt`` (used by virtual environment) is a simple
text file which looks like this::

   numpy
   matplotlib
   pandas
   scipy

``requirements.txt`` with versions::

    numpy==1.18.1
    matplotlib==3.1.3
    pandas==1.1.2
    scipy==1.6.2

.. admonition:: More on dependencies

   - `Dependency management from coursePython for Scientific computing <https://aaltoscicomp.github.io/python-for-scicomp/dependencies/>`_


.. note:: 

   **pyenv**

   - This approach is more advanced and should be, in our opinion, used only if the above are not enough for the purpose. 
   - ``pyenv`` allows you to install your **own python version**, like 3.10.2, and much more… 
   - Probably Conda will work well for you.
   - https://www.uppmax.uu.se/support/user-guides/python-user-guide/#tocjump_9931546434791352_12

.. warning:: 

   **Running Jupyter in a virtual environment**

   You could also use ``jupyter`` (``-lab`` or ``-notebook``) in a virtual environment.

   If you decide to use the --system-site-packages configuration you will get ``jupyter`` from the python modules you created your virtual environment with.
   However, you **won't find your locally installed packages** from that jupyter session. To solve this reinstall jupyter within the virtual environment by force::

      $ pip install -I jupyter

   and run::

      $ jupyter-notebook
   
   Be sure to start the **kernel with the virtual environment name**, like "Example", and not "Python 3 (ipykernel)".


More info
'''''''''

- UPPMAX's documentation pages about installing Python packages and virtual environments: https://www.uppmax.uu.se/support/user-guides/python-user-guide/
- HPC2N's documentation pages about installing Python packages and virtual environments: https://www.hpc2n.umu.se/resources/software/user_installed/python




.. admonition:: Summary of workflow

   In addition to loading Python, you will also often need to load site-installed modules for Python packages, or use own-installed Python packages. The work-flow would be something like this: 
   
 
   1) Load Python and prerequisites: `module load <pre-reqs> Python/<version>``
   2) Load site-installed Python packages (optional): ``module load <pre-reqs> <python-package>/<version>``
   3) Activate your virtual environment (optional): ``source <path-to-virt-env>/bin/activate``
   4) Install any extra Python packages (optional): ``pip install --no-cache-dir --no-build-isolation <python-package>``
   5) Start Python or run python script: ``python``
   6) Do your work
   7) Deactivate

   - Installed Python modules (modules and own-installed) can be accessed within Python with ``import <package>`` as usual. 
   - The command ``pip list`` given within Python will list the available modules to import. 
   - More about packages and virtual/isolated environment to follow in later sections of the course! 

.. challenge:: Create a virtual environment with a requirements file below

   - Create a virtual environment with python-3.8.X with the name ``analysis``.
   - Install packages definde by the ``requirements.txt`` file (save it).
  
   .. code-block:: sh
   
      numpy==1.18.1
      matplotlib==3.1.3
      pandas==1.1.2
    
   - Check that the packages were installed.
   - Don't forget to deactivate afterwards.

.. solution:: Solution for UPPMAX
    :class: dropdown
    
     .. code-block:: sh

          $ module load python/3.8.7
          $ python -m venv --system-site-packages /proj/py-r-jl/<user>/python/analysis
    
      Activate it.

      .. code-block:: sh

         $ source /proj/py-r-jl/<user>/python/analysis/bin/activate

      - Note that your prompt is changing to start with (analysis) to show that you are within an environment.
      - Install the packages from the file::
      
        pip install -r requirements.txt
      
      .. code-block:: sh

         $ pip list
	 $ deactivate
      
.. solution:: Solution for HPC2N
    :class: dropdown
    
     .. code-block:: sh

          $ module load GCC/10.2.0 Python/3.8.6 
          $ virtualenv --system-site-packages /proj/nobackup/<your-project-storage>/analysis 
      
      Activate it.

      .. code-block:: sh

         $ source /proj/nobackup/analysis/bin/activate

      - Note that your prompt is changing to start with (analysis) to show that you are within an environment.
      - Install the packages from the file::
      
        pip install -r requirements.txt
      
      .. code-block:: sh

         $ pip list
	 $ deactivate
      


.. keypoints::

   - With a virtual environment you can tailor an environment with specific versions for Python and packages, not interfering with other installed python versions and packages.
   - Make it for each project you have for reproducibility.
   - There are different tools to create virtual environemnts.
   
      - UPPMAX has Conda and venv and virtualenv
      - HPC2N has virtualenv
