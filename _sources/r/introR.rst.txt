Introduction R
==============

.. figure:: img/r_logo_50.png

.. tabs::

   .. tab:: Learning objectives

      - see a first overview of the R programming language
      - see the overview of the course

   .. tab:: For teachers

      Teaching goals are:

      - Learners have seen an overview of the course
      - Learners have seen an first overview of the R programming language

      Lesson plan (20 minutes in total):

      - 2 min: discuss random people with videos, based on recommendation by [Bell, Mike. The fundamentals of teaching: A five-step model to put the research evidence into practice. Routledge, 2020]
      - 5 mins: prior knowledge
         - What is R?
         - Why use R?
         - What are features of R?
         - Can R do everything?
         - What are R packages?
      - 5 mins: presentation: First overview of R
      - 5 mins: presentation: Course schedule
      - 3 mins: feedback

.. admonition:: **Course learning objectives**
 
    - use the module system to load R
    - use the module system to load site-installed R packages
    - find out which versions of R and packages are installed
    - run R scripts
    - write a batch script for running R
    - install R packages from CRAN
    - see how to install other R packages yourself
    - start batch jobs 
    - run RStudio

    on HPC2N or UPPMAX


.. admonition:: **Course non-goals**

    - improve R coding skills 
    - use R on other HPC clusters


First overview of R
-------------------

R is a programming language for statistical computing and data visualization
(from `Wikipedia <https://en.wikipedia.org/wiki/R_(programming_language>`_).

.. mermaid:: intro_r_overview_r.mmd 

The main general R resources are:

- `The R homepage <https://www.r-project.org/>`_
- `The official R documentation <https://cran.r-project.org/manuals.html>`_
- `The CRAN homepage <https://cran.r-project.org/>`_ (with `a list of CRAN mirrors <https://cran.r-project.org/mirrors.html>`_)

R is used in many NAISS centres:

- `here is an overview of 6 NAISS centres and their R documentation <http://docs.uppmax.uu.se/software/r/#overview-of-naiss-centers-and-their-documentation-about-r>`_
- `here is an (incomplete) overview of R courses being taught at NAISS <http://docs.uppmax.uu.se/software/r/#learning-r>`_

.. admonition:: R Exercise files

   - On HPC2N, you can copy the R exercise tarball from /proj/nobackup/hpc2n2024-025/exercises-r.tar.gz 
   - On UPPMAX, you can copy the R exercise tarball from /proj/naiss2024-22-107/exercises-r.tar.gz 


Preliminary schedule
--------------------

.. mermaid::  intro_r_overview_course_login_and_scheduler.mmd

.. mermaid::  intro_r_overview_course_r_and_modules.mmd

.. list-table:: Preliminary times
   :widths: 25 25 50
   :header-rows: 1

   * - Time
     - Topic
     - Activity
   * - 9:00
     - Syllabus 
     - 10m
   * - 9:10
     - Introduction, R in general
     - Lecture 10 m 
   * - 9:20
     - Loading modules and running R codes 
     - Lecture+code along 25m
   * - 9:45
     - **Coffee break**
     - 
   * - 10:00
     - Packages
     - Lecture+code along 30m
   * - 10.30
     - Isolated environments
     - Lecture+code along 20m
   * - 10:50
     - **break**
     - 
   * - 11:00
     - SLURM Batch scripts for R jobs  
     - Lecture+code along + exercise 30m
   * - 11:30
     - Parallel and multithreaded functions
     - Lecture+code along 35m   
   * - 12:00
     - **LUNCH**
     -
   * - 13.00
     - Exercises and informal chat (or break) 
     - 
   * - 13.15
     - ML  
     - Lecture+code along 35m
   * - 13:50
     - **break**
     - 
   * - 14.00
     - Parallel session - HPC2N: ThinLinc & RStudio 
     - Lecture+code along 25m
   * - 
     - Parallel session - UPPMAX: Interactive/ThinLinc & RStudio
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
   * - 15:00
     - END
     -
