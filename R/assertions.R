assert_is_single_value <- function(should_be_single_value) {
	stopifnot(length(should_be_single_value) == 1)
	stopifnot(!is.na(should_be_single_value))
	stopifnot(!is.null(should_be_single_value))
}
