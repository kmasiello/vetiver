library(parsnip)
library(workflows)
data(Sacramento, package = "modeldata")

rf_spec <- rand_forest(mode = "regression")
rf_form <- price ~ type + sqft + beds + baths

rf_fit <-
  workflow(rf_form, rf_spec) %>%
  fit(Sacramento)

library(vetiver)
v <- vetiver_model(rf_fit, "sacramento_rf")
v

library(pins)
model_board <- board_folder("/Users/katie/Dropbox/pins/", versioned = TRUE)
model_board %>% vetiver_pin_write(v)
