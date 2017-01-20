remove.punctuation <- function(x) {
  return(gsub('(?<=[\\s])\\s*|^\\s+|\\s+$', '', x, perl=TRUE))
}