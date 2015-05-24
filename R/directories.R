ensure_parent_directory_exists <- function(filePath) {
	# Make sure the parent directory of some path exists.
	# Returns the path as a convenience for inline use.
	#
	# Example: Save(content, ensure_parent_directory_exists(path))
	directoryPath <- dirname(filePath)

	if (!file.exists(directoryPath)) {
		dir.create(directoryPath, showWarnings = TRUE, recursive = TRUE)
	}

	return(filePath)
}

ensure_empty_directory_exists <- function(directoryPath) {
	# Make sure a directory exists and is empty, creating or deleting as needed.
	# Example: subpathDir <- EnsureEmptyDirectoryExists(outputDir, "This", "That")

	if (file.exists(directoryPath)) {
		unlink(directoryPath, recursive = TRUE)
	}

	dir.create(directoryPath, showWarnings = TRUE, recursive = TRUE)

	return(directoryPath)
}
