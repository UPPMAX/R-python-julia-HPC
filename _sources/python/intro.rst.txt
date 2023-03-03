Introduction Python
===================

`Welcome page and syllabus <https://uppmax.github.io/R-python-julia-HPC/index.html>`_
   - Also link at House symbol |:house:| at top of page 

.. admonition:: **Learning outcomes**
   
   - Load Python modules and site-installed Python packages
   - Create a virtual environment
   - Install Python packages with pip (Kebnekaise, Rackham, Snowy)
   - Install Python packages with conda (Bianca)
   - Write a batch script for running Python

  
.. admonition:: Exercises **FIX**

    - You can download the exercises from the course GitHub repo, under the "Exercises" directory: https://github.com/UPPMAX/R-python-julia-HPC 
    
.. admonition:: **Your expectations?**
   
    - Find best practices for using Python at UPPMAX and HPC2N
    - Packages
    - Use the HPC performance with Python

 **Not covered**
    
    - Improve python *coding* skills 
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
     - 15m
   * - 9.15
     - Introduction 
     - Lecture 10 m 
   * - 9.25
     - Loading modules and running Python codes 
     - Lecture+code along 15m
   * - 9.40
     - Dealing with packages  
     - Lecture+code along 20m
   * - 10.00
     - **Coffee**
     - 
   * - 10.15
     - Dealing with packages (Conda)
     - Lecture+code along 15m
   * - 10.30
     - Isolated environments
     - Lecture+code along 30m
   * - 11.00
     - **Short leg stretch**
     - 
   * - 11.05
     - SLURM Batch scripts for Python jobs  
     - Lecture+code along 25m
   * - 11.30
     - Interactive work on the compute nodes
     - Lecture+code along 15m
   * - 11.45
     - Additional exercises 
     - exercises 20m
   * - 12.05
     - **Short leg stretch**
     - 
   * - 12.10
     - Summary 
     - 10m
   * - 12.20
     - Q&A on-demand
     - 10m
   * - 12.30
     - END
     -
    

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
- A nice introduction to packages can be found here: https://aaltoscicomp.github.io/python-for-scicomp/dependencies/
- CodeRefinery develops and maintains training material on software best practices for researchers that already write code. Ther material addresses all academic disciplines and tries to be as programming language-independent as possible. https://coderefinery.org/lessons/
- The youtube video `Thinking about Concurrency <https://www.youtube.com/watch?v=Bv25Dwe84g0>`_ is a good introduction to writing concurrent programs in Python 
- The book `High Performance Python <https://www.oreilly.com/library/view/high-performance-python/9781492055013/>`_ is a good resource for ways of speeding up Python code.
    

.. objectives:: 

    We will:
    
    - Teach you how to navigate the module system at UPPMAX (and HPC2N)
    - Show you how to find out which versions of Python and packages are installed
    - Look at the package handler **pip** (and **Conda** for UPPMAX)
    - Explain how to create and use virtual environments
    - Show you how to run batch jobs 
    - Show some examples with parallel computing and using GPUs

 

