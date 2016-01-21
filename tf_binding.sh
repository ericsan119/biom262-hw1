#PBS TAGS
#!/bin/csh
#PBS -q hotel
#PBS -N tf_binding.sh
#PBS -l nodes=10:ppn=2
#PBS -l walltime=0:50:00
#PBS -o output.sh
#PBS -e error.txt
#PBS -V
#PBS -M csloo@ucsd.edu
#PBS -m abe
#PBS -A csloo
cd /oasis/tscc/scratch/ucsd-train08
mpirun -v -machinefile $PBS_BODEFILE -np 20 <.mpi.out>

#Chin San, Loo has done excersice 1, 2 and 3.
#The code as below:
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

 echo "Hello I am a message in standard out (stdout)"
 echo "Hello I am a message in standard error (stderr)"



