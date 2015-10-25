## The responsibility of the function includes the following:
## 1. Read the activity_labels.txt
## 2. Replace the input with the look up values from activity_labels.txt
##

assignActivityNames <- function( x ){
  
  ## Read activity_labels.txt
  actnames <- read.table("activity_labels.txt", stringsAsFactors = FALSE)
  
  for( i in 1:nrow(x) ) {
    for( j in 1:nrow(actnames) ) { 
      x[i,]<- gsub(actnames[j,1], actnames[j,2], x[i,])
    }
  }
  return(x)
}
