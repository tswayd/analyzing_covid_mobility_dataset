# convert all date columns to a single key column to tidy data using tidyverse
# package

#
#
#

# pivot the dates into one column
convert_data_longer <- function(file_name_in) {
  # read_csv in the file 
  covid_data <- readr::read_csv(file_name_in)
  # pivot_longer the data
  new_covid_data = tidyr::pivot_longer(
    data = covid_data,
    cols = starts_with("2020"),
    values_to = "relative_mobility",
    names_to = "dates"
  )

  if (ncol(new_covid_data) == ncol(covid_data)) {
    stop("ERROR: dataframe did not succesffuly pivot!")
  }

  # write into a new csv
  readr::write_csv(new_covid_data,
            path = (paste0("output/subset_wide_data/",
                           tools::file_path_sans_ext(basename(file_name_in)),
                           "_long.csv")))
  return(new_covid_data)

}
 
