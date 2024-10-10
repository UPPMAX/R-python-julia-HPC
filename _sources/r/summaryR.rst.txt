Summary
=======

.. keypoints::

   - Load and run
      - Use the desired ``R`` version from the module system e.g. ``module load  R/4.1.1``
      - Use ``Rscript`` to run a script or ``R`` to start the interpreter/REPL

   - Packages
      - Always check for preinstalled packages e.g. ``R_packages`` on UPPMAX 
         
         - use ``library(<pkg-name>)`` to see if available

   - Isolated environments 
      - With a virtual environment you can tailor an environment with specific
        versions.
      - You can make it for each project you have for reproducibility using
        ``renv`` or ``conda`` on UPPMAX.
   - Batch mode
      - The SLURM scheduler handles allocations to the calculation nodes
      - Batch jobs runs without interaction with user
      - A batch script consists of a part with *SLURM parameters* describing
        the allocation and a second part describing the actual work within the
        job, for instance one or several R scripts.
      - Remember to include possible input arguments to the R script in
        the batch script.
   
   - Interactive work on calculation nodes
      - Start an interactive session on a calculation node by a SLURM
        allocation (similar flags)

         - At HPC2N: ``salloc`` ...
         - At UPPMAX: ``interactive`` ...

      - Follow the same procedure as usual by loading the R module and
        possible prerequisites.
   - Using RStudio
      - Rstudio is available both on UPPMAX and HPC2N and works well through a
        graphical ThinLinc Session.


.. challenge:: Not really clear? (5 min)

    - Discuss in breakout rooms
    - Learn from each other

.. seealso::

   - Content from NBIS R course from 2021: https://nbisweden.github.io/RaukR-2021/
   - CodeRefinery develops and maintains training material on software best practices for researchers that already write code. 
      - Their material addresses all academic disciplines and tries to be as
        programming language-independent as possible.
        https://coderefinery.org/lessons/
   - Learn more about R packages: https://r-pkgs.org/
