# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from Massachusetts
# and then write out a csv file that only has that subset

# Delong Tsway
# dttsway@dons.usfca.edu
# August 29, 2020

# read in the complete csv file
all_covid_data <- read.csv("data/raw_data/applemobilitytrends-2020-08-28.csv")

# subset the data set to only include rows where the sub.region column has
# "Massachusetts" in it.
mass_data <- all_covid_data[all_covid_data$sub.region == "Massachusetts", ]

# save the Massachusetts data to a new csv file in the output directory
write.csv(mass_data, file = "output/massachusetts_apple_mobility_data.csv")
