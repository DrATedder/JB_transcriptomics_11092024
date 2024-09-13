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

INPUT=/storage/atedder/JB_transcriptomics_11092024

minimap2 -ax splice -t ${SLURM_CPUS_PER_TASK} ${INPUT}/mRatBN7/Rattus_norvegicus.mRatBN7.2.dna.toplevel.fa.gz ${INPUT}/trimmed_data_12092024/ani433_pass_ea1a871c_4bdaae38_COMBINED_trimmed.fastq.gz > ${INPUT}/trimmed_data_12092024/ani433_pass_ea1a871c_4bdaae38_COMBINED_trimmed.sam
