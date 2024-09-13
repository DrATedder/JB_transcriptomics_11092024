#!/bin/sh
#SBATCH --job-name=Chopper
#SBATCH --account=da494
#SBATCH --partition=highmem
#SBATCH --cpus-per-task=1
#SBATCH --time=0:05:00

### Load required modules
module load bioconda

### Activate environment
conda activate alopecia_LR

### Required paths

INPUT=/storage/atedder/JB_transcriptomics_11092024/COMBINED_data
TRIM_OUT=/storage/atedder/JB_transcriptomics_11092024/trimmed_data_12092024

### Set up loop to perform action on all suitable read files
for reads in ${INPUT}/*COMBINED.fastq.gz
   do
   name=$(basename ${reads} .fastq.gz)
   gunzip -c ${reads} | chopper -q 10 -l 50 | gzip > ${TRIM_OUT}/${name}_trimmed.fastq.gz
done
