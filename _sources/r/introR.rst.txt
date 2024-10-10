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

   - On HPC2N, you can copy the R exercise tarball from /proj/nobackup/r-py-jl-m/exercises-r.tar.gz 
   - On UPPMAX, you can copy the R exercise tarball from /proj/r-py-jl-m-rackham/exercises-r.tar.gz 
   - On LUNARC, you can copy the R exercise tarball from 


Schedule
--------------------

.. mermaid::  intro_r_overview_course_login_and_scheduler.mmd

.. mermaid::  intro_r_overview_course_r_and_modules.mmd

..
    _Comment This is the schedule as decided around 2024-09-23:

    Time       |Topic                          |Teacher
    -----------|-------------------------------|-------
    09:00-09:45|First login                    |BB + PO + RB
    09:45-10:00|Break                          |.
    10:00-10:10|Syllabus                       |RB
    10:10-10:20|R in general                   |RB
    10:20-10:45|Load modules and run           |RB
    10:45-11:00|Break                          |.
    11:00-11:30|Packages 30/30                 |BB
    11:30-12:00|Isolated environments          |BB
    12:00-13:00|Lunch                          |.
    13:00-13:30|Batch 30/30 mins               |BB
    13:30-14:15|Parallel                       |PO
    14:15-14:30|Break                          |.
    14:30-15:15|Simultaneous session 45/45 mins|PO * RB
    15:15-15:30|Break                          |.
    15:30-16:00|Machine learning               |BB or PO
    16:00-16:15|Summary and evaluation         |RB

    Parallel session:
     - HPC2N: ThinLinc & RStudio, by PO
     - UPPMAX: ThinLinc, RStudio, interactive, by RB
     - ?LUNARC, by ?RP

.. list-table:: Schedule
   :widths: 25 25 50
   :header-rows: 1

   * - Time
     - Topic
     - Teacher(s)
   * - 9:00
     - First login
     - BB + PO + RB
   * - 9:45
     - Break
     - .
   * - 10:00
     - First login
     - BB + PO + RB
   * - 10:10
     - Syllabus
     - RB
   * - 10:20
     - Load modules and run
     - RB
   * - 10:45
     - Break
     - .
   * - 11:00
     - Packages
     - BB
   * - 11:30
     - Isolated environments
     - BB
   * - 12:00
     - Lunch
     - .
   * - 13:00
     - Batch
     - BB
   * - 13:30
     - Parallel
     - PO
   * - 14:15
     - Break  
     - .
   * - 14:30
     - Simultaneous session
     - PO * RB * ?RP
   * - 15:15
     - Break
     - .
   * - 15:30
     - Machine learning
     - BB or PO
   * - 16:00
     - Summary and evaluation
     - RB
   * - 16:15
     - Done
     - .

Simultaneous session:

 - HPC2N: ThinLinc & RStudio, by PO
 - UPPMAX: ThinLinc, RStudio, interactive, by RB
 - LUNARC, by ?RP

