#' Add the snippets to your ~/.R/snippets/r.snippets
#'
#' @return A message about the success of the copy.
#' @export
#'
#' @examples
#' \dontrun{
#' add_snippets()
#' }

add_snippets <- function(){
  
  res <- FALSE
  
  if (! file.exists("~/.R/snippets/r.snippets")){
    message("~/.R/snippets/r.snippets does not exist.")
    message("Create it?")
    x <- readline("Type Y/y to confirm. ")
    
    if (tolower(x) == "y"){
      file.create("~/.R/snippets/r.snippets")
    } else {
      message("Copy not done")
      return(invisible(res))
    }
  }
  
  message("This command will write in ~/.R/snippets/r.snippets")
  message("Do you wish to continue?")
  x <- readline("Type Y/y to confirm. ")
  
  if (tolower(x) == "y"){
    res <- file.append("~/.R/snippets/r.snippets", 
                system.file("snippets.txt", 
                            package = "shinysnippets"))
  }
  if (res){
    message("Done!")
    message("Restart RStudio to have access to the snippets.")
  } else {
    message("Copy not done")
    return(invisible(res))
  }
}
