source_eval <- function (sourceFile, expression, pushwd = getwd()) {
  # Load an R file into a temporary environment and evaluations an expression within the
  # context of the environment, returning the results. For example:
  #
  # source_eval(
  #   "src/models/random_forest.R",
  #   model
  # )
  #
  # The optional pushwd parameter temporarily changes the working directory while loading
  # the file and extracting the expression, and ensures that the working directory is
  # restored to the original values.
  
  # Save the working directory before the call to return to later.
  # Even if the directory is the same or defaults to the same directory,
  # we apply the pushwd logic anyway, because the expression might change the
  # working directory, which would have highly "interesting" consequences.
  wd <- getwd()
  on.exit(setwd(wd))
  
  # Change to the directory
  setwd(pushwd)
  
  eval(
{
  source(sourceFile)
  expression
},
envir = emptyenv()
  )
}