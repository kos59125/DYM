#' DYM
#' 
#' You might mistype an object name.
#' The package suggests the correct spell of the object you meant.
#' 
#' @name DYM
#' @docType package
NULL

#' If the function is called after an error of 'object not found',
#' the function tries to tell you the name of the correct name that you meant.
#' 
#' @export
DYM <- function() {
   missingVariable <- getMissingVariable()
   availableVariables <- getNames()
   names <- findSimilarName(missingVariable, availableVariables)
   if (length(names) > 0L) {
      message <- ngettext(length(names), "Did you mean: %s", "Did you mean: [%s]", domain="R-DYM")
      hints <- sapply(names, sprintf, fmt="'%s'")  # sQuote might be better
      message(sprintf(message, paste(hints, collapse=", ")))
   }
}
