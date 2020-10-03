# the goal of this script is to use the dyplyr package to count up the
# number of cities and counties in a given state that have detailed
# Apple mobility data available and then eventually to save it to a csv.

# Delong Tsway
# September 19th, 2020
# dttsway@dons.usfca.edu

# create a function to count up number of cities and counties
# in a given state that have driving mobility data.
# The input to this will be the output of the previous script
# namely the state csv files that we already subset.
# this should also create an output CSV file that is named based on the state
# that is subset.
# Changed the function to iterate over a vector of files.

state_count <- function(input_file) {
  # loop code over the files
  for (input_file in input_file_names) {
    # read in subset data csv
    state_data <- readr::read_csv(input_file)
    # dplyr chains
    count_cities_counties_by_type <- state_data %>%
      select(geo_type, region, transportation_type) %>%
      group_by(geo_type, transportation_type) %>%
      tally()
    if (ncol(count_cities_counties_by_type) < 3) {
      stop("ERROR: file is missing one or two essential columns of data")
      # write data as csv in output folder
    }
    readr::write_csv(count_cities_counties_by_type,
              path = paste0("output/cities_counties_tally/",
                            tools::file_path_sans_ext(basename(input_file)),
                            "_count_by_type.csv"))
  }
  return(count_cities_counties_by_type)
}
