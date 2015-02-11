#' Looks for approximate matches to \code{x} (the first argument)
#' within \code{name} (the second) argument.
#' 
#' @param x
#'    The name to search
#' @param names
#'    The candidates of the correct.
#' @param threshold
#'    The maximum distance between the misspell (\code{x}) and the correct answer (in \code{name}).
#' 
#' @seealso agrep
findSimilarName <- function(x, names, threshold=2) {
   d <- adist(x, names)
   names[d == min(d) & d <= threshold]
}
