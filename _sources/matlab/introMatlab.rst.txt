Introduction to MATLAB
======================

`Welcome page and syllabus <https://uppmax.github.io/R-python-julia-matlab-HPC/>`_
   - Also link at House symbol |:house:| at top of page 

.. admonition:: Learning outcomes
   
   - Load MATLAB modules and site-installed MATLAB packages
   - Create a MATLAB environment
   - Install MATLAB packages with **Add-Ons** manager
   - Write a batch script for running MATLAB
   - Use MATLAB in parallel mode
   - Use GPUs with MATLAB
   - Use MATLAB for ML 
    
.. admonition:: Your expectations?
   
    - Find best practices for using MATLAB at UPPMAX and HPC2N
    - Toolboxes and Add-Ons
    - HPC performance with MATLAB

    
    **Not covered**
    
    - Improve MATLAB *coding* skills 
    - Other clusters
      
.. admonition:: MATLAB Exercise files

    - At HPC2N, you can copy the MATLAB exercises in a tarball 
      from ``/proj/nobackup/r-py-jl-m/MatlabExercises.tar.gz``
    - At UPPMAX you can copy the exercises in a tarball 
      from ``/proj/r-py-jl-m-rackham/MatlabExercises.tar.gz``
    - At LUNARC, you can copy the exercises in a tarball
      from ``/lunarc/nobackup/projects/TBD...``

.. challenge:: Download the exercise files

    - Copy the file and un-tar it in your personal project folder, which you should have created a while ago (https://uppmax.github.io/R-python-julia-matlab-HPC/index.html#prepare-your-environment-now). Then, enter the directory and list the content with the ``tree`` command.

    .. code-block:: bash

       cd /proj/r-py-jl-m-rackham/<your-name>   # on Kebnekaise: cd /proj/nobackup/r-py-jl-m/<your-name>
       cp ../MatlabExercises.tar .
       tar xvf MatlabExercises.tar
       tree Matlab


Preliminary schedule
--------------------

.. list-table:: Preliminary times
   :widths: 25 25 50
   :header-rows: 1

   * - Time
     - Topic
     - Activity
   * - 9:00
     - Syllabus 
     - 10m
   * - 9.10
     - Introduction, MATLAB in general
     - Lecture 20 m 
   * - 9.30
     - Loading modules and running MATLAB codes 
     - Lecture+code along 30m
   * - 9.45
     - **Coffee break**
     - 
   * - 10.00
     - Packages and isolated environments   
     - Lecture+code along 45m
   * - 10.55
     - **break**
     - 
   * - 11.05
     - SLURM Batch scripts for MATLAB jobs  
     - Lecture+code along + exercise 45m
   * - 11.50
     - Exercises and informal chat
     - 
   * - 12.00
     - **LUNCH**
     -
   * - 13.00
     - Exercises and informal chat
     - 
   * - 13.15
     - Parallel and multithreaded functions   
     - Lecture+code along + exercise 30m
   * - 13.50
     - **break**
     - 
   * - 14.00
     - Parallel session — UPPMAX: Interactive work
     - Lecture+code along 25m
   * - .
     - Parallel session — HPC2N: Interactive work
     - Lecture+code along 25m   
   * - .
     - Parallel session — LUNARC: Interactive work
     - Lecture+code along 25m  
   * - 14.25
     - Summary 
     -
   * - 14.35
     - Evaluation
     -
   * - 14.45
     - Q&A on-demand
     -
   * - 15.00
     - END
     -

.. instructor-note::

   - Intro 10 min 
   - Lecture and demo 10 min
   - Exercise 0 min



What is MATLAB?
--------------
MATLAB is a numerical computing environment and fourth generation programming language. Developed by MathWorks, MATLAB allows matrix manipulation, plotting of functions and data, implementation of algorithms, creation of user interfaces, and interfacing with programs in other languages. Although it is numeric only, an optional toolbox uses the MuPAD symbolic engine, allowing access to computer algebra capabilities.


Features of MATLAB
-----------------

Distinguishing pros of MATLAB include:
   - A "low-code" interactive development environment (IDE) in which many common data import methods, analysis techniques, plotting formats, and even AI/ML techniques can be run from menus and generate the code required to reproduce the results automatically
   - A rich library of Toolboxes and Add-Ons for different STEM disciplines, especially for modeling and simulations, all written and tested by professionals
   - Automatic multi-threading (note: this can also be a drawback)
   - The ability to set cluster configurations and parallelization settings graphically, and save them to profiles that can be reloaded at a click.
   - Full documentation available straight from the command line (requires internet)

Of course MATLAB also has some drawbacks:
   - It is proprietary software, so you need to buy a license and sign up for an account. Many Add-Ons require a separate license.
   - With respect to the 2-language problem (where one can optimize for either performance or ease of prototyping, but not both), MATLAB even moreso than Python is geared toward usability. It can be slow.
   - The way MATLAB automates multithreading means it will hog a full node unless you explicitly tell it not to by setting `-SingleCompThread` as an option at startup. 
   - The built-in plotting functions generate only very low-resolution raster graphics with no anti-aliasing, not suitable for publication.


More on MATLAB?
--------------

- Documentation at the HPC centres UPPMAX and HPC2N
   - UPPMAX: http://docs.uppmax.uu.se/software/matlab/
   - HPC2N: https://www.hpc2n.umu.se/resources/software/matlab and https://www.hpc2n.umu.se/documentation/guides/parallel-matlab
   - LUNARC: https://lunarc-documentation.readthedocs.io/en/latest/guides/applications/MATLAB/
- Official MATLAB documentation is found `here: <https://se.mathworks.com/help/matlab/index.html?s_tid=hc_panel>`_

Material for improving your programming skills
::::::::::::::::::::::::::::::::::::::::::::::

If you have a Mathworks account that is less than 2 years old, you can take advantage of Mathworks' free MATLAB self-paced online training courses at <https://matlabacademy.mathworks.com/?page=1&fq=all-matlab&sort=featured&s_tid=ln_acad_learn_oc>_. At any academic institution with a campus-wide license, students can use their university email addresses to create a free account to access these resources.

There is also the Mondays with MATLAB lecture series every September, which along with other events gets posted here: <https://se.mathworks.com/company/events.html>_. These tend to be the more introductory-level seminars.  If you have an account, you will be automatically signed up for the Mathworks mailing list, which will notify you of upcoming webinars as well as some featured packages. The webinars cover a broad range of topics and disciplines at varying skill levels, although these seminars on average tend to be fairly advanced.


Other NAISS centres
-------------------

- NSC
   - `MATLAB <https://www.nsc.liu.se/software/catalogue/tetralith/modules/matlab.html>`_
- PDC
   - `MATLAB <https://www.pdc.kth.se/software/software/matlab/index_general.html>`_

.. keypoints::

   - MATLAB is a 4th generation language with an interactive environment that can generate code that handles common problems for you.
   - Parallelization is easy with the graphic user interface, but be careful to set ``-SingleCompThread`` when starting it at the command line or it may hog the nodes.

