# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from any particular US state
# and then write out a csv file that only has that subset

# Delong Tsway
# dttsway@dons.usfca.edu
# September 13, 2020

# create a function to subset any US state out of the full data
# this should also create an output CSV file that is named based on the state
# that is subset.
# I then changed the script to iterate over a vector of state names.
subset_data_to_state <- function(input_file_name, states_to_subset) {
  # read in the complete csv file
  all_covid_data <- read.csv(input_file_name)
  # iterate for loop over vector of state names
  for (state_to_subset in states_to_subset) {
    # subset the data set to only include rows where the sub.region column has
    # the state name in it.
    state_data <- all_covid_data[all_covid_data$sub.region == state_to_subset, ]
    # check that the subset data actually has data in it
    if (nrow(state_data) == 0) {
      stop("ERROR: no rows matching given state name. Did you make a typo?")
    }
    # save the state data to a new csv file in the output directory
    write.csv(state_data, file = paste0("output/subset_function_outputs/",
                                        tools::file_path_sans_ext(
                                          basename(input_file_name)),
                                        "_",
                                        state_to_subset,
                                        ".csv"))
  }

}