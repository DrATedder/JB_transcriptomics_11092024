#!/bin/sh
#SBATCH --job-name=featureCounts
#SBATCH --account=da494
#SBATCH --partition=highmem
#SBATCH --cpus-per-task=2
#SBATCH --time=0:25:00

module load bioconda
conda activate featureCounts

INPUT=/storage/atedder/JB_transcriptomics_11092024/trimmed_data_12092024
ANNO=/storage/atedder/JB_transcriptomics_11092024/mRatBN7

featureCounts -O -L -T ${SLURM_CPUS_PER_TASK} -a ${ANNO}/Rattus_norvegicus.mRatBN7.2.112.gtf -o ${INPUT}/ani433_pass_ea1a871c_4bdaae38_COMBINED_trimmed_featureCounts_output_mRatBN7.txt ${INPUT}/ani433_pass_ea1a871c_4bdaae38_COMBINED_trimmed.bam
