# the goal of this script is to use the dyplyr package to count up the
# number of cities and counties in a given state that have detailed
# Apple mobility data available and then eventually to save it to a csv.

# Delong Tsway
# September 19th, 2020
# dttsway@dons.usfca.edu

# load the package "dplyr"
library("dplyr")

# We would like to get a count of the number of cities and the 
# number of counties in a given state that have driving mobility
# data. The input to this will be the output of the previous script
# namely the state csv files that we already subset.

# load in the data from the previous script
input_file_name <- "output/applemobilitytrends-2020-09-12_Massachusetts.csv"
state_data <- read.csv(input_file_name)

# starting off with dyplyr chains
state_data %>%
  select(geo_type, region, transportation_type) %>%
  filter(transportation_type == "driving") %>%
  group_by(geo_type)
