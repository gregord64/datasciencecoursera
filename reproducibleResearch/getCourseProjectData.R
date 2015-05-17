###########################################
##                                       ##
##    Set the working directory          ##
##                                       ##
###########################################

setwd("c:/R_Programming/reproducibleResearch/")
###########################################
##                                       ##
##    Load required libraries            ##
##                                       ##
###########################################

library(downloader)

###########################################
##                                       ##
##    Download the courseProject file    ##
##                                       ##
###########################################

fileUrl <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip"

download.file(fileUrl, destfile="courseProjectDataset.zip")

###########################################
##                                       ##
##    Make sure we have everything       ##
##                                       ##
###########################################

list.files(path="c:/R_Programming/reproducibleResearch")
list.files(path="../reproducibleResearch")

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