corr <- function(directory, threshold = 0) {
        filesD <- list.files(directory, full.names = TRUE)
        data <- vector(mode = 'numeric', length = 0)
        for (i in 1:length(filesD)) {
                thisId <- read.csv(filesD[i], header = TRUE)
                thisId <- thisId[complete.cases(thisId),]
                numobs<-nrow(thisId)
                if (numobs > threshold) {
                        data <- c(data, cor(thisId$nitrate, thisId$sulfate))
                }
        }
        return(data)
}