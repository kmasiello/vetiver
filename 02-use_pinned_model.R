library(vetiver)
library(tidyverse)

#bring in data to make a prediction off of
data(Sacramento, package = "modeldata")

# reminder the plumber API was created from a particular model version.
model_url <- "https://colorado.posit.co/rsc/content/5a12bf71-2de5-4189-9110-f1e493f82a7a"

endpoint <- vetiver_endpoint(paste0(model_url,"/predict"))

# sample data
new_sac <- Sacramento %>%
  slice_sample(n = 10) %>%
  select(type, sqft, beds, baths)

predict(endpoint, new_sac)
