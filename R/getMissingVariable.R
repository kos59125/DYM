#' Finds the misspelled object.
#' 
#' When this function is called after an error,
#' it looks for the error message of missing value
#' and returns the name of the mistype if it is found.
getMissingVariable <- function() {
   errorMessage <- geterrmessage()
   
   functionNotFound <- ngettext(1L, "could not find function \"%s\"", "", domain="R")
   functionNotFoundPattern <- sub("\"%s\"", "\"([^\"]+)\"", sprintf("^.*%s.*$", functionNotFound))

   objectNotFound <- ngettext(1L, "object '%s' not found", "", domain="R")
   objectNotFoundPattern <- sub("'%s'", "'([^']+)'", sprintf("^.*%s.*$", objectNotFound))
   
   if (grepl(functionNotFoundPattern, errorMessage)) {
      sub(functionNotFoundPattern, "\\1", errorMessage)
   } else if (grepl(objectNotFoundPattern, errorMessage)) {
      sub(objectNotFoundPattern, "\\1", errorMessage)
   } else {
      NA_character_
   }
}
