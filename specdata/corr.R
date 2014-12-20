  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  
  ############################################################################
  
  corr <- function(directory, threshold = 0) {
    directory = "c:/R_Programming/specdata/"
    corrsNum <- numeric(0)
    
    nobsDfr <- complete("c:/R_Programming/specdata/")
    
    nobsDfr <- nobsDfr[nobsDfr$nobs > threshold, ]
    
    for (cid in nobsDfr$id) {
  
      monDfr <- getmonitor(cid, directory)
      
      corrsNum <- c(corrsNum, cor(monDfr$sulfate, monDfr$nitrate, use = "pairwise.complete.obs"))
    }
    
    return(corrsNum)
  }
  
  complete <- function(directory, id = 1:332) {
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