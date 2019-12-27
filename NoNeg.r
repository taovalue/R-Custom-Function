# this function will check wehther the value is less than 0, if so will return 0, otherwise will return the value itself.

NoNeg <- function(data) {
  require(dplyr)
  
  case_when(data < 0 ~ 0,
            TRUE ~ data)
}

# test function
# a = 10
# b = -1
# c = -0.01
# d = c(a, b, c)
# 
# NoNeg(d)


NoNeg.df <- function(data = NULL) {
  require(dplyr)
  
  d = dim(data)
  n = names(data)
  
  z = lapply(X = as.list(data), FUN = NoNeg)
  z = unlist(z)
  dim(z) = d
  z = as.data.frame(z)
  names(z) = n
  return(z)
  
}