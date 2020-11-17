# Analysis of Apple Mobility Data in the Era of COVID-19

Delong Tsway
dttsway@dons.usfca.edu

The aim of this project is to analyze the mobility data made available by Apple.
That data is available from the following URL:
https://covid19.apple.com/mobility

It currently uses dplyr to work with some of the tabular data. Eventually, it will also include use of ggplot2 to visualize the data.

### Log

* 2020-11-16: For my final project I intend to 
* 2020-10-28: Refactored code/process_sequences.sh to only produce all outputs by addition of the argument "ALL". Otherwise to only produce a list of countries by number of sequences without second argument. Add the output of this script as a third variable to the Analysis.Rmd and run-analysis.sh. And then funneled all of that into a Makefile.
* 2020-10-22: Connected to USF VPN and tule secure shell to access blast-db/SARS-cov2 data files. Wrote a bash script to analyze file for number of sequences, order by country, and amount above/below 29K bp. Redirected output into a text file.
* 2020-10-11: Parameterize Rmd and add bash script to drive knitting.
* 2020-10-01: Made a long Analysis Rmd and references.bib. Fixed up the functions to return object and remove spaces in output file. Fixed functions to also run specifically from the right package and other details.
* 2020-09-19: Added second script to use dplyr to tally up the count of cities and counties in a given state that have data from different transportation types. Made that script into a function (state_count). Added a for loop to iterate over a vector of states in both functions (state_count),(subset_mobility_data_to_state).
* 2020-09-19: Loaded latest data from Apple Mobility Covid data (09-17-2020).
* 2020-09-16: Initial commit of README into repository. Eventually commited all files into repository. Remembered to connect to email for github instead of normal email.
* 2020-09-13: A new version of the data file was downloaded, and I also worked to refactor the code to be more general and to allow for any state to be subset from the larger file.
* 2020-08-29: It was originally downloaded for analysis.
