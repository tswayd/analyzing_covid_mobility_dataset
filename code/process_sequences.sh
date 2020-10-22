#!/bin/bash

# Delong Tsway
# dttsway@dons.usfca.edu
# 2020-10-18

# resources I consulted to build this code:
# https://github.com/vsbuffalo/bioawk-tutorial/blob/master/README.md
# https://opensource.com/article/17/2/command-line-tools-data-analysis-linux
# https://www.poftut.com/awk-text-split-delimit-examples/
# https://www.cyberciti.biz/faq/run-execute-sh-shell-script/
# https://askubuntu.com/questions/420981/how-do-i-save-terminal-output-to-a-file

if [ $# -eq 0 ]
then
 echo "There is no file path provided."
exit 1
fi

if [ $# -gt 1 ]
then
 echo "There is more than the one required argument."
exit 1
fi
# echo statement to describe contents:
echo "This is some information about the sequences from the Sars-Cov-2 database"

# code to count total number of sequences in file
echo "Number of sequences in file:"
bioawk -c fastx 'END{print NR}' $1

# code to parse out sequences by country, count by unique value, and then sort in descending order
echo "Number of sequences by country in descending order:"
bioawk -c fastx '{print $4}' $1 | awk '{split($0,a,"|");print a[3]}' | sort | uniq -c | sort -nr

# code to count number of sequences below and above 29,000 bp 
bioawk -c fastx 'BEGIN{shorter = 0} {if (length($2) < 29000) shorter += 1} END {print "Number of sequences shorter than 29K bp:", shorter}' $1
bioawk -c fastx 'BEGIN{longer = 0} {if (length($2) >= 29000) longer += 1} END {print "Number of sequences equal to or longer than 29K bp:" longer}' $1
