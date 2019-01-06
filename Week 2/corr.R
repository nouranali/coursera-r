corr <- function (directory, threshold = 0) {
  
  ## 'directory' is a character vector of length 1 with the location
  ## of the .csv files
  
  ## 'threshold' is a numeric vector of length 1 with the number
  ## of completely observed observations (on all variables) required
  ## to compute the correlation between nitrate and sulfate;
  ## the default is 0
  
  ## the 'corr' function returns the numeric vector of correlations
  ## note: the result is not to be rounded.
  
  directory <- paste(directory, "/", sep = "")
  all_files <- list.files(directory)
  file_paths <- paste(directory, all_files, sep = "")
}