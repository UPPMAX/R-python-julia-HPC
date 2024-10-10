Introduction Python
===================

`Welcome page and syllabus <https://uppmax.github.io/R-python-julia-HPC/index.html>`_
   - Also link at House symbol |:house:| at top of page 

.. admonition:: **Learning outcomes**
   
   - Load Python modules and site-installed Python packages
   - Create a virtual environment
   - Install Python packages with pip (Kebnekaise, Rackham, Snowy, Cosmos)
   - Write a batch script for running Python
  
.. admonition:: Exercises 

    - You can download the exercises from the course GitHub repo, under the "exercises" -> "python" directory: https://github.com/UPPMAX/R-python-julia-matlab-HPC/tree/main/exercises/python 
    
.. admonition:: **Your expectations?**
   
    - Find best practices for using Python at UPPMAX, HPC2N, and LUNARC
    - Packages
    - Use the HPC performance with Python

 **Not covered**
    
    - Improve python *coding* skills 
    - Other clusters (though they work in a mostly very similar way)

Schedule
--------------------

.. _Comment This is the schedule in Markdown, as voted for on around 2024-09-21:
.. _Comment
.. _Comment Time       |Topic                                                 |Teacher
.. _Comment -----------|------------------------------------------------------|-------
.. _Comment 09:00-09:45|First login                                           |BB + PO+ RB + RP
.. _Comment 09:45-10:00|Break                                                 |.
.. _Comment 10:00-10:10|Syllabus BB, RB,                                      |RP
.. _Comment 10:10-10:20|Python in general BB, RB                              |RP
.. _Comment 10:20-10:50|Load modules and run BB, RB                           |RP
.. _Comment 10:50-11:05|Break                                                 |.
.. _Comment 11:05-11:35|Packages 30/30                                        |RB
.. _Comment 11:35-12:00|Isolated environments (ML, venv, conda) 25/60 mins    |RB
.. _Comment 12:00-13:00|Lunch                                                 |.
.. _Comment 13:00-13:35|Isolated environments (ML, venv, conda) 35/60 mins    |RB
.. _Comment 13:35-14:05|Batch 30/30 mins                                      |BB
.. _Comment 14:05-14:20|Break                                                 |.
.. _Comment 14:20-14:40|GPU                                                   |BB
.. _Comment 14:40-15:10|Simultaneous session 30/30 mins                       |BB * RB * RP
.. _Comment 15:10-15:25|Break                                                 |.
.. _Comment 15:25-16:00|Parallel and multithreaded functions                  |PO
.. _Comment 16:00-16:15|Summary and evaluation                                |RB
.. _Comment 
.. _Comment Simultaneous session:
.. _Comment - Kebnekaise: Jupyter, by BB
.. _Comment - Rackham:  Interactive session and Jupyter, by RB
.. _Comment - LUNARC, by RP

.. list-table:: Course schedule
   :widths: 25 25 50
   :header-rows: 1

   * - Time
     - Topic
     - Teacher(s)
   * - 9:00
     - First login
     - BB + PO + RB + RP
   * - 9:45
     - Break 
     - .
   * - 10:00
     - Syllabus
     - RP
   * - 10:10
     - Python in general
     - RP
   * - 10:20
     - Load modules and run
     - RP
   * - 10:50
     - Break
     - .
   * - 11:05
     - Packages
     - RB
   * - 11:35
     - Isolated environments 1
     - RB
   * - 12:00
     - Lunch
     - .
   * - 13:00
     - Isolated environments 2
     - RB
   * - 13:35
     - Batch
     - BB
   * - 14:05
     - Break
     - .
   * - 14:20
     - GPU
     - BB
   * - 14:40
     - Simultaneous sessions
     - BB * RB * RP
   * - 15:10
     - Break
     - .
   * - 15:25
     - Parallel and multi-threaded functions
     - PO
   * - 16:00
     - Summary and evaluation
     - RB
   * - 16:15
     - End of the day
     - .

Simultaneous session:

    - Kebnekaise: Jupyter, by BB
    - Rackham:  Interactive session and Jupyter, by RB
    - LUNARC, by RP

What is python?
---------------

As you probably already know…
    
    - “Python combines remarkable power with very clear syntax.
    - It has modules, classes, exceptions, very high level dynamic data types, and dynamic typing. 
    - There are interfaces to many system calls and libraries, as well as to various windowing systems. …“

In particular, what sets Python apart from other languages is its fantastic
open-source ecosystem for scientific computing and machine learning with
libraries like NumPy, SciPy, scikit-learn and Pytorch.

- Official Python documentation is found here https://www.python.org/doc/ .
- Python forum is found here https://python-forum.io/ .

Material for improving your programming skills
::::::::::::::::::::::::::::::::::::::::::::::

First level
...........

`The Carpentries <https://carpentries.org/>`_  teaches basic lab skills for research computing.

- `Programming with Python <https://swcarpentry.github.io/python-novice-inflammation/>`_ 

- `Plotting and Programming in Python <http://swcarpentry.github.io/python-novice-gapminder/>`_ 

Second level
::::::::::::

CodeRefinery develops and maintains training material on software best practices for researchers that already write code. Their material addresses all academic disciplines and tries to be as programming language-independent as possible. 

- `Lessons <https://coderefinery.org/lessons/)>`_ 
- `Data visualization using Python <https://coderefinery.github.io/data-visualization-python/>`_
- `Jupyter <https://coderefinery.github.io/jupyter/>`_

Aalto Scientific Computing

- `Data analysis workflows with R and Python <https://aaltoscicomp.github.io/data-analysis-workflows-course/>`_

- `Python for Scientific Computing <https://aaltoscicomp.github.io/python-for-scicomp/>`_ 

   - `Introduction to packages <https://aaltoscicomp.github.io/python-for-scicomp/dependencies/>`_ 


Third level
:::::::::::

`ENCCS (EuroCC National Competence Centre Sweden) <https://enccs.se/>`_ is a national centre that supports industry, public administration and academia accessing and using European supercomputers. They give higher-level training of programming and specific software.

- `High Performance Data Analytics in Python <https://enccs.github.io/hpda-python/)>`_

- The youtube video `Thinking about Concurrency <https://www.youtube.com/watch?v=Bv25Dwe84g0>`_ is a good introduction to writing concurrent programs in Python 

- The book `High Performance Python <https://www.oreilly.com/library/view/high-performance-python/9781492055013/>`_ is a good resource for ways of speeding up Python code.
    
Other NAISS centres
-------------------

- LUNARC
   - `Python <https://lunarc-documentation.readthedocs.io/en/latest/guides/applications/Python/>`_
   - `Jupyter <https://lunarc-documentation.readthedocs.io/en/latest/guides/applications/Python/?query=jupyter#jupyter-lab>`_
- C3SE
   - `Python <https://www.c3se.chalmers.se/documentation/applications/python/>`_
   - `Jupyter <https://www.c3se.chalmers.se/documentation/applications/jupyter/>`_
- NSC
   - `Python <https://www.nsc.liu.se/software/python/>`_
- PDC
   - `Python <https://www.pdc.kth.se/software/software/python/index_general.html>`_

.. objectives:: 

    We will:
    
    - Teach you how to navigate the module system
    - Show you how to find out which versions of Python and packages are installed
    - Use the package handler **pip**
    - Explain how to create and use virtual environments
    - Show you how to run batch jobs 
    - Show some examples with parallel computing and using GPUs

    Most of this will be the same or very similar to how it is done at other HPC centres in Sweden  
 

