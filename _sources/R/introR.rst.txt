Introduction R
===================

`Welcome page and syllabus <https://uppmax.github.io/R-python-julia-HPC/index.html>`_
   - Also link by clicking the logo at the top left of the page 

.. admonition:: **Learning outcomes**
   
   - Load R modules and site-installed R packages
   - Install R packages from CRAN - automatic download and install
   - Write a batchscript for running R
   - Using Rstudio
   
        
.. admonition:: Exercises

    - You can download the exercises from the course GitHub repo, under the
      "Exercises" directory:
      https://github.com/UPPMAX/R-python-julia-HPC/tree/main/Exercises
    - On HPC2N, you can copy the exercises in a tarball from TBC
    - On UPPMAX you can copy the exercises in a tarball from TBC

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
     - Introduction to R
     - Lecture 10 m 
   * - 9.20
     - Load and run R 
     - Lecture+code along 20m
   * - 9.40
     - Packages and virtual environments
     - Lecture+code along 20m
   * - 10.00
     - **Coffee**
     - 
   * - 10.15
     - SLURM Batch scripts for R jobs  
     - Lecture+code along + exercise 25m
   * - 10.40
     - Interactive jobs
     - Lecture+code along + exercise 15m
   * - 10.55
     - **Short leg stretch**
     -
   * - 11.00
     - Rstudio
     - Lecture+code along 10m
   * - 11.10
     - Additional exercises
     - 25m
   * - 11.40
     - Summary 
     -
   * - 11.50
     - Q&A on-demand
     -
   * - 12.00
     - END
     -

       
What is R?
---------------

As you probably already know…
    
    - R is a programming language for statistical computing and graphics. 
    - R's data structures include vectors, arrays, lists, and data frames.
    - R is an interpreted language; users can access it through a command-line
      interpreter.
    - It supports procedural programming with functions and, for some
      functions, object-oriented programming with generic functions. 
    - It has many user-created packages to augment the functions of the R
      language. These packages offer statistical techniques, graphical devices,
      import/export, reporting (RMarkdown, knitr, Sweave), etc.
    - It is one of the most commonly used programming languages in data mining.

In short; R has statistics-related libraries of a great variety and provides a
good environment for statistical computing and design. Also, the R programming
language is very useful for data importing and cleaning.

- The home page of "The R Project for Statistical Computing" is here:
  https://www.r-project.org/
- Official R documentation is found here:
  https://cran.r-project.org/manuals.html
- A list of CRAN (The Comprehensive R Archive Network) is here:
  https://cran.r-project.org/mirrors.html
- Data analysis workflows with R and Python:
  https://aaltoscicomp.github.io/data-analysis-workflows-course/
- CodeRefinery develops and maintains training material on software best
  practices for researchers that already write code. Their material addresses
  all academic disciplines and tries to be as programming language-independent
  as possible. https://coderefinery.org/lessons/
    

.. objectives:: 

    We will:
    
    - teach you how to navigate the module system at HPC2N and UPPMAX
    - show you how to find out which versions of R and packages are installed
    - look at how to install other R packages yourself
    - show you how to run batch jobs 
    - show some examples on using R 
    - Show you how to start up Rstudio and give a brief intro to the tool 

