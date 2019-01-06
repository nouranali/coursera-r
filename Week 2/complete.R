complete <- function(directory, id) {

  ## 'directory' is a character vector of length 1 with the location
  ## of the .csv files
  
  ## 'id' is an integer vector indicating the monitor ID numbers to be
  ## used
  
  ## the 'complete' function returns a data.frame
  ## with the following pattern
  ##
  ## id nobs
  ## 1  117
  ## 2 1041
  ## ..
  ## where 'id' is the monitor's id number
  ## and 'nobs' is the number of rows with complete information
  
  all_files <- list.files(directory)
  file_paths <- paste(directory, all_files, sep = "/")
  
  complete <- data.frame()
  id_aux <- 1
  
  for (monitor in id) {
    monitor_csv <- read.csv(file_paths[monitor])
    new_row <- c(id_aux, sum(complete.cases(monitor_csv)))
    complete <- rbind(complete, new_row)
    
    id_aux <- id_aux + 1
  }
  
  colnames(complete) <- c("id", "nobs")
  complete
}