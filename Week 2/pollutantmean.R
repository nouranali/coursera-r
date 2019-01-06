pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  ## 'directory' is a character vector of length 1 with the location
  ## of the .csv files
  
  ## 'polutant' is a character vector of length 1 with the name of
  ## the pollutant that'll be used for the mean calculation;
  ## 'pollutant' shall be either "sulfate" or "nitrate"
  
  ## 'id' is an integer vector indicating the monitor ID numbers to be
  ## used
  
  ## the 'pollutantmean' function returns the mean of the pollutant
  ## across all monitors list in the 'id' vector (ignoring NA values)
  ## note: the result is not to be rounded.
  
  directory <- paste(directory, "/", sep = "")
  all_files <- as.character(list.files(directory))
  file_paths <- paste(directory, all_files, sep = "")
  
  mean_vector <- numeric()
  
  for (monitor in id) {
    monitor_csv <- read.csv(file_paths[monitor])
    monitor_na <- na.omit(monitor_csv)
    mean_vector <- c(mean_vector, monitor_na[[pollutant]])
  }
  
  mean(mean_vector)
  
}