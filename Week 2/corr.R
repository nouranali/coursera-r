corr <- function (directory, threshold = 0) {
  
  ## 'directory' is a character vector of length 1 with the location
  ## of the .csv files
  
  ## 'threshold' is a numeric vector of length 1 with the number
  ## of completely observed observations (on all variables) required
  ## to compute the correlation between nitrate and sulfate;
  ## the default is 0
  
  ## the 'corr' function returns the numeric vector of correlations
  ## note: the result is not to be rounded.
  
  all_files <- list.files(directory)
  file_paths <- paste(directory, all_files, sep = "/")
  
  complete_df <- complete("specdata", 1:length(all_files))
  
  nobs <- complete_df$nobs
  id <- complete_df$id[nobs > threshold]

  corr_vector <- rep(0, length(id))
  
  id_aux <- 1
  for(monitor in id) {
    monitor_csv <- read.csv(file_paths[monitor])
    corr_vector[id_aux] <- cor(monitor_csv$sulfate, monitor_csv$nitrate, use="complete.obs")
    id_aux <- id_aux + 1
  }
  
  corr_vector
}