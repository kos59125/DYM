#' Retrieves available symbols in the specified environment.
#' 
#' @param envir
#'    The base environment to search variables.
getNames <- function(envir=.GlobalEnv){
   current <- envir
   table <- character(0L)
   while (!identical(current, emptyenv())) {
      variables <- ls(envir=current)
      variables <- variables[grep("^[.a-zA-Z][_.a-zA-Z0-9]*$", variables)]
      table <- union(table, variables)
      current <- parent.env(current)
   }
   sort(table)
}
