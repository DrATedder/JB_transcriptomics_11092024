#!/bin/sh
#SBATCH --job-name=Index
#SBATCH --account=da494
#SBATCH --partition=highmem
#SBATCH --cpus-per-task=4
#SBATCH --time=0:25:00

### Load required modules
module load bioconda

### Activate environment
conda activate alopecia_LR

minimap2 -x map-ont -t ${SLURM_CPUS_PER_TASK} -d mRatBN7_ont.mmi /storage/atedder/JB_transcriptomics_11092024/mRatBN7/Rattus_norvegicus.mRatBN7.2.dna.toplevel.fa.gz
