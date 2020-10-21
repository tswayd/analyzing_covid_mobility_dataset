#!/bin/bash

# Delong Tsway
# dttsway@dons.usfca.edu
# 2020-10-18

# resources I consulted to build this code:
# https://github.com/vsbuffalo/bioawk-tutorial/blob/master/README.md
# https://opensource.com/article/17/2/command-line-tools-data-analysis-linux
# https://www.poftut.com/awk-text-split-delimit-examples/

FILE="/blast-db/sars-cov-2-seq-data/2020-10-15_ncbi_sars_cov_2_sequences.fasta.gz"

if [ $# -eq 0 ]
then
 echo "There is no file path provided"
exit 1
fi

if [ $# -gt 1 ]
then
echo "There is more than the one require argument provided"
exit 1
fi

# code to count total number of sequences in file
echo "Number of sequences in file:"; bioawk -cfastx "END{print NR}" $FILE > code/SeqSort.txt 

# code to parse out sequences by country, count by unique value, and then sort in descending order
echo "Number of sequences by country in descending order:"; bioawk -c fastx 
"{print $4}" $FILE | awk "{split($0,a,"|");print a[3]}" | sort | uniq -c | sort -nr | tee -a code/SeqSort.txt

# code to count number of sequences below and above 29,000 bp 
bioawk -cfastx "BEGIN{shorter = 0} {if (length($2) < 29000) shorter += 1} END {print "Number of sequences shorter than 29K bp", shorter}" $FILE | tee -a code/SeqSort.txt
bioawk -cfastx "BEGIN{longer = 0} {if (length($2) >= 29000) longer += 1} END {print "Number of sequences longer than 29K bp", longer}" $FILE | tee -a code/SeqSort.txt

