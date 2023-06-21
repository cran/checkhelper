## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(checkhelper)

## ----examples-check_clean_userspace, eval = FALSE-----------------------------
#  #' \dontrun{
#  # This runs a check of the current package
#  all_files <- check_clean_userspace()
#  all_files
#  #' }

