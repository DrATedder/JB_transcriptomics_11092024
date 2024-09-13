#!/bin/sh
#SBATCH --job-name=SAMtools
#SBATCH --account=da494
#SBATCH --partition=highmem
#SBATCH --cpus-per-task=1
#SBATCH --time=0:25:00

module load SAMtools

INPUT=/storage/atedder/JB_transcriptomics_11092024/trimmed_data_12092024

for samples in ${INPUT}/*.sam
   do
   name=$(basename ${samples} .sam)
   echo -e '\n***Samtools view***\n'
   samtools view -b -o ${INPUT}/${name}-raw.bam ${INPUT}/${name}.sam
   echo -e '\n***Samtools sort***\n'
   samtools sort -o ${INPUT}/${name}.bam ${INPUT}/${name}-raw.bam
   echo -e '\n***Samtools Index***\n'
   samtools index ${INPUT}/${name}.bam
   ### clean up intermediate files
   rm ${INPUT}/${name}-raw.bam
   rm ${INPUT}/${name}.sam
done
