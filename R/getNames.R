#' Retrieves available symbols in the specified environment.
#' 
#' @param envir
#'    The base environment to search variables.
getNames <- function(envir=.GlobalEnv, mode=c("obj", "fun", "lib")){
   mode <- match.arg(mode)
   
   if (mode == "lib") {
      packages <- installed.packages()
      return(attr(packages, "dimnames")[[1L]])
   }
   
   current <- envir
   table <- character(0L)
   while (!identical(current, emptyenv())) {
      variables <- ls(envir=current)
      variables <- variables[isVariableName(variables)]
      table <- union(table, variables)
      current <- parent.env(current)
   }
   
   ## FIXME: Bad performance
#    if (mode == "fun") {
#       table <- table[sapply(table, exists, envir=envir, mode="function")]
#    }
   
   sort(table)
}

#' Checks if the given \code{name} is valid as a variable name for R.
#' 
#' @param name
#'    A character vector to check.
isVariableName <- function(name) {
   make.names(name) == name
}
