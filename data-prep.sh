#!/bin/bash

#SBATCH --mail-user=[lg14410@bristol.ac.uk]
#SBATCH --mail-type=END,FAIL,TIME_LIMIT_80
#SBATCH --job-name=distributional-analysis
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=27
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

module add languages/r/4.1.0

# d=$(date +%Y-%m-%d)

export OMP_NUM_THREADS=4

Rscript 02-earth-engine-data-prep.R

