#' Looks for approximate matches to \code{x} (the first argument)
#' within \code{name} (the second) argument.
#' 
#' @param x
#'    A string giving the (misspelt) name to search for.
#' @param names
#'    A character vector of correct names to match against.
#' @param threshold
#'    The maximum distance between the misspell (\code{x}) and the correct answer (in \code{name}).
#' @param max_n
#'    An integer limiting the number of results.  Passed to \code{\link[utils]{head}}.
#' @seealso \code{\link[utils]{adist}} calculates the distance between strings.
#' \code{\link[base]{agrep}} and \code{\link[stringdist]{stringdist-package}} 
#' provide alternate metrics for these distances.
#' @examples
#' \donttest{
#' x <- "logg"
#' names <- DYM:::getNames(x)
#' lapply(
#'   stats::setNames(0:4, 0:4), 
#'   function(i) DYM:::findSimilarName(x, names, threshold = i)
#' )
#' }
#' @importFrom stats na.omit
#' @importFrom utils adist
#' @importFrom utils head
findSimilarName <- function (x, names, threshold = 2, max_n = 10) 
{
   if (is.na(x)) {
      character(0)
   }
   else {
      names <- na.omit(names)
      d <- as.integer(adist(x, names))
      distance_data <- data.frame(
         names = names, 
         distance = d,
         stringsAsFactors = FALSE
      )[order(d), ]
      distance_data <- distance_data[distance_data$distance <= threshold, ]
      head(distance_data, max_n)$names
   }
}
