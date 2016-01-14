Chin San, Loo has done excersice 1, 2 and 3.
The code as below:
exercise 1:
grep 'NFKB' tf.bed > tf.nfkb.bed
exercise 2:
awk '{if($3 == "transcript") print}' gencode.v19.annotation.chr22.gtf > gencode.v19.annotation.chr22.transcript.gtf
exercise 3:
module load biotools
bedtools flank -i gencode.v19.annotation.chr22.transcript.gtf -g hg19.genome -l 2000 -r -0 -s > gencode.v19.annotation.chr22.transcript.promoter.gtf

