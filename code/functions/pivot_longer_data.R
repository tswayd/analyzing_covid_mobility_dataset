# convert all date columns to a single key column to tidy data using tidyverse
# package

#
#
#

# load the package
install.packages("tidyverse")
library("tidyverse")

# read_csv in the file 
covid_data <- read_csv('applemobilitytrends-2020-09-20.csv')
print(ncol(covid_data))

# pivot the dates into one column
??pivot_longer()
new_covid_data <- pivot_longer_covid(
  data = covid_data,
  cols = (7:258),
  names_to = "dates")
if (!ncol(new_covid_data) < 258)
  stop("ERROR: dataframe did not succesffuly pivot!")

# write into a new csv
write.csv(new_covid_data,
          file = ("applemobilitytrends-2020-09-20_long.csv"))
