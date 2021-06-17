#!/bin/bash

file_base=$1 

f1=${file_base}.primertrimmed.rg.sorted.bam

samtools depth -a $f1 > ${file_base}_DOC.txt

awk ' $3 >= 1 ' ${file_base}_DOC.txt | wc -l | sed -ne 's/$/ bases_greater_than_0 &/p' > ${file_base}_depth_0.txt

awk ' $3 >= 5 ' ${file_base}_DOC.txt | wc -l | sed -ne 's/$/ bases_greater_than_5 &/p' > ${file_base}_depth_5.txt

awk ' $3 >= 10 ' ${file_base}_DOC.txt | wc -l | sed -ne 's/$/ bases_greater_than_10 &/p' > ${file_base}_depth_10.txt

awk ' $3 >= 20 ' ${file_base}_DOC.txt | wc -l | sed -ne 's/$/ bases_greater_than_20 &/p' > ${file_base}_depth_20.txt

cat ${file_base}_depth* > ${file_base}_final.txt

rm ${file_base}_depth*
