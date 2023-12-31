# WARNING - Generated by {fusen} from dev/flat_create_example_pkg.Rmd: do not edit by hand

#' Create a package example producing notes and errors
#'
#' @param path Path where to store the example package
#' @param with_functions Logical. Whether there will be functions or not (with notes)
#' @param with_extra_notes Logical. Whether there are extra notes or not
#' @rdname create_example_pkg
#' @export
#' @return Path where the example package is stored.
#' @examples
#' create_example_pkg()
create_example_pkg <- function(path = tempfile(pattern = "pkg-"),
                               with_functions = TRUE,
                               with_extra_notes = FALSE) {
  if (!requireNamespace("usethis", quietly = TRUE) |
    !requireNamespace("attachment", quietly = TRUE)) {
    stop("Packages 'usethis' and 'attachment' are required to use this function in our examples and tests.")
  }

  # Create fake package ----
  if (!dir.exists(path)) {
    dir.create(path)
  } else {
    stop(path, " already exists")
  }

  # Create fake package
  usethis::create_package(file.path(path, "checkpackage"), open = FALSE)
  # on.exit(unlink(file.path(path, "checkpackage"), recursive = TRUE))

  if (isTRUE(with_extra_notes)) {
    extra_dir_path <- file.path(
      path, "checkpackage", "inst", "I build", "a very", "long_name",
      "that should be",
      "not_ok", "for_checks",
      "and hopefully", "lead to", "some", "extra_notes"
    )
    dir.create(extra_dir_path, recursive = TRUE)
    cat("for extra notes",
      file = file.path(extra_dir_path, "super_long_file_name_for_tests_to_extra_notes")
    )
  }

  if (isTRUE(with_functions)) {
    # Create function no visible global variables and missing documented functions
    # And return empty
    file.copy(
      system.file("bad-function-examples.R", package = "checkhelper"),
      file.path(path, "checkpackage", "R", "function.R")
    )
  }

  path <- file.path(path, "checkpackage")
  # This package will have warnings, but it is intentional
  # so that functions can detect problems
  suppressWarnings(attachment::att_amend_desc(path = path, must.exist = FALSE))
  return(path)
}
