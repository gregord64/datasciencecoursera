###########################################
##                                       ##
##    Set the working directory          ##
##                                       ##
###########################################
setwd("c:/R_Programming/gettingAndCleaningData")

###########################################
##                                       ##
##    Load required libraries            ##
##                                       ##
###########################################

library(downloader)
library(reshape2)

#############################################
##                                         ##
## Create the 2 files required             ##
## for the GIT courseProject documentation ##
##                                         ##
## These will need to be updated later     ##
##                                         ##
#############################################

file.create("README.md")
file.create("CodeBook.md")

###########################################
##                                       ##
##    Download the courseProject file    ##
##                                       ##
###########################################

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl, destfile="courseProjectDataset.zip")

###########################################
##                                       ##
##    Make sure we have everything       ##
##                                       ##
###########################################

list.files(path="c:/R_Programming/gettingAndCleaningData")
list.files(path="../gettingAndCleaningData")

###########################################
##                                       ##
##    Get the download date for the data ##
##                                       ##
###########################################

dateDownloaded <- date() #tag a date
dateDownloaded

#####################################################
##                                                 ##
##    Dependent libraries are loaded               ##
##    at the start of the script                   ##
##                                                 ##
## install.packages("downloader") to download zip  ##
## download(url,dest="dataset.zip" mode = "wb")    ##
##                                                 ##
#####################################################

unzip ("courseProjectDataset.zip")