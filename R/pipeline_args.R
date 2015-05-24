pipeline_output_directory <- function(path, sentinel = "_") {
  stopifnot(length(path) == 1)

  # Check that we have an actual value
  if (is.na(path) || is.null(path)) {
    stop(sprintf("The directory parameter %s is missing or null", path))
  }

  # Accept a sentinel file in place of the directory
  if (!is.null(sentinel) && basename(path) == sentinel) {
    path = dirname(path)
  }

  directory <- ensure_empty_directory_exists(path)
  return(directory)
}

pipeline_input_file <- function(file) {
  assert_is_single_value(file)

  # Input files are checked to make sure they exist
  if(!file.exists(file) || file.info(file)$isdir) {
    stop(sprintf("The file parameter '%s' does not exist", file))
  }

  return(file)
}

pipeline_output_file <- function(path) {
  # Ensure that the parent directory for output files exists and delete existing versions of the file.
  file <- ensure_parent_directory_exists(path)

  return(file)
}

pipeline_input_file_vector <- function(space_separated_paths) {
  split_arg <- function(arg) Filter(function(s) nchar(s) > 0, strsplit(arg, " ")[[1]])
  paths <- split_arg(space_separated_paths)
  stopifnot(length(paths) > 0)
  files <- sapply(paths, pipeline_input_file, USE.NAMES = FALSE)
  return(files)
}
