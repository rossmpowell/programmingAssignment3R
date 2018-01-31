best <- function(state, outcome) {
  # Checking if the outcomes is a valid one.
  outcomes = c("heart attack", "heart failure", "pneumonia")
  
  data <- read.csv("programmingAssignment3data/outcome-of-care-measures.csv", colClasses = "character")
  
  # See if the state, and outcome are valid
  if (state %in% data$State == FALSE) stop("invalid state")
  if ( outcome %in% outcomes == FALSE ) stop("invalid outcome")
  
  # Breaking down data into only the columns that matter.
  data <- data[,c(2,7,11,17,23)]
  
  # Changing the column of the data
  names(data) <- list("name" , "state" , "heart attack", "heart failure", "pneumonia")
  
  # Just getting the releavant data set for that state
  data <- data[data$state == state , ]
  
  # Coercing the numbers into integers
  data[ , outcome] <- as.numeric(data[ , outcome ], na.rm = TRUE)
  
  # Sorting my data frame according to the names
  data <- data[order(data[,1]) , ]
  
  # Getting the list of the relevant data from the file
  values <- data[, outcome]
  
  # Getting index of the minima
  rowNum <- which.min(values)
  
  # Return hospital name in that state with lowest 30-day death rate.
  data[rowNum,"name" ]
}