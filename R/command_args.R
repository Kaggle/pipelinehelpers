command_args_unless_interactive <- function(args_if_interactive = stop("I need interactive args for interactive use")) {
	args <- if (interactive()) args_if_interactive else command_args()
	return(args)
}

command_args <- function(trailingOnly = TRUE, ...) {
	args <- commandArgs(trailingOnly = trailingOnly, ...)
	cat("    Input arguments: ")
	dput(args)
	return(args)
}
