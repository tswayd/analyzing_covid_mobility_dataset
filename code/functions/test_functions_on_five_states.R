# Test of functions (subset_mobility_data_to_state) and (state_count)

# Delong Tsway
# September 19th 2020
# dttsway@dons.usfca.edu

source("code/functions/subset_mobility_data_to_state.R")
source("code/functions/state_count.R")

states_to_subset <- c("Massachusetts", "Maine", "New Hampshire",
                      "Vermont", "Rhode Island")
files_to_tally <- c(paste0("output/subset_function_outputs/",
                           "applemobilitytrends-2020-09-12_Massachusetts.csv"),
                    paste0("output/subset_function_outputs/",
                           "applemobilitytrends-2020-09-12_Maine.csv"),
                    paste0("output/subset_function_outputs/",
                           "applemobilitytrends-2020-09-12_New Hampshire.csv"),
                    paste0("output/subset_function_outputs/",
                           "applemobilitytrends-2020-09-12_Vermont.csv"),
                    paste0("output/subset_function_outputs/",
                           "applemobilitytrends-2020-09-12_Rhode Island.csv"))

subset_data_to_state("data/raw_data/applemobilitytrends-2020-09-12.csv",
                     states_to_subset)
state_count(files_to_tally)

# test is successful.