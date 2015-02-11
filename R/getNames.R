#' Retrieves available symbols in the specified environment.
#' 
#' @param envir
#'    The base environment to search variables.
getNames <- function(envir=.GlobalEnv){
   current <- envir
   table <- character(0L)
   while (!identical(current, emptyenv())) {
      variables <- ls(envir=current)
      variables <- variables[isVariableName(variables)]
      table <- union(table, variables)
      current <- parent.env(current)
   }
   sort(table)
}

#' Checks if the given \code{name} is valid as a variable name for R.
#' 
#' @param name
#'    A character vector to check.
isVariableName <- function(name) {
   make.names(name) == name
}
