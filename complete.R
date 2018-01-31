complete <- function(directory, idnums = 1:332) {
        filesD <- list.files(directory, full.names = TRUE)
        data <- data.frame()
        for (id in idnums) {
                thisId <- read.csv(filesD[id], header = TRUE)
                thisId <- na.omit(thisId) #omit any rows that are not complete
                nobs <- nrow(thisId)   #Number of observations in the rows
                data <- rbind(data, data.frame(id, nobs))
        }
        return(data)
}