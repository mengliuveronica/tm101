#' spell_correct
#'
#' @param term the term to check  
#'
#' @return
#' @export
#'
#' @examples

spell_correct <- function(term) {
      # if the term is spelled correctly, leave it as is
      if (hunspell::hunspell_check(term)) {
            return(term)
      }
      
      suggestions <- hunspell::hunspell_suggest(term)[[1]]
      
      # if hunspell found a suggestion, use the first one
      if (length(suggestions) > 0) {
            suggestions[[1]]
      } else {
            # otherwise, use the original term
            term
      }
}