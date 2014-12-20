
#
# |------------------------------------------------------------------------------------------|
# | M A I N P R O C E D U R E |
# |------------------------------------------------------------------------------------------|

# --- Init set working directory
Init()

# --- Get data frame as ID = 1
data <- getmonitor(1, "specdata")
head(data)

##         Date sulfate nitrate ID
## 1 2003-01-01      NA      NA  1
## 2 2003-01-02      NA      NA  1
## 3 2003-01-03      NA      NA  1
## 4 2003-01-04      NA      NA  1
## 5 2003-01-05      NA      NA  1
## 6 2003-01-06      NA      NA  1


# --- Get data frame and summary as ID = 101
data <- getmonitor(101, "specdata", TRUE)

##          Date        sulfate        nitrate           ID     
##  2005-01-01:  1   Min.   : 1.7   Min.   : 0.2   Min.   :101  
##  2005-01-02:  1   1st Qu.: 3.1   1st Qu.: 0.6   1st Qu.:101  
##  2005-01-03:  1   Median : 4.3   Median : 1.1   Median :101  
##  2005-01-04:  1   Mean   : 6.3   Mean   : 2.3   Mean   :101  
##  2005-01-05:  1   3rd Qu.: 7.4   3rd Qu.: 2.8   3rd Qu.:101  
##  2005-01-06:  1   Max.   :22.1   Max.   :10.8   Max.   :101  
##  (Other)   :724   NA's   :666    NA's   :666

head(data)

##         Date sulfate nitrate  ID
## 1 2005-01-01      NA      NA 101
## 2 2005-01-02      NA      NA 101
## 3 2005-01-03      NA      NA 101
## 4 2005-01-04      NA      NA 101
## 5 2005-01-05      NA      NA 101
## 6 2005-01-06      NA      NA 101


# --- Get data frame and summary as ID = 200
data <- getmonitor(200, "specdata", TRUE)

##          Date         sulfate        nitrate           ID     
##  2001-01-01:   1   Min.   : 1     Min.   : 0     Min.   :200  
##  2001-01-02:   1   1st Qu.: 2     1st Qu.: 1     1st Qu.:200  
##  2001-01-03:   1   Median : 3     Median : 1     Median :200  
##  2001-01-04:   1   Mean   : 4     Mean   : 2     Mean   :200  
##  2001-01-05:   1   3rd Qu.: 5     3rd Qu.: 3     3rd Qu.:200  
##  2001-01-06:   1   Max.   :23     Max.   :15     Max.   :200  
##  (Other)   :3646   NA's   :3192   NA's   :3188


#
# |------------------------------------------------------------------------------------------|
# | E N D O F S C R I P T |
# |------------------------------------------------------------------------------------------|
