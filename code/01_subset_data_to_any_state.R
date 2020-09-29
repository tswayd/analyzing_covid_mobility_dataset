# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from any particular US state
# and then write out a csv file that only has that subset
# uses functions in the code/function directory.
# and notes

# Delong Tsway
# dttsway@dons.usfca.edu
# September 13, 2020

# load functions
source("code/functions/subset_mobility_data_to_state.R")

# test out the use of the function
subset_mobility_data_to_state(
  input_file_name = "data/raw_data/applemobilitytrends-2020-09-12.csv",
  state_to_subset = "Massachusetts")

# comment