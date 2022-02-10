#' spell_correct
#'
#' @param terms 
#'
#' @return
#' @export
#'
#' @examples
spell_correct <- function(terms) {
   # Figure out what's ok already.
   spelled_correctly <- hunspell::hunspell_check(terms)
   
   # Get suggestions for the bad ones.
   suggestions <- hunspell::hunspell_suggest(terms[!spelled_correctly])
   
   # Pull out the first suggestion, defaulting to NA if there aren't any.
   replacements <- purrr::map_chr(suggestions, 1, .default = NA)
   
   # Replace the misspellings with the replacements. Use the term if there isn't
   # a replacement.
   terms[!spelled_correctly] <- dplyr::coalesce(
      replacements,
      terms[!spelled_correctly]
   )
   
   return(terms)
}