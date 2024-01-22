## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(checkhelper)

## ----examples-check_as_cran, eval = FALSE-------------------------------------
#  #' \dontrun{
#  # This runs a check of the current package
#  # Directory to store the check outputs
#  check_output <- tempfile("example")
#  # Check the current package
#  check_as_cran(check_output = check_output)
#  # Open directory with all outputs
#  utils::browseURL(check_output)
#  #' }

