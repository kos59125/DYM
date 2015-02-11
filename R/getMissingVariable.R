#' Finds the misspelled object.
#' 
#' When this function is called after an error,
#' it looks for the error message of missing value
#' and returns the name of the mistype if it is found.
getMissingVariable <- function() {
   errorMessage <- geterrmessage()
   notFound <- ngettext(1L, "object '%s' not found", "", domain="R")
   pattern <- sub("'%s'", "'([^']+)'", sprintf("^.*%s.*$", notFound))
   if (grepl(pattern, errorMessage)) {
      sub(pattern, "\\1", errorMessage)
   } else {
      NA_character_
   }
}
