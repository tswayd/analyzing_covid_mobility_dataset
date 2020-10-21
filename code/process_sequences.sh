#!/bin/bash

# Delong Tsway
# dttsway@dons.usfca.edu
# 2020-10-18

#!/bin/bash

# code to count total number of sequences in file
zgrep -c ">" /blast-db/sars-cov-2-seq-data/2020-10-15_ncbi_sars_cov_2_sequences.fasta.gz

# this code also works to find the total number of sequences
bioawk -cfastx 'END{print NR}' /blast-db/sars-cov-2-seq-data/2020-10-15_ncbi_sars_cov_2_sequences.fasta.gz 

# code to parse out sequences by country, count by unique value, and then sort in descending order
bioawk -c fastx '{print $comment}' /blast-db/sars-cov-2-seq-data/2020-10-15_ncbi_sars_cov_2_sequences.fasta.gz | awk 
'{split($0,a,"|");print a[3]}' | sort | uniq -c | sort -nr

# code to count number of sequences below 29,000 bp 
bioawk -cfastx 'BEGIN{shorter = 0} {if (length($seq) < 29000) shorter += 1} END {print "shorter sequences", shorter}' 
/blast-db/sars-cov-2-seq-data/2020-10-15_ncbi_sars_cov_2_sequences.fasta.gz

# code to count number of sequences equal to or above 29,000 bp
bioawk -cfastx 'BEGIN{longer = 0} {if (length($seq) >= 29000) longer += 1} END {print "longer sequences", longer}' 
/blast-db/sars-cov-2-seq-data/2020-10-15_ncbi_sars_cov_2_sequences.fasta.gz
