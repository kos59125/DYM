#' Finds the misspelled object.
#' 
#' When this function is called after an error,
#' it looks for the error message of missing value
#' and returns the name of the mistype if it is found.
getMissingVariable <- function() {
   errorMessage <- geterrmessage()

   errorTypes <- c("obj", "fun", "lib")
   for (errorType in errorTypes) {
      class(errorMessage) <- errorType
      result <- findMissingVariable(errorMessage)
      if (!is.na(result)) {
         return(result)
      }
   }
   NA_character_
}

patternQuote <- function(x) {
   gsub("(\\[|\\]|^)", "\\\\\\1", x)
}

makePattern <- function(notFound, quote.start, quote.end) {
   pattern <- sprintf("%s%%s%s", quote.start, quote.end)
   quoteCharacters <- unique(unlist(strsplit(c(quote.start, quote.end), "")))
   capturedPattern <- paste(patternQuote(quoteCharacters), collapse="")
   replacement <- sprintf("%s([^%s]+)%s", quote.start, capturedPattern, quote.end)
   sub(pattern, replacement, sprintf("^.*%s.*$", notFound))
}

findMissingVariable <- function(errorMessage) {
   UseMethod("findMissingVariable")
}

findMissingVariable_common <- function(errorMessage, notFound, pattern) {
   if (grepl(pattern, errorMessage)) {
      sub(pattern, "\\1", errorMessage)
   } else {
      NA_character_
   }
}

findMissingVariable.fun <- function(errorMessage) {
   notFound <- gettext("could not find function \"%s\"", domain="R")
   pattern <- makePattern(notFound, "\"", "\"")
   findMissingVariable_common(errorMessage, notFound, pattern)
}

findMissingVariable.obj <- function(errorMessage) {
   notFound <- gettext("object '%s' not found", domain="R")
   pattern <- makePattern(notFound, "'", "'")
   findMissingVariable_common(errorMessage, notFound, pattern)
}

findMissingVariable.lib <- function(errorMessage) {
   notFound <- gettextf("there is no package called %s", sQuote("%s"))
   pattern <- makePattern(notFound, "\u2018", "\u2019")
   findMissingVariable_common(errorMessage, notFound, pattern)
}
