Introduction Julia
==================

`Welcome page and syllabus <https://uppmax.github.io/HPC-python/index.html>`_
   - Also link at House symbol |:house:| at top of page 

.. admonition:: **Learning outcomes**
   
   - Load Julia modules and site-installed Julia packages
   - Create a Julia environment
   - Install Julia packages with **Pkg**
   - Write a batch script for running Julia
   - Use Julia in parallel mode
   - Use GPUs with Julia
   - Use Julia for ML 

          
    
.. admonition:: **Your expectations?**
   
    - find best practices for using Julia at UPPMAX and HPC2N
    - packages
    - use the HPC performance with Julia

    
    **Not covered**
    
    - improve Julia *coding* skills 
    - Other clusters

        

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
     - Introduction 
     - Lecture 10 m 
   * - 9.20
     - Loading modules and running Julia codes 
     - Lecture+code along 20m
   * - 9.40
     - Packages and isolated environments   
     - Lecture+code along 20m
   * - 10.00
     - **Coffee**
     - 
   * - 10.15
     - More on Packages
     - Lecture+code along 30m
   * - 10.45
     - SLURM Batch scripts for Julia jobs  
     - Lecture+code along + exercise 25m
   * - 11.10
     - **Short leg stretch**
     - 
   * - 11.15
     - Interactive work on the compute nodes
     - Lecture+code along 15m
   * - 11.30
     - Exercises
     - Exercises 20m
   * - 11.50
     - **Short leg stretch**
     - 
   * - 11.55
     - Summary 
     -
   * - 12.05
     - Q&A on-demand
     -
   * - 12.15
     - END
     -


What is Julia?
--------------

Julia is a relatively new Programming language (pre-released 1.0 announced in
1)    compared to well-known and standard languages such as Fortran, C, C++, R,
and Python (some of them dated back to the 70's). A common pattern in those
well-stablished languages (traditional paradigm) is that they look after either 
productivity (fast deployment, fast prototyping) or performance (fast numerical 
computations). 

This pattern created the so called **two-language problem** where programmers
had to choose between **productivity** (R, Python) or **performance** (Fortran, C/C++)
and when both were needed programmers had to learn the language that offered 
the desired capability and use some interface between different languages. 
Performant languages traditionally needed to be compiled while languages focusing
on productivity are interpreted.

Among the different features of Julia, is its capability of integrating
both aspects productivity and performance into a single language. In this way,
Julia programmers can in principle write software without changing their
focus to learn a new language. 


.. figure:: ../../img/two-language.png
   :width: 450
   :align: center

   Two-language problem where Julia is shown as a bridge between the languages
   in the traditional paradigms, productivity vs. performance. 

Workflow in Julia
-----------------

After loading the appropriate modules for Julia, you will have access to the
read-eval-print-loop (REPL) command line by typing ``julia``: 

.. tabs::

   .. tab:: UPPMAX 

        .. code-block:: julia-repl
         
         $ ml julia/1.8.5
         $ julia 

            _       _ _(_)_     |  Documentation: https://docs.julialang.org
           (_)     | (_) (_)    |
            _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
           | | | | | | |/ _` |  |
           | | |_| | | | (_| |  |  Version 1.8.5 (2023-01-08)
          _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
         |__/                   |

         julia> 


   .. tab:: HPC2N

        .. code-block:: julia-repl
         
         $ ml Julia/1.8.5-linux-x86_64
         $ julia 

            _       _ _(_)_     |  Documentation: https://docs.julialang.org
           (_)     | (_) (_)    |
            _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
           | | | | | | |/ _` |  |
           | | |_| | | | (_| |  |  Version 1.8.5 (2023-01-08)
          _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
         |__/                   |

         julia> 

Julia has different modes, the one mentioned above is the so-called ``Julian`` mode
where one can execute commands. The description for accessing these modes will be
given in the following paragraphs. Once you are done with your work in any of the modes,
you can return to the ``Julian`` mode by pressing the ``backspace`` key.

While being on the Julian mode you can enter the ``shell`` mode by typing ``;``:

.. code-block:: julia

   julia>; 
   shell>pwd
   /current-folder-path

this will allow you to use Linux commands. Notice that the availabilty of these commands
depend on the OS, for instance, on Windows it will depend on the terminal that you have
installed and if it is visible to the Julia installation. 

Another mode available in Julia is the ``package manager`` mode, it can be accessed by typing ``]`` in the ``Julian`` mode:

.. code-block:: julia-repl

   julia>]
   (v1.8) pkg>

this will make your interaction with the package manager **Pkg** easier, for instance,
instead of typing the complete name of **Pkg** commands such as ``Pkg.status()`` in the
``Julian`` mode, you can just type ``status`` in the ``package`` mode. 

The last mode is the ``help`` mode, you can enter this mode from the ``Julian`` one by
typing ``?``, then you may type some string from which you need more information:

.. code-block:: julia-repl

   julia>?
   help?> ans
   search: ans transpose transcode contains expanduser instances MathConstants readlines LinearIndices leading_ones leading_zeros

   ans

   A variable referring to the last computed value, automatically set at the interactive prompt.


More detailed information about the modes in Julia can be found here: https://docs.julialang.org/en/v1/stdlib/REPL/


Features of Julia
-----------------

According to the Julia documentation (https://docs.julialang.org/en/v1/) some of
the features of this language are:

- Good Base library with efficiently implemented operations written in Julia itself
- "Good performance, approaching that of statically-compiled languages like C"
- Modular and self-contained approach for libraries and development
- "A rich language of types for constructing and describing objects"
- A fast growing community of users and developers

Shortcomings of Julia
---------------------

- As this is a new language, the libraries ecosystem is not as rich as in Python or R, for instance
- Currently, using Julia for simple tasks (for instance, opening a file and writing text, plotting) is not as
  efficient as using Linux tools (AWK, GREP) or compiled languages (Fortran, C/C++, Rust)
- Previous situation is more noticeable upon running simple tasks in parallel mode (MPI, Threads)
  

Exercises
---------


.. challenge:: Getting familiar with Julia REPL
    
    Is is important in this course that you know how to navigate on the 
    Julia command line. This exercise will help you to become more familiar
    with the REPL. Do the following steps: 

       * Start a Julia session. In the ``Julian`` mode, compute the sum the numbers 
         5 and 6
       * Change to the ``shell`` mode and display the current directory
       * Now, go to the ``package`` mode and list the currently installed packages
       * Finally, display help information of the function ``println`` in ``help`` mode.



    .. solution:: Solution for centres
        :class: dropdown
            
            .. code-block:: julia
    
                $ julia 
                julia> 5 + 6
                julia>;
                shell> pwd 
                julia>]
                pkg> status 
                julia>?
                help?> println


More on Julia?
--------------

- Documentation at the HPC centres UPPMAX and HPC2N
   - UPPMAX: https://www.uppmax.uu.se/support/user-guides/julia-user-guide/
   - HPC2N: https://www.hpc2n.umu.se/resources/software/julia
- Official Julia documentation is found here: https://docs.julialang.org/en/v1/
- Slack channel for Julia and instructions for joining it are found here: https://julialang.org/slack/
- HPC2N YouTube video on Julia in HPC: https://www.youtube.com/watch?v=bXHe7Kj3Xxg
- Julia for High Performance Computing course material from ENCCS: https://enccs.github.io/Julia-for-HPC/

.. keypoints::

   - Julia is a relatively new language with several attractive features.
   - It offers several modes that can make your workflow easier, i.e., ``Julian``, 
     ``shell``, ``package manager``, and ``help`` modes.

