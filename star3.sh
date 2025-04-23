#!/bin/bash
#SBATCH --account=e32680
#SBATCH --partition=short
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --mem=25G
#SBATCH --job-name=star_example

module purge
# change the version of the STAR module to match the methods
# (the version they list isn't actually on Quest yet but will be soon) 
module load STAR/2.7.9a

# in the command below you'll need to change:
# the path to the genomeDir for hg38
# Hint: it's within /projects/genomicsshare/AWS_iGenomes/references
# and then you'll need to add the extra parameters listed in the methods
# you can check out the star manual to see what these parameters do

STAR \
  --runThreadN 8 \
  --genomeDir /projects/e32680/02_staralignment_reference/STARindex \
  --readFilesIn /projects/e32680/02_staralignment_reference/SRR7773980_1.fastq.gz,/projects/e32680/02_staralignment_reference/SRR7773980_2.fastq.gz \
  --readFilesCommand gunzip -c \
  --outFileNamePrefix ./STARoutputs
