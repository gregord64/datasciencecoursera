#---------------------------------------------------
#
#       Reference Urls
#
#---------------------------------------------------
#
# http://rpubs.com/dennislwm/












#######################################################
myDir <- "c:/R_Programming/specdata" 
filenames <- list.files(myDir) 
filenames <- filenames[grep("[.]csv", filenames)] 

data_names <- gsub("[.]csv", "", filenames) 

for(i in 1:length(filenames)) assign(data_names[i], read.csv(file.path(myDir, filenames[i]))) 

###########################################################
setwd("c:/R_Programming/specdata")

file_list <- list.files()

for (file in file_list){
  
  # if the merged dataset doesn't exist, create it
  if (!exists("dataset")){
    dataset <- read.table(file, header=TRUE, sep="\t")
  }
  
  # if the merged dataset does exist, append to it
  if (exists("dataset")){
    temp_dataset <-read.table(file, header=TRUE, sep="\t")
    dataset<-rbind(dataset, temp_dataset)
    rm(temp_dataset)
  }
  
}

############################################

setwd("c:/R_Programming/specdata")

file_list <- list.files()

for (file in file_list){
  
  # if the merged dataset doesn't exist, create it
  if (!exists("dataset")){
    dataset <- read.csv(file, header=TRUE, sep=",")
  }
  dataset
}

################################################
#Useage - pollutantdata = multi_merge("c:/R_Programming/specdata")

multi_merge = function(mypath){
  filenames=list.files(path=mypath, full.names=TRUE)
  datalist = lapply(filenames, function(x){read.csv(file=x,header=T)})
  Reduce(function(x,y) {merge(x,y)}, datalist)}
  
############################
filenames <- list.files(path = "c:/R_Programming/specdata") 
do.call("rbind", lapply(filenames, read.csv, header = TRUE))

#############################

## Set the working directory -- setwd("c:/R_Programming/specdata")

setwd("c:/R_Programming/specdata")

## Get the list of files in the directory
file_list <- list.files()

## For every in file in the list of files do something
for (file in file_list){
  
  # Create a merged data set
  # Checkto see if the dataset doesn't exist, if not, create it
  if (!exists("dataset")){
    dataset <- read.csv(file, header=TRUE, sep=",")
  }
  dataset
}

#########################################
pollutantmean <- function(directory, pollutant, id = 1:10) {
  filenames <- sprintf("%03d.csv", id)
  filenames <- paste(directory, filenames, sep="/")
  ldf <- lapply(filenames, read.csv)
  df=ldply(ldf)
  # df is your list of data.frames
  mean(df[, pollutant], na.rm = TRUE)
}

#########################################
pollutantmean <- function(directory, pollutant, id = 1:332) {
  #set the path
  path = directory
  
  #get the file List in that directory
  fileList = list.files(path)
  
  #extract the file names and store as numeric for comparison
  file.names = as.numeric(sub("\\.csv$","",fileList))
  
  #select files to be imported based on the user input or default
  selected.files = fileList[match(id,file.names)]
  
  #import data
  Data = lapply(file.path(path,selected.files),read.csv)
  
  #convert into data frame
  Data = do.call(rbind.data.frame,Data)
  
##################################

pollutantmean <- function(directory, pollutant, id = 1:332) {
  file.names <- list.files(directory)
  file.numbers <- as.numeric(sub('\\.csv$','', file.names))
  selected.files <- na.omit(file.names[match(id, file.numbers)])
  selected.dfs <- lapply(file.path(directory,selected.files), read.csv)
  mean(c(sapply(selected.dfs, function(x) x[ ,pollutant])), na.rm=TRUE)
}

########################################

directory <- "c:/R_Programming/specdata" 
filenames <- list.files(directory) 
filenames <- filenames[grep("[.]csv", filenames)] 

data_names <- gsub("[.]csv", "", filenames) 

for(i in 1:length(filenames))
  assign(data_names[i], read.csv(file.path(directory, filenames[i]))) 

pollutant <- c("nitrate", "sulfate")

mean(data_names[,pollutant],na.rm=TRUE)


  
  #calculate mean
  mean(Data[,pollutant],na.rm=TRUE)
  
}





###################################################

#
# |------------------------------------------------------------------------------------------|
# | I N T E R N A L F U N C T I O N S |
# |------------------------------------------------------------------------------------------|
complete <- function(directory, id = 1:332) {
  # --- Assert 'directory' is a character vector of length 1 indicating the
  # location of the CSV files.  'id' is an integer vector indicating the
  # monitor ID numbers to be used Return a data frame of the form: id nobs 1
  # 117 2 1041 ...  where 'id' is the monitor ID number and 'nobs' is the
  # number of complete cases
  
  # --- Assert create an empty vector
  nobsNum <- numeric(0)
  
  for (cid in id) {
    # --- Assert get data frame as ID
    cDfr <- getmonitor(cid, directory)
    
    # --- Assert count the number of complete cases and append to numeric
    # vector
    nobsNum <- c(nobsNum, nrow(na.omit(cDfr)))
  }
  
  # --- Assert return value is a data frame with TWO (2) columns
  data.frame(id = id, nobs = nobsNum)
}

getmonitor <- function(id, directory, summarize = FALSE) {
  # --- Assert 'id' is a vector of length 1 indicating the monitor ID
  # number. The user can specify 'id' as either an integer, a character, or
  # a numeric.  'directory' is a character vector of length 1 indicating the
  # location of the CSV files 'summarize' is a logical indicating whether a
  # summary of the data should be printed to the console; the default is
  # FALSE
  
  # --- Assert construct file name Directory is pre-appended to file name.
  # Use sprintf() to add leading zeroes.  E.g. 'specdata/001.csv'
  fileStr <- paste(directory, "/", sprintf("%03d", as.numeric(id)), ".csv", 
                   sep = "")
  
  # --- Assert read csv
  rawDfr <- read.csv(fileStr)
  
  # --- Assert summary if true
  if (summarize) {
    print(summary(rawDfr))
  }
  
  # --- Return value is a data frame
  return(rawDfr)
}
