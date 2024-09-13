#!/bin/sh
#SBATCH --job-name=NanoPlot
#SBATCH --account=da494
#SBATCH --partition=compute
#SBATCH --cpus-per-task=2
#SBATCH --time=0:05:00

### Load required modules
module load bioconda

### Activate environment
conda activate alopecia_LR

### Required paths

PLOT_OUT=/storage/atedder/JB_transcriptomics_11092024/combined_fastqc
INPUT=/storage/atedder/JB_transcriptomics_11092024/COMBINED_data

### Set up loop to perform action on all suitable read files
for reads in ${INPUT}/*COMBINED.fastq.gz
   do
   name=$(basename ${reads} .fastq.gz)
   NanoPlot -t ${SLURM_CPUS_PER_TASK} --fastq ${reads} -o ${PLOT_OUT}/${name} --tsv_stats
done 
