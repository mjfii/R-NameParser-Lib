#' Parse Names on Credit Cards
#'
#' This function returns a data frame of parse attributes based on an input of credit card names.
#' @param x Provide the charater vector to parse.
#' @param ... clean up
#' @keywords parse
#' @export
#' @examples
#' x <- get.demo.data
#' y <- parse.names(x)
parse.names <- function(x, ...) {

    # if class (x) is dataframe, take first string column
    # if class (x) is factor vector, convert
    # if class (x) is non-string then throw error

    # else use x
  input_names <- x

  # determine path

  # remove suffixes

  z <- data.frame(Reduce(rbind, sapply(input_names, parse.ordered.name)))

  return(z)
}
