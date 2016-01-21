#!/bin/bash
#PBS -q hotel
#PBS -N tf_binding.sh
#PBS -l nodes=2:ppn=2
#PBS -l walltime=:00:20:00

cd ~/code/biom262-2016/weeks/week01/data
#Chin San, Loo has done excersice 1, 2 and 3. The code as below:
#exercise 1:
grep 'NFKB' tf.bed > tf.nfkb.bed
#exercise 2:
awk '{if($3 == "transcript") print}' gencode.v19.annotation.chr22.gtf > gencode.v19.annotation.chr22.transcript.gtf
#exercise 3:
module load biotools
bedtools flank -i gencode.v19.annotation.chr22.transcript.gtf -g hg19.genome -l 2000 -r -0 -s > gencode.v19.annotation.chr22.transcript.promoter.gtf
#Lisa Elmen has done exercise 4 and 5
#exercise 4:
bedtools intersect -a gencode.v19.annotation.chr22.transcript.promoter.gtf -b tf.nfkb.bed  > gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf
#exercise 5:
bedtools getfasta -fi GRCh37.p13.chr22.fa -bed gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf -fo gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta 
#exercise 6:
#More work is needed to “validate” the homework fasta-file. I expected to find some matches using the data from Wong et al, but came up with 0 matches which does not seem reasonable. I tried different variants of grep to compare the list of canonical NFKB sequences, and the non-canonical consensus sequences with commands like “grep -Fx -f NFKBcanonical gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta  > Hope_to_find_match.txt” OR “grep 'CTGGGGATTTA' gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta > Still_hope_to_find_match.txt”.
#Comment for exercise 6 by Chin San Loo
#That paper has published their electrophoretic mobility shift assay-sequencing (EMSA-Seq) dataset, we could use 'grep' to check how much line or list of gene from "gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta" contain the NFKB canonical sequence (11mer forward and reverse complement) that obtained from their published EMSA-seq dataset.
#####
#Finding match between canonical nkfb 11mer forward and the fasta 
grep -F -f nfkb_forward.txt gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta > Output_F.txt
#Counting how many lines have matched
wc -l Output_F.txt
# Obtain 513 lines
#####
#Finding match between canonical nkfb 11mer reverse and the fasta
grep -F -f nfkb_reverse.txt gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta > Output_R.txt
#Counting how many lines have matched
wc -l Output_F.txt
# Obtain 400 lines

# Total match is (513+400)= 913, Percentage of match is 913/2442=37.4%

 echo "Hello I am a message in standard out (stdout)"
 echo "Hello I am a message in standard error (stderr)" >&2



