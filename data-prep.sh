#!/bin/bash

#SBATCH --mail-user=[lg14410@bristol.ac.uk]
#SBATCH --mail-type=END,FAIL,TIME_LIMIT_80
#SBATCH --job-name=farm-size-data-prep
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=7
#SBATCH --time=00:30:00
#SBATCH --mem=8G


cd "${SLURM_SUBMIT_DIR}"

echo "Running on host $(hostname) \n"
echo "Time is $(date) \n"
echo "Directory is $(pwd) \n"
echo "Slurm job ID is ${SLURM_JOBID} \n"
echo "This jobs runs on the following machines: \n"
echo "${SLURM_JOB_NODELIST}"

echo "Keep track of job by entering sacct -j ${SLURM_JOBID}  \n"
echo "Cancel your job by entering scancel ${SLURM_JOBID}  \n"
echo "More details on submitting jobs here https://www.acrc.bris.ac.uk/protected/hpc-docs/job_types/ \n"

module add lib/gdal/3.3.0-gcc
module add lib/geos/3.10.2-gcc
module add lib/proj/8.2.1
module add lang/r/4.0.1
module add lang/gcc/9.1.0
module add tools/cmake/3.22.2 #Needed for R-package nloptr
# module add languages/r/4.1.0
# module add tools/cmake/3.20.0 #Needed for R-package nloptr
# module add tools/gdal/3.4.0 # Needed for spatial analysis
# module add GDAL/2.0.2-foss-2016a
# module add PROJ/4.9.2-foss-2016a
# d=$(date +%Y-%m-%d)

# export OMP_NUM_THREADS=4

Rscript 02-earth-engine-data-prep.R -d /user/work/distributional-farm-size-analysis

