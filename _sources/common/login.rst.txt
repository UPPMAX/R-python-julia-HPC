Log in session 
==============

.. admonition:: Cluster-specific approaches

   - The course is a cooperation between **UPPMAX** (Rackham, Snowy, Bianca), **HPC2N** (Kebnekaise) and **LUNARC** (Cosmos) and will focus on the compute systems at all these centres.
   - Although there are differences we will only have **few seperate sessions**.
   - Most participants will use UPPMAX's systems for the course, as Kebnekaise and Cosmos are only for local (UmU, IRF, MIUN, SLU, LTU, LU) users.
   - The general information given in the course will be true for all/most HPC centres in Sweden. 

      - The examples will often have specific information, like module names and versions, which may vary. What you learn here should help you to make any changes needed for the other centres. 
      - When present, links to the Python/Julia/R/Matlab documentation at other NAISS centres are given in the corresponding session.

.. info::

   - You were invited to be part of the course project for Rackham/Snowy (UPPMAX).
   - If you already have research projects in any of the clusters you can use them. The CPU-hours required during the course will be low!

.. admonition:: **Learning outcomes**
   
   - Be able to login, where you are

.. tip:: 

   - If you have user account and _research_ project on Kebnekaise, follow the **HPC2N** track below.
   - If you have user account and _research_ project on Cosmos, follow the **LUNARC** track below.
   - If you have user account and course/research project on Rackham, follow the **UPPMAX** track below.


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

      .. tab:: LUNARC

         - Cosmos through terminal: ``<user>@cosmos.lunarc.lu.se``     
         - Cosmos through ThinLinc, use: ``<user>@cosmos-dt.lunarc.lu.se``

         - Create a working directory where you can code along.    
      
           - Example. If your username is bbrydsoe and you are at HPC2N, then we recommend you create this folder: 
     
           .. code-block:: console
         
              $ /proj/nobackup/hpc2n2023-110/bbrydsoe/
