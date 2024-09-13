#!/bin/sh
#SBATCH --job-name=featureCounts
#SBATCH --account=da494
#SBATCH --partition=highmem
#SBATCH --cpus-per-task=2
#SBATCH --time=0:25:00

module load bioconda
conda activate featureCounts

INPUT=/storage/atedder/JB_transcriptomics_11092024/trimmed_data_12092024

featureCounts -O -L -T ${SLURM_CPUS_PER_TASK} -a ${INPUT}/ani433_pass_ea1a871c_4bdaae38_COMBINED_trimmed_stringtie_output.gtf -o ${INPUT}/ani433_pass_ea1a871c_4bdaae38_COMBINED_trimmed_featureCounts_output.txt ${INPUT}/ani433_pass_ea1a871c_4bdaae38_COMBINED_trimmed.bam
