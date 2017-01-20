
parse.ordered.name <- function(x,
                               prefixes = c('MR','DR','MISS','MS','MRS'),
                               suffixes = c('JR','II','III','IV')) {
  # make a copy
  input.name <- x[1]

  # replace periods with spaces
  x <- trimws(toupper(gsub('.', ' ', x[1], fixed = TRUE)))

  # remove punctuation
  x <- gsub('[[:punct:]]', '', x)

  # split words in to vector
  x <- strsplit(x,' ')[[1]];

  # remove prefix
  removal <- remove.elements(x, prefixes)
  prefix <- removal$removed_names
  x <- removal$names

  # remove suffix
  removal <- remove.elements(x, suffixes)
  suffix <- removal$removed_names
  x <- removal$names

  # mush data
  # MC DE LA MAC DES

  # re-org/ for double spaces
  d <- which(nchar(x) %in% 0)[1]
  q <- (!is.na(d) && d==2)

  if (q) {
    x <- x[c(d:length(x),1:(d-1) )]
    x <- x[! x %in% '']
  }

  # re-org/order name based on simple ruling
  l <- nchar(x)  # length of each element
  i <- length(x) # number of elements in the vector

  if (!q && i >= 3) {
    if (l[i]==1) {                       # flip names with far right initial
      x <- x[c(2:i,1)]
    }
  } else if (!q && i == 2) {
      x <- x[c(2,1)]
  }

  # build output
  salutation.name <- prefix[1]
  first.name <- x[1]
  middle.initial <- ifelse(i>2, substr(x[2],1,1), '')
  middle.name <- ifelse(i>2, paste(x[c(-1,-i)], collapse = ' '), '')
  last.name <- x[i]
  suffix.name <- suffix[1]
  ancillary.name <- paste(c(prefix[-1],suffix[-1],x[c(-1,-i)],''), collapse = ' ')
  suggested.name <- trimws(paste(first.name, middle.initial, last.name, suffix.name, collapse = ' '))

  # get ancillary initial
  rv <- data.frame(input.name, suggested.name, salutation.name, first.name, middle.initial, middle.name, last.name, suffix.name, ancillary.name, stringsAsFactors = FALSE)
  colnames(rv) <- c('input_name', 'suggested_name', 'salutation','first_name','middle_initial', 'middle_name', 'last_name','suffix','ancillary_naming')

  return(list(rv))
}
