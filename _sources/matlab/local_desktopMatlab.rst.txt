Local desktop
=============

The Rackham MATLAB support package can be found at [uppsala.Desktop.zip](https://github.com/UPPMAX/UPPMAX-documentation/raw/main/docs/software/files/matlab/uppsala.Desktop.zip).

- Download the ZIP file and start MATLAB.
- The ZIP file should be unzipped in the location returned by calling

```matlab
>> userpath
```

- You can unzip from MATLAB's Command window.

- Configure MATLAB to run parallel jobs on the cluster by calling ``configCluster``. ``configCluster`` only needs to be called once per version of MATLAB.

```matlab
>> configCluster
```

Submission to the cluster requires SSH credentials.  You will be prompted for username and password or identity file (private key).  The username and location of the private key will be stored in MATLAB for future sessions.
Jobs will now default to the cluster rather than submit to the local machine.
NOTE: To submit to the local machine instead of the cluster, run the following:

```matlab
>> % Get a handle to the local resources
>> c = parcluster('local');
```

CONFIGURING JOBS
Prior to submitting the job, various parameters can be assigned, such as queue, e-mail, walltime, etc.  The following is a partial list of parameters.  See AdditionalProperties for the complete list.  Only AccountName, Partition, MemUsage and WallTime.

```matlab
>> % Get a handle to the cluster
>> c = parcluster;

[REQUIRED]

>> % Specify the account
>> c.AdditionalProperties.AccountName = 'account-name';

>> % Specify the partition
>> c.AdditionalProperties.Partition = 'partition-name';

>> % Specify memory to use, per core (default: 4gb)
>> c.AdditionalProperties.MemUsage = '6gb';

>> % Specify the wall time (e.g., 1 day, 5 hours, 30 minutes)
>> c.AdditionalProperties.WallTime = '1-05:30';

[OPTIONAL]

>> % Specify a constraint 
>> c.AdditionalProperties.Constraint = 'feature-name';

>> % Request email notification of job status
>> c.AdditionalProperties.EmailAddress = 'user-id@uppmax.uu.se';

>> % Specify number of GPUs
>> c.AdditionalProperties.GPUsPerNode = 1;
>> c.AdditionalProperties.GPUCard = 'gpu-card';

>> % Specify cores per node
>> c.AdditionalProperties.ProcsPerNode = 4;

>> % Set node exclusivity (default: false)
>> c.AdditionalProperties.RequireExclusiveNode = true;

>> % Use reservation 
>> c.AdditionalProperties.Reservation = 'reservation-name';
```

Save changes after modifying AdditionalProperties for the above changes to persist between MATLAB sessions.

```matlab
>> c.saveProfile
```

To see the values of the current configuration options, display AdditionalProperties.

```matlab
>> % To view current properties
>> c.AdditionalProperties
```

Unset a value when no longer needed.

```matlab
>> % Turn off email notifications 
>> c.AdditionalProperties.EmailAddress = '';
>> c.saveProfile
```
