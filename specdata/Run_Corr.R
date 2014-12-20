#
# |------------------------------------------------------------------------------------------|
# | M A I N P R O C E D U R E | CORR.R
# |------------------------------------------------------------------------------------------|
Init <- function(workDirStr = "c:/R_Programming/specdata/") {
  setwd(workDirStr)
}

# --- Init set working directory
Init()

# --- Get correlations vector as threshold = 150
data <- corr("specdata", 150)
head(data)

## [1] -0.01896 -0.14051 -0.04390 -0.06816 -0.12351 -0.07589

summary(data)

##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.2110 -0.0500  0.0946  0.1250  0.2680  0.7630


# --- Get correlations vector as threshold = 400
data <- corr("specdata", 400)
head(data)

## [1] -0.01896 -0.04390 -0.06816 -0.07589  0.76313 -0.15783

summary(data)

##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.1760 -0.0311  0.1000  0.1400  0.2680  0.7630


# --- Get correlations vector as threshold = 5000
data <- corr("specdata", 5000)
summary(data)

##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.

length(data)

## [1] 0


# --- Get correlations vector as threshold = 0
data <- corr("specdata", 0)
summary(data)

##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -1.0000 -0.0528  0.1070  0.1370  0.2780  1.0000

length(data)

## [1] 323


#
# |------------------------------------------------------------------------------------------|
# | E N D O F S C R I P T |
# |------------------------------------------------------------------------------------------|
