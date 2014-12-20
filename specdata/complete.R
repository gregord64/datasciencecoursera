
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  complete <- function(directory, id = 1:332) {
    directory = "c:/R_Programming/specdata/"
    nobsNum <- numeric(0)
    
    for (cid in id) {
      
      cDfr <- getmonitor(cid, directory)
      
      nobsNum <- c(nobsNum, nrow(na.omit(cDfr)))
    }
    
    data.frame(id = id, nobs = nobsNum)
  }
  
  getmonitor <- function(id, directory, summarize = FALSE) {
    
    fileStr <- paste(directory, "/", sprintf("%03d", as.numeric(id)), ".csv", 
                     sep = "")
    
    rawDfr <- read.csv(fileStr)
    
    if (summarize) {
      print(summary(rawDfr))
    }
    
    return(rawDfr)
  }
