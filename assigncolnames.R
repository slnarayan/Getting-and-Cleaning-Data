## The responsibility of the function includes the following:
## 1. Read the column names from features.txt
## 2. Assign the column names read from features.txt to the data frame provided 
##    as an input to the function
##

assigncolnames <- function( x ){

  ## Read the file features.txt
  cnames <- read.table("features.txt", stringsAsFactors = FALSE)
  
  for(i in 1:nrow(cnames)) {
    
    colnames(x)[i+2] <- cnames[i,2]
  
  }
  return(x)
}
