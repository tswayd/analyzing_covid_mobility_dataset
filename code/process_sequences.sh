#!/bin/bash

# Delong Tsway
# dttsway@dons.usfca.edu
# 2020-10-18

#!/bin/bash

# code to count total number of sequences in file
zgrep -c ">" /blast-db/sars-cov-2-seq-data/2020-10-15_ncbi_sars_cov_2_sequences.fasta.gz 

# code to parse out sequences by country, count by unique value, and then sort in descending order
bioawk -c fastx '{print $comment}' /blast-db/sars-cov-2-seq-data/2020-10-15_ncbi_sars_cov_2_sequences.fasta.gz | awk 
'{split($0,a,"|");print a[3]}' | sort | uniq -c | sort -nr

# code to 
