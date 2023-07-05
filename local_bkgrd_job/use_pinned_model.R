library(vetiver)
library(tidyverse)


data(Sacramento, package = "modeldata")

endpoint <- vetiver_endpoint("http://127.0.0.1:8088/predict")


new_sac <- Sacramento %>%
  slice_sample(n = 20) %>%
  select(type, sqft, beds, baths)

predict(endpoint, new_sac)
