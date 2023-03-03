Running R in batch mode
=======================

.. questions::

   - What is a batch job?
   - How to write a batch script and submit a batch job?

   
   
.. objectives:: 

   - Short introduction to SLURM scheduler
   - Show structure of a batch script
   - Example to try


Any longer, resource-intensive, or parallel jobs must be run through a **batch script**.

The batch system used at both UPPMAX and HPC2N is called SLURM. 

SLURM is an Open Source job scheduler, which provides three key functions

- Keeps track of available system resources
- Enforces local system resource usage and job scheduling policies
- Manages a job queue, distributing work across resources according to policies

In order to run a batch job, you need to create and submit a SLURM submit file (also called a batch submit file, a batch script, or a job script).

Guides and documentation at: http://www.hpc2n.umu.se/support and https://www.uppmax.uu.se/support/user-guides/slurm-user-guide/ 

**Workflow**

- Write a batch script

  - Inside the batch script you need to load the modules you need (R and any prerequisites) 
  - If you are using any own-installed packages, make sure R_LIBS_USER is set (export R_LIBS_USER=/path/to/my/R-packages) 
  - Ask for resources depending on if it is a parallel job or a serial job, if you need GPUs or not, etc.
  - Give the command(s) to your R script

- Submit batch script with ``sbatch <my-batch-script-for-R.sh>`` 

Common file extensions for batch scripts are ``.sh`` or ``.batch``, but they are not necessary. You can choose any name that makes sense to you. 

Useful commands to the batch system
-----------------------------------

- Submit job: ``sbatch <jobscript.sh>``
- Get list of your jobs: ``squeue -u <username>``
- Check on a specific job: ``scontrol show job <job-id>``
- Delete a specific job: ``scancel <job-id>``
- Useful info about a job: ``sacct -l -j <job-id> | less -S``
- Url to a page with info about the job (Kebnekaise only): ``job-usage <job-id>``


.. keypoints::

   - The SLURM scheduler handles allocations to the calculation nodes
   - Interactive sessions was presented in the previous presentation
   - Batch jobs runs without interaction with the user
   - A batch script consists of a part with SLURM parameters describing the allocation and a second part describing the actual work within the job, for instance one or several R scripts.
      - Remember to include possible input arguments to the R script in the batch script.
    


Example R batch scripts
---------------------------- 

Serial code
'''''''''''
            
.. tabs::

   .. tab:: UPPMAX

        Short serial example script for Rackham. Loading R/4.0.4 

        .. code-block:: sh

            #!/bin/bash
            #SBATCH -A naiss2023-22-44 # Course project id. Change to your own project ID after the course
            #SBATCH --time=00:10:00 # Asking for 10 minutes
            #SBATCH -n 1 # Asking for 1 core
            
            # Load any modules you need, here R/4.0.4
            module load R/4.0.4
            
            # Run your R script (here 'hello.R')
            R --no-save --quiet < hello.R
  
            

   .. tab:: HPC2N

        Short serial example for running on Kebnekaise. Loading R/4.0.4 and prerequisites   
       
        .. code-block:: sh

            #!/bin/bash
            #SBATCH -A hpc2nXXXX-YYY # Change to your own project ID
            #SBATCH --time=00:10:00 # Asking for 10 minutes
            #SBATCH -n 1 # Asking for 1 core
            
            # Load any modules you need, here R/4.0.4 and prerequisites 
            module load GCC/10.2.0  OpenMPI/4.0.5  R/4.0.4
            
            # Run your R script (here 'hello.R')
            R --no-save --quiet < hello.R
            
            
   .. tab:: hello.R
   
        R example code
   
        .. code-block:: R
        
            message <-"Hello World!"
            print(message)  


        
Parallel code 
'''''''''''''

.. tabs::

   .. tab:: UPPMAX

        Short parallel example (Since we are using packages "foreach" and "doParallel", you need to use module R_packages/4.0.4 instead of R/4.0.4. 

        .. code-block:: sh
        
            #!/bin/bash
            #SBATCH -A naiss2023-22-44
            #SBATCH -t 00:10:00
            #SBATCH -N 1
            #SBATCH -c 4
            
            ml purge > /dev/null 2>&1
            ml R_packages/4.0.4
            
            # Batch script to submit the R program parallel_foreach.R 
            R -q --slave -f parallel_foreach.R


   .. tab:: HPC2N

        Short parallel example (using packages "foreach" and "doParallel" which are included in the R module) for running on Kebnekaise. Loading R/4.0.4 and its prerequisites. 
       
        .. code-block:: sh

            #!/bin/bash
            #SBATCH -A hpc2nXXXX-YYY # Change to your own project ID
            #SBATCH -t 00:10:00
            #SBATCH -N 1
            #SBATCH -c 4
            
            ml purge > /dev/null 2>&1
            ml GCC/10.2.0  OpenMPI/4.0.5  R/4.0.4
            
            # Batch script to submit the R program parallel_foreach.R 
            R -q --slave -f parallel_foreach.R


   .. tab:: parallel_foreach.R

        This R script uses packages "foreach" and "doParallel". 
       
        .. code-block:: R

            library(parallel)
            library(foreach)
            library(doParallel)
            # Function for calculating PI with no values
            calcpi <- function(no) {
              y <- runif(no)
              x <- runif(no)
              z <- sqrt(x^2+y^2)
              length(which(z<=1))*4/length(z)
            }
            # Detect the number of cores
            no_cores <- detectCores() - 1
            # Loop to max number of cores
            for (n in 1:no_cores) {
              # print how many cores we are using
              print(n)
              # Set start time
              start_time <- Sys.time()
              # Create a cluster
              nproc <- makeCluster(n)
              registerDoParallel(nproc)
              # Create a vector 1000 length with 100 randomizations
              input <- rep(100, 1000)
              # Use foreach on n cores
              registerDoParallel(nproc)
              res <- foreach(i = input, .combine = '+') %dopar%
                calcpi(i)
              # Print the mean of the results
              print(res/length(input))
              # Stop the cluster
              stopCluster(nproc)
              # print end time
              print(Sys.time() - start_time)
              }


.. tabs::

   .. tab:: UPPMAX

        Short parallel example (using package "Rmpi", so we need to load the module R_packages/4.0.4 instead of R/4.0.4 and we need to load a suitable openmpi module, openmpi/3.1.5)

        .. code-block:: sh
        
            #!/bin/bash
            #SBATCH -A naiss2023-22-44
            #Asking for 10 min.
            #SBATCH -t 00:10:00
            #SBATCH -n 8
            
            export OMPI_MCA_mpi_warn_on_fork=0
            
            ml purge > /dev/null 2>&1
            ml R_packages/4.0.4
            ml openmpi/3.1.5
            
            mpirun -np 1 R CMD BATCH --no-save --no-restore Rmpi.R output.out 
           


   .. tab:: HPC2N

        Short parallel example (using packages "Rmpi"). Loading R/4.0.4 and its prerequisites. 
       
        .. code-block:: sh

            #!/bin/bash
            #SBATCH -A hpc2nXXXX-YYY # Change to your own project ID
            #Asking for 10 min.
            #SBATCH -t 00:10:00
            #SBATCH -n 8
            
            export OMPI_MCA_mpi_warn_on_fork=0
            
            ml purge > /dev/null 2>&1
            ml GCC/10.2.0  OpenMPI/4.0.5
            ml R/4.0.4
            
            mpirun -np 1 R CMD BATCH --no-save --no-restore Rmpi.R output.out 
   

   .. tab:: Rmpi.R

        This R script uses package "Rmpi". 
       
        .. code-block:: sh
        
           # Load the R MPI package if it is not already loaded.
           if (!is.loaded("mpi_initialize")) {
           library("Rmpi")
           }
           print(mpi.universe.size())
           ns <- mpi.universe.size() - 1
           mpi.spawn.Rslaves(nslaves=ns)
           #
           # In case R exits unexpectedly, have it automatically clean up
           # resources taken up by Rmpi (slaves, memory, etc...)
           .Last <- function(){
           if (is.loaded("mpi_initialize")){
           if (mpi.comm.size(1) > 0){
           print("Please use mpi.close.Rslaves() to close slaves.")
           mpi.close.Rslaves()
           }
           print("Please use mpi.quit() to quit R")
           .Call("mpi_finalize")
           }
           }
           # Tell all slaves to return a message identifying themselves
           mpi.remote.exec(paste("I am",mpi.comm.rank(),"of",mpi.comm.size(),system("hostname",intern=T)))
           
           # Test computations
           x <- 5
           x <- mpi.remote.exec(rnorm, x)
           length(x)
           x
           
           # Tell all slaves to close down, and exit the program
           mpi.close.Rslaves()
           
           mpi.quit()



ML code
''''''''

.. tabs::

   .. tab:: UPPMAX

        Short ML example for running on Rackham.         
       
        .. code-block:: sh

            #!/bin/bash
            #SBATCH -A naiss2023-22-44
            #Asking for 10 min.
            #SBATCH -t 00:10:00
            #SBATCH -n 1
            #Writing output and error files
            #SBATCH --output=output%J.out
            #SBATCH --error=error%J.error
            
            ml purge > /dev/null 2>&1
            ml R_packages/4.0.4
            
            R --no-save --no-restore -f Rscript.R
           

   .. tab:: HPC2N

        Short ML example for running on Kebnekaise.       
       
        .. code-block:: sh

            #!/bin/bash
            #SBATCH -A hpc2nXXXX-YYY # Change to your own project ID
            #Asking for 10 min.
            #SBATCH -t 00:10:00
            #SBATCH -n 1
            #Writing output and error files
            #SBATCH --output=output%J.out
            #SBATCH --error=error%J.error
            
            ml purge > /dev/null 2>&1
            ml GCC/10.2.0  OpenMPI/4.0.5
            ml R/4.0.4
            
            R --no-save --no-restore -f Rscript.R


   .. tab:: Rscript.R

        Short ML example.       
       
        .. code-block:: sh

            #Example taken from https://github.com/lgreski/datasciencectacontent/blob/master/markdown/pml-randomForestPerformance.md
            library(mlbench)
            data(Sonar)
            library(caret)
            set.seed(95014)
            
            # create training & testing data sets
            inTraining <- createDataPartition(Sonar$Class, p = .75, list=FALSE)
            training <- Sonar[inTraining,]
            testing <- Sonar[-inTraining,]
            
            # set up training run for x / y syntax because model format performs poorly
            x <- training[,-61]
            y <- training[,61]
            
            #Serial mode
            fitControl <- trainControl(method = "cv",
                                       number = 25,
                                       allowParallel = FALSE)
            
            stime <- system.time(fit <- train(x,y, method="rf",data=Sonar,trControl = fitControl))
            
            
            #Parallel mode
            library(parallel)
            library(doParallel)
            cluster <- makeCluster(1) 
            registerDoParallel(cluster)
            
            fitControl <- trainControl(method = "cv",
                                       number = 25,
                                       allowParallel = TRUE)

            ptime <- system.time(fit <- train(x,y, method="rf",data=Sonar,trControl = fitControl))
            
            stopCluster(cluster)
            registerDoSEQ()
            
            fit
            fit$resample
            confusionMatrix.train(fit)
            
            #Timings
            timing <- rbind(sequential = stime, parallel = ptime)
            timing




Exercises
---------

.. challenge:: Serial batch script for R

   Run the serial batch script from further up on the page, but for the add2.R code. Remember the arguments.
    
.. solution:: Solution for UPPMAX
    :class: dropdown
    
          Serial script on Rackham  
          
          .. code-block:: sh
 
             #!/bin/bash
             #SBATCH -A naiss2023-22-44 # Change to your own after the course
             #SBATCH --time=00:10:00 # Asking for 10 minutes
             #SBATCH -n 1 # Asking for 1 core
             
             # Load any modules you need, here for R/4.0.4
             module load R/4.0.4
             
             # Run your R script 
             R --no-save --quiet < add2.R 2 3 


.. solution:: Solution for HPC2N
    :class: dropdown
    
          Serial script on Kebnekaise 
          
          .. code-block:: sh
 
             #!/bin/bash
             #SBATCH -A hpc2nXXXX-YYY # Change to your own project ID
             #SBATCH --time=00:10:00 # Asking for 10 minutes
             #SBATCH -n 1 # Asking for 1 core
             
             # Load any modules you need, here for R/4.0.4
             module load R/4.0.4
             
             # Run your R script 
             R --no-save --quiet < add2.R 2 3 




.. challenge:: Parallel job run

   Try running the parallel example with "foreach" from further up on the page. 


.. challenge:: R for ML

   Run the ML example shown in this session. 

