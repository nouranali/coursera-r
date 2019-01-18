rankhospital <- function(state, outcome, num = "best") {
  
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv");
  
  ## Check that state and outcome are valid
  states <- data[, 7];
  if (!any(states == state)) {
    stop("invalid state");
  }
  
  if ((outcome != "heart failure") && (outcome != "heart attack") && (outcome != "pneumonia")) {
    stop("invalid outcome");
  }
  
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  col <- if (outcome == "heart failure") {
    17;
  } else if (outcome == "heart attack") {
    11;
  } else {
    23;
  }
  
  data[, col] <- as.numeric(data[, col]);
  data[, 2] <- as.character(data[, 2]);
  statedata <- data[grep(state, data$State), ];
  orderdata <- statedata[order(statedata[, col], statedata[, 2], na.last = NA), ];
  if (num == "best") {
    orderdata[1, 2];
  } else if (num == "worst") {
    orderdata[nrow(orderdata), 2];
  } else{
    orderdata[num, 2];
  }
}