#!/bin/bash

# A bash script to drive the rendering of an Rmarkdown file using some
# parameters passed in from the shell

Rscript -e "rmarkdown::render('Analysis.Rmd',\
            params = list(state = 'Washington',\
            data = 'data/raw_data/applemobilitytrends-2020-09-17.csv'))"