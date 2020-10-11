#!/bin/bash

# A bash script to drive the rendering of an Rmarkdown file using some
# parameters passed in from the shell
# this script expects two command lind parameters
# the first should be a US state, and the second is the raw apple mobility
# data csv file downloaded from apple.com

# Delong Tsway
# October 11, 2020
# dttsway@dons.usfca.edu

Rscript -e "rmarkdown::render('Analysis.Rmd',\
            params = list(state = '$1',\
            data = '$2'))"