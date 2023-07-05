library(pins)
library(vetiver)
library(plumber)

model_board <- board_folder("/Users/katie/Dropbox/pins/", versioned = TRUE)

pin_versions(model_board, "sacramento_rf")

v <- model_board %>%
  vetiver_pin_read("sacramento_rf", version = "20220420T143954Z-4fe3c")

pr() %>%
  vetiver_api(v) %>%
  pr_run(port = 8088)

