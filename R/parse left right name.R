


parse.left.right.name <- function(x) {
  
  rv <- NA
  
  # replace periods with spaces
  x <- toupper(gsub('.', ' ', x[1], fixed = TRUE))
  
  # remove punctuation
  x <- gsub('[[:punct:]]', '', x)
  
  # get left and right name
  x <- strsplit(x,' ')[[1]];
  
  # remove prefix
  prefixes <- c('MR','DR','MISS','MS','MRS')
  prefix <- x[x %in% prefixes]
  x <- x[! x %in% prefixes]
  
  # remove suffix
  suffixes <- c('JR','II','III','IV')
  suffix <- x[x %in% suffixes] 
  x <- x[! x %in% suffixes]
  
  # get left and right name
  y <- rev(x)
  z <- nchar(x)[is.element(nchar(x),tail(sort(nchar(x)),2))]
  
  rv <- c(x[nchar(x) == z[1]][1], y[nchar(y) == max(z[2:length(z)])][1])
  
  # get ancilary initial
  x <- x[! x %in% rv]
  rv <- c(prefix[1], rv, substr(x[1],1,1), suffix[1], x[! x %in% c('')])
  
  return(rv);
}

