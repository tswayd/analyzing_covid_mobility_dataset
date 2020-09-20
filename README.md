# Analysis of Apple Mobility Data in the Era of COVID-19

Delong Tsway
dttsway@dons.usfca.edu

The aim of this project is to analyze the mobility data made available by Apple.
That data is available from the following URL:
https://covid19.apple.com/mobility

It currently uses dplyr to work with some of the tabular data. Eventually, it will also include use of ggplot2 to visuale the data.

### Log

* 2020-09-19: Added second script to use dplyr to tally up the count of cities and counties in a given state that have data from different transportation types. Made that script into a function (state_count). Added a for loop to iterate over a vector of states in both functions (state_count),(subset_mobility_data_to_state).
* 2020-09-19: Loaded latest data from Apple Mobility Covid data (09-17-2020).
* 2020-09-16: Initial commit of README into repository. Eventually commited all files into repository. Remembered to connect to email for github instead of normal email.
* 2020-09-13: A new version of the data file was downloaded, and I also worked to refactor the code to be more general and to allow for any state to be subset from the larger file.
* 2020-08-29: It was originally downloaded for analysis.
