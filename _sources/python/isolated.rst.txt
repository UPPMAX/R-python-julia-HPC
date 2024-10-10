Isolated environments
=====================

.. tabs::

   .. tab:: Learning objectives

      - remember there are multiple virtual environment managers
      - practice to create, activate, work in and deactive a virtual environment
      - practice to export and import a virtual environment

   .. tab:: For teachers

      Teaching goals are:

      - Learners have heard about Conda
      - Learners have created, activated, worked in and deactived a virtual environment
      - Learners have exported and imported a virtual environment

      Other teaching goals are:

      - Create the virtual environment called ``vpyenv`` needed later on
      - UPPMAX only: create the virtual environment called ``Example-gpu`` needed later in this course
      - Create the virtual environment called ``analysis`` needed later on

      Lesson plan (60 minutes in total):

      - 5 mins: prior knowledge
         - How to deal with two tools that need incompatible sets of Python packages?
         - How to solve the problem when there are two tools that need incompatible sets of Python packages?
         - What is a virtual environment manager?
         - Which virtual environment managers exists? 
         - What are the differences between virtual environment managers?
      - 10 mins: presentation
         - Why?
         - Exercises
      - 15 mins: challenge
      - 5 mins: feedback
      - 15 mins: continue challenge
      - 5 mins: feedback

.. admonition:: Compute allocations in this workshop 

   - Rackham: ``naiss2024-22-1202``
   - Kebnekaise: ``hpc2n2024-114``

.. admonition:: Storage space for this workshop 

   - Rackham: ``/proj/r-py-jl-m-rackham``
   - Kebnekaise: ``/proj/nobackup/r-py-jl-m``

Introduction
------------

Different experiments may need different versions of Python and/or Python packages.
Virtual environments allow one to work with multiple sets of (potentially incompatible) packages, where each set is independent and isolated.

Additionally, you may want to have a reproducible computational environment, so that others can reproduce your computational experiments.
Virtual environments can be exported and imported to provide for better reproducible computational environments.

In this session, we create, activate, use, deactivate, export and import some virtual environments.

Virtual environment managers
----------------------------

.. mermaid:: isolated.mmd

In this course, we will look at the following environment managers:

+---------------+-----------------+-------------+------------------+
| Manager       | HPC2N           | UPPMAX      |Scope             |
+===============+=================+=============+==================+
| ``conda``     | Avoid           | Recommended |Language agnostic |
+---------------+-----------------+-------------+------------------+
| ``venv``      | Recommended     | OK          |Python only       |
+---------------+-----------------+-------------+------------------+

Both centers have their documentation on virtual environment managers:

- `UPPMAX <http://docs.uppmax.uu.se/software/python_virtual_environments/>`_
- `HPC2N <https://docs.hpc2n.umu.se/tutorials/userinstalls/#python__packages>`_

In this session, we use ``venv``, as it works for both UPPMAX and HPC2N.

General workflow
----------------

.. mermaid:: isolated_workflow.mmd

Whatever environment manager you use, this is the workflow:

- You create the isolated environment
- You activate the environment
- You work in the isolated environment. 
  Here you install (or update) the environment with the packages you need
- You deactivate the environment after use 

A virtual environment can be created in multiple ways, for example, from scratch.
However, there are more efficient ways, which we will use.

Exercises
---------

In these exercises, we create multiple virtual environments.

For exercises 2 and 3, there is considerate time needed to install
all the Python packages:

+----------+--------------------------+------------------------------------+
| Exercise | Virtual environment name | Time to install packages (minutes) |
+==========+==========================+====================================+
| 1        | ``vpyenv``               | 1                                  |
+----------+--------------------------+------------------------------------+
| 2        | ``Example-gpu``          | 6                                  |
+----------+--------------------------+------------------------------------+
| 3        | ``analysis``             | 13                                 |
+----------+--------------------------+------------------------------------+

Tip for UPPMAX users: do exercise 2 and 3 in parallel by logging in twice.

Exercise 0: remove the Python packages installed in the home folder
-------------------------------------------------------------------

In the previous session, we have installed Python packages in the home folder. This will interfere with our virtual environments.

To make sure your virtual environments work, ruthlessly delete the Python packages in your home folder:

.. code-block:: console

    rm -Ir ~/.local/lib/python3.11

You will be asked to confirm.

Exercise 1: work with ``vpyenv``
--------------------------------

.. tabs::

   .. tab:: Learning objectives

       - Create a Python virtual environment from a step-by-step instruction

   .. tab:: For teachers

       Takes around 3 minutes for an experienced user

In this exercise, we create the course environment ``vpyenv``
in a step-by-step fashion:

.. mermaid:: isolated_workflow_vpyenv.mmd

We create the virtual environment needed for this course, called ``vpyenv``.
As virtual environments can take up a lot of disc space,
we create it in the course project folder.

Exercise 1.1: load the modules needed
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: UPPMAX
      
      .. code-block:: console

          module load python/3.11.8

   .. tab:: HPC2N
     
      .. code-block:: console

          module load GCC/12.3.0 Python/3.11.3 SciPy-bundle/2023.07 matplotlib/3.7.2

Exercise 1.2: create the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: UPPMAX

      Create the virtual environment called ``vpyenv`` as such:      

      .. code-block:: console

          $ python -m venv --system-site-packages /proj/r-py-jl/[username]/python/vpyenv

      where ``[username]`` is your UPPMAX username, for example ``python -m venv --system-site-packages /proj/r-py-jl/sven/python/vpyenv``.

   .. tab:: HPC2N

      Create the virtual environment called ``vpyenv`` as such:      
     
      .. code-block:: console

          $ python -m venv --system-site-packages /proj/nobackup/hpc2n2024-025/[username]/python/vpyenv

      where ``[username]`` is your HPC2N username, for example ``python -m venv --system-site-packages /proj/nobackup/hpc2n2024-025/sven/python/vpyenv``.


Exercise 1.3: activate the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: UPPMAX

      Activate the virtual environment called ``vpyenv`` as such:      

      .. code-block:: console

          source /proj/r-py-jl/[username]/python/vpyenv/bin/activate

      where ``[username]`` is your UPPMAX username, for example ``python -m venv --system-site-packages /proj/r-py-jl/sven/python/vpyenv``.

   .. tab:: HPC2N

      Activate the virtual environment called ``vpyenv`` as such:      
     
      .. code-block:: console

            source /proj/nobackup/hpc2n2024-025/[username]/python/vpyenv/bin/activate

      where ``[username]`` is your HPC2N username, for example ``python -m venv --system-site-packages /proj/nobackup/hpc2n2024-025/sven/python/vpyenv``.


Exercise 1.4: install Python packages
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: UPPMAX

      Install the ``spacy`` and ``seaborn`` packages

      .. code-block:: console

          pip install --user spacy seaborn

   .. tab:: HPC2N

      Install the ``spacy`` and ``seaborn`` packages
     
      .. code-block:: console

          pip install --no-cache-dir --no-build-isolation spacy seaborn 

Exercise 1.5: check if the Python packages are installed
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: UPPMAX

      To see all installed Python packages:

      .. code-block:: console

            pip list

      To see which Python packages you have installed yourself 
      (i.e. not loaded from a module), use:

      .. code-block:: console

            pip list --user

   .. tab:: HPC2N

      .. code-block:: console

            pip list

      To see which Python packages you have installed yourself 
      (i.e. not loaded from a module), use:

      .. code-block:: console

            pip list --user

Exercise 1.6: use the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: UPPMAX

      Start Python and import a Python package:

      .. code-block:: console
           
         (vpyenv) $ python
         Python 3.11.8 (main, Feb  8 2024, 11:48:52) [GCC 12.3.0] on linux
         Type "help", "copyright", "credits" or "license" for more information.
         >>> import spacy
         >>> 

   .. tab:: HPC2N

      Start Python and import a Python package:

      .. code-block:: console

         (vpyenv) b-an01 [/proj/nobackup/hpc2n2024-025/bbrydsoe/python]$ python
         Python 3.11.3 (main, Oct 30 2023, 16:00:15) [GCC 12.3.0] on linux
         Type "help", "copyright", "credits" or "license" for more information.
         >>> import spacy
         >>> 

Exercise 1.7: deactivate the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: UPPMAX

      .. code-block:: console

            deactivate

   .. tab:: HPC2N

      .. code-block:: console

            deactivate

Well done, you've just created a virtual environment called ``vpyenv``!

Exercise 2: work with ``Example-gpu``
-------------------------------------

.. tabs::

   .. tab:: Learning objectives

       - Rehearse creating a Python virtual environment from a step-by-step instruction

   .. tab:: For teachers

       Takes around 7 minutes for an experienced user.

       Installing the packages takes 6 minutes.


This exercise if for UPPMAX users only.

In this exercise, we create another environment ``Example-gpu``
in the same step-by-step fashion as done in exercise 1:

.. mermaid:: isolated_workflow_vpyenv.mmd

This virtual environment called ``Example-gpu`` 
is used for examples where the use of GPUs is demonstrated,
by using the ``numba`` and ``PyTorch`` Python packages.

Because the structure is the same as Exercise 1, see exercise 1 for details.

Exercise 2.1: load the modules needed
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Here we need an older Python module, 
as that is what available on the Snowy computer cluster:

.. code-block:: console

    module load python/3.9.5

Exercise 2.2: create the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: console

    python -m venv --system-site-packages /proj/r-py-jl/<user>/python/Example-gpu

where ``[username]`` is your UPPMAX username, for example ``python -m venv --system-site-packages /proj/r-py-jl/sven/python/Example-gpu``.

Exercise 2.3: activate the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: console

    source /proj/r-py-jl/<user>/python/Example-gpu/bin/activate

where ``[username]`` is your UPPMAX username, for example ``source /proj/r-py-jl/sven/python/Example-gpu/bin/activate``.

Exercise 2.4: install Python packages
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Installing these packages takes around 6 minutes.

.. prompt:: 
    :language: bash
    :prompts: (Example-gpu) $

    pip install --upgrade numpy scipy numba torch

Exercise 2.5: check if the Python packages are installed
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. prompt:: 
    :language: bash
    :prompts: (vpyenv) $

    pip list

Exercise 2.6: use the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Not now :-)

Exercise 2.7: deactivate the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. prompt:: 
    :language: bash
    :prompts: (Example-gpu) $

    deactivate

Exercise 3: export and import a virtual environment
---------------------------------------------------

.. tabs::

   .. tab:: Learning objectives

       - Rehearse creating a Python virtual environment
       - Export a virtual environment from a step-by-step instruction
       - Import a virtual environment from a step-by-step instruction

   .. tab:: For teachers

       Takes around 14 minutes for an experienced user.

       Installing the packages takes 13 minutes.

In this exercise, we export and import a virtual environment.
Additionally, you get to rehearse to create a virtual environment:
as we have done this earlier, the answers will now be hidden :-)

.. mermaid:: isolated_workflow_vpyenv.mmd

Exercise 3.1: load the modules needed
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Step 1: load the modules needed

      Load the modules for Python 3.11.x.

   .. tab:: UPPMAX

      .. code-block:: console

          module load python/3.11.8

   .. tab:: HPC2N

      .. code-block:: console

          module load GCC/12.3.0 Python/3.11.3 

Exercise 3.2: create the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Step 2: create the virtual environment

      Create a virtual environment with the name ``analysis``.

   .. tab:: UPPMAX

      .. code-block:: console

          python -m venv --system-site-packages /proj/r-py-jl/[username]/python/analysis

   .. tab:: HPC2N

      .. code-block:: console

          python -m venv --system-site-packages /proj/nobackup/hpc2n2024-025/[username]/python/analysis 


Exercise 3.3: activate the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Step 3: activate the virtual environment

      Activate the virtual environment.

   .. tab:: UPPMAX

      .. code-block:: console

          source /proj/r-py-jl/[username]/python/analysis/bin/activate

   .. tab:: HPC2N

      .. code-block:: console

          source /proj/nobackup/hpc2n2024-025/[username]/python/analysis/bin/activate

Exercise 3.4: install Python packages
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Installing these packages takes around 13 minutes.

.. tabs::

   .. tab:: Step pre-4: create file

       Create a file called ``requirements.txt``, with the following content:

       .. code-block:: sh

           numpy==1.22.3
           matplotlib==3.5.2
           pandas==1.4.2

   .. tab:: UPPMAX

      Use `any text editor available on UPPMAX <http://docs.uppmax.uu.se/software/text_editors/>`_.

   .. tab:: HPC2N

      Use any text editor, for example, ``nano``.

.. tabs::

   .. tab:: Step 4: install Python packages

       Install packages by using the ``requirements.txt`` file:

      .. code-block:: console

          pip install -r requirements.txt

   .. tab:: UPPMAX

      Yup, just do that:

      .. code-block:: console

          pip install -r requirements.txt

   .. tab:: HPC2N

      Yup, just do that:

      .. code-block:: console

          pip install -r requirements.txt


Exercise 3.5: check if the Python packages are installed
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Step 5: check if the Python packages are installed

       Check that the packages were installed.

   .. tab:: UPPMAX

      .. code-block:: console

          pip list

   .. tab:: HPC2N

      .. code-block:: console

          pip list



Exercise 3.6: use the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Step 6: use the virtual environment

      Export the Python packages our virtual environment uses:

      .. code-block:: console

          pip freeze > requirements.txt

      View the file ``requirements.txt``.

   .. tab:: UPPMAX

      There are many ways to view a file, for example:

      .. code-block:: console

          cat requirements.txt

   .. tab:: HPC2N

      There are many ways to view a file, for example:

      .. code-block:: console

          cat requirements.txt

Exercise 3.7: deactivate the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Step 7: deactivate the virtual environment

       Deactivate the virtual environment

   .. tab:: UPPMAX

      .. code-block:: console

          deactivate

   .. tab:: HPC2N

      .. code-block:: console

          deactivate

Conclusion
----------

.. keypoints::

    You have:

    - heard that virtual environments allows one for independent and isolated 
      set of Python packages
    - heard that there are multiple virtual environments managers:
        - UPPMAX: Conda and ``venv``
        - HPC2N has ``venv``
    - created, activated, used and deactivated virtual environments
    - installed Python packages by using a ``requirements.txt`` file
    - exported the Python packages of a virtual environment

    You may:

    - consider to create a virtual environment per project, 
      to provide for better reproducibility

Links
-----

- UPPMAX's documentation pages about installing Python packages and virtual environments: https://www.uppmax.uu.se/support/user-guides/python-user-guide/
- HPC2N's documentation pages about installing Python packages and virtual environments: https://www.hpc2n.umu.se/resources/software/user_installed/python
- `Video: How to use a Python venv on the Rackham UPPAX cluster (YouTube) <https://youtu.be/OjftEQ23xYk>`_
- `Dependency management from coursePython for Scientific computing <https://aaltoscicomp.github.io/python-for-scicomp/dependencies/>`_
