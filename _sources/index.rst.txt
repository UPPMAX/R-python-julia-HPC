.. R-python-julia-HPC documentation master file, created by
   sphinx-quickstart on Fri Jan 21 18:24:04 2022.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Introduction to running R, Python, and Julia in HPC
===================================================

.. admonition:: Content

   - This course aims to give a brief, but comprehensive introduction to using Python, Julia and R in an HPC environment.
   - You will learn how to
      - start the **interpreters** of Python, Julia and R by the HPC module system
      - find site **installed packages/libraries**
      - **install packages/libraries** yourself
      - use **virtual** environments
      - use the **computation nodes**
        
         - write batch scripts 
         - work interactivly

   - This course will consist of lectures interspersed with hands-on sessions where you get to try out what you have just learned.    

   - We aim to give this course in **spring and fall every year**.


.. admonition:: Cluster-specific approaches

   - The course is a cooperation between **UPPMAX** (Rackham, Snowy, Bianca) and **HPC2N** (Kebnekaise) and will focus on the compute systems at both centres.
   - Although there are differences we will only have **few seperate sessions**.
   - Most participants will use UPPMAX's systems for the course, as Kebnekaise is only for local (UmU, IRF, MIUN, SLU, LTU) users.
   - The general information given in the course will be true for all/most HPC centres in Sweden. 

      - The examples will often have specific information, like module names and versions, which may vary. What you learn here should help you to make any changes needed for the other centres. 
      - When present, links to the Python/Julia/R documentation at other NAISS centres are given in the corresponding session.


Schedule Spring 2024
--------------------

.. list-table:: 
   :widths: 25 25
   :header-rows: 1

   * - Day
     - Language
   * - Tuesday 12 March
     - Python 
   * - Wednesday 13 March
     - Julia
   * - Thursday 14 March
     - R 
   

Some practicals
---------------

Code of Conduct
:::::::::::::::

We strive to follow the Contributor Covenant Code of Conduct to foster an inclusive and welcoming environment for everyone.

In short:

- Use welcoming and inclusive language
- Be respectful of different viewpoints and experiences
- Gracefully accept constructive criticism
- Focus on what is best for the community
- Show courtesy and respect towards other community members

Furthermore, as this is a hands-on, interactive workshop:

- Be kind to each other and help each other as best you can.
- If you can't help someone or there is some problem, let someone know.

Finally, if you notice something that prevents you from learning as well as you can, let us know and don't suffer silently, even the "little things":

  - Volume too low?
  - Font size too small?
  - Generally confusing instructor?
  - Not enough breaks?

 
.. admonition:: Zoom

    - The course is run over Zoom. You should have gotten an email with the links
        
    - There will be a zoom for the lectures
   
    - When you join the Zoom meeting, use your REAL NAME.
    
    - The lectures and demos will be recorded, but NOT the exercises. 
    
      - If you ask questions during the lectures, you may thus be recorded. 
      - If you do not wish to be recorded, then please keep your microphone muted and your camera off during lectures and write your questions in the Q/A document (see below about Microsoft-365 collaboration document).
    
    - Please MUTE your microphone when you are not speaking and use the “Raise hand” functionality under the “Participants” window during the lecture. Please do not clutter the Zoom chat. Behave politely!

    - There will be **breakout rooms for the exercises**. 
    
      - You may enter there and you will get personal help
      - There will be a "silent" room for those who just want to sit and work
      
    
.. admonition:: Collaboration document (Microsoft-365)

   - .. raw:: html

        <a target='_blank' href="https://umeauniversity.sharepoint.com/:w:/s/HPC2N630/EY1_M9pARplGrJq4N81bkQQB3S4wwb-HcNA2byoKTnMXHw">Q/A collaboration document</a>

   - Use this page for the workshop with your questions.
   - It becomes part of the course and some Q/A:s may be **more relevant to you at a later occasion!!**
   - Depending on how many helpers there are we'll see how fast there are answers. 

        - Some answers may come after the workshop day.

        
.. hint::

   - Main project on UPPMAX:
     
        - Project ID: ``naiss2024-22-107``
        - Directory name on rackham: ``/proj/r-py-jl``
        - Please create a suitably named subdirectory below ``/proj/r-py-jl``, for your own exercises. 
   

   - Local project on HPC2N: 

        - Project ID: ``hpc2n2024-025``
        - Directory name on Kebnekaise: ``/proj/nobackup/hpc2n2024-025``
        - Please create a suitably named subdirectory below ``/proj/nobackup/hpc2n2024-025``, for your own exercises.

   
Example of screen arrangement
:::::::::::::::::::::::::::::

If you only have one screen to work with for the course, try to fit: 

.. code-block:: sh

   ╔════════════╗ ╔══════════════╗
   ║            ║ ║  TERMINAL    ║
   ║            ║ ║   WINDOW     ║
   ║   ZOOM     ║ ╚══════════════╝
   ║  WINDOW    ║ ╔══════════════╗
   ║            ║ ║   BROWSER    ║
   ║            ║ ║  W/MATERIAL  ║
   ╚════════════╝ ╚══════════════╝

.. warning::

   - **Please be sure that you have gone through the `pre-requirements <https://uppmax.github.io/R-python-julia-HPC/prereqs.html>`_**
   - It mentions the familiarity with the LINUX command line.
   - The applications to connect to the clusters
      - terminals
      - remote graphical desktop ThinLinc
 
Material for improving your programming skills
----------------------------------------------

- This course does not aim to improve your coding skills.
- Rather you will learn to understand the ecosystems and navigations for the the different languages on a HPC cluster.

See the pre-requirements, section `Coding <https://uppmax.github.io/R-python-julia-HPC/prereqs.html#coding>`_

Briefly about the cluster hardware and system at UPPMAX and HPC2N
-----------------------------------------------------------------

**What is a cluster?**

- Login nodes and calculations/computation nodes

- A network of computers, each computer working as a **node**.
     
- Each node contains several processor cores and RAM and a local disk called scratch.

.. figure:: ../img/node.png
   :align: center

- The user logs in to **login nodes**  via Internet through ssh or Thinlinc.

  - Here the file management and lighter data analysis can be performed.

.. figure:: ../img/nodes.png
   :align: center

- The **calculation nodes** have to be used for intense computing. 

The two HPC centers UPPMAX and HPC2N
====================================

.. admonition:: Two HPC centers

   - There are many similarities:
   
     - Login vs. calculation/compute nodes
     - Environmental module system with software hidden until loaded with ``module load``
     - Slurm batch job and scheduling system
     - ``pip install`` procedure
     
   - ... and small differences:
   
     - commands to load Python, Python packages, R, Julia
     - slightly different flags to Slurm
     
   - ... and some bigger differences:
   
     - UPPMAX has three different clusters 

       - Rackham for general purpose computing on CPUs only
       - Snowy available for local projects and suits long jobs (< 1 month) and has GPUs
       - Bianca for sensitive data and has GPUs

   - HPC2N has Kebnekaise with GPUs  
   - Conda is recommended only for UPPMAX users
    
.. warning:: 

   - At both HPC2N and UPPMAX we call the applications available via the *module system* **modules**. 
   - https://www.uppmax.uu.se/resources/software/module-system/ 
   - https://www.hpc2n.umu.se/documentation/environment/lmod
   
   To distinguish these modules from the **python** *modules* that work as libraries we refer to the later ones as **packages**.

.. seealso::

   - Details about the systems 
     - https://uppmax.github.io/R-python-julia-HPC/prereqs.html#common-features
     - and below

Prepare your environment now!
-----------------------------

.. type-along::
  
   - Please log in to Rackham, Kebnekaise or other cluster that you are using.

   .. admonition:: Use Thinlinc or terminal?

      - It is up to you!
      - Graphics come easier with Thinlinc
      - For this course, when having many windows open, it may be better to run in terminal, for screen space issues.


   .. tabs::

      .. tab:: UPPMAX

         1. Log in to Rackham!

           - Terminal: ``ssh -X <user>@rackham.uppmax.uu.se`` 
      
           - ThinLinc app: ``<user>@rackham-gui.uppmax.uu.se``
           - ThinLinc in web browser: ``https://rackham-gui.uppmax.uu.se``
      
         2. If not already: **create a working directory** where you can code along.

           - We recommend creating it under the course project storage directory
   
         3. Example. If your username is "mrspock" and you are at UPPMAX, then we recommend you create this folder: 
     
            .. code-block:: console
         
               $ mkdir /proj/r-py-jl/mrspock/
               $ mkdir /proj/naiss2024-22-107/mrspock/

      .. tab:: HPC2N

         - Kebnekaise through terminal: ``<user>@kebnekaise.hpc2n.umu.se``     
         - Kebnekaise through ThinLinc, use: ``<user>@kebnekaise-tl.hpc2n.umu.se``
   
         - Create a working directory where you can code along.    
      
           - Example. If your username is bbrydsoe and you are at HPC2N, then we recommend you create this folder: 
     
           .. code-block:: console
         
              $ /proj/nobackup/hpc2n2023-110/bbrydsoe/

         
Content of the course
---------------------

.. toctree::
   :maxdepth: 2
   :caption: Pre-requirements:

   prereqs.md

.. toctree::
   :maxdepth: 2
   :caption: Python Lessons:

   python/intro.rst
   python/load_runPython.rst
   python/packages.rst
   python/isolated.rst
   python/batchPython.md
   python/GPU.rst
   python/interactivePython.md
   python/jupyter.md
   common/parallel.rst
   python/condaUPPMAX.rst
   python/exercisesPython.rst
   python/summaryPython.rst
   
.. toctree::
   :maxdepth: 2
   :caption: Julia Lessons:

   julia/introJulia.rst
   julia/load_runJulia.rst
   julia/isolatedJulia.rst
   julia/batchJulia.rst
   common/parallel.rst
   julia/interactiveJulia.rst
   julia/exercisesJulia.rst
   julia/summaryJulia.rst
   
.. toctree::
   :maxdepth: 2
   :caption: R Lessons:

   r/introR.rst
   r/load_runR.rst
   r/packagesR.rst
   r/isolatedR
   r/batchR.rst
   common/parallel.rst
   r/MLR.rst
   r/interactiveR.rst
   r/rstudio.rst
   r/exercisesR.rst
   r/summaryR.rst

.. toctree::
   :maxdepth: 2
   :caption: COMMON:

   common/parallel.rst

.. toctree::
   :maxdepth: 2
   :caption: Reference:


.. Indices and tables
.. ==================

.. * :ref:`genindex`
.. * :ref:`modindex`
.. * :ref:`search`
