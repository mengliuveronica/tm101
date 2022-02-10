#' spell_correct
#'
#' @param term 
#'
#' @return
#' @export
#'
#' @examples
spell_correct <- function(term) {
   correction <- case_when(
      # check and (if required) correct spelling
      !hunspell_check(term, dictionary('en_GB')) ~
         hunspell_suggest(term, dictionary('en_GB')) %>%
         # get first suggestion, or NA if suggestions list is empty
         map(1, .default = NA) %>%
         unlist(),
      TRUE ~ term # if term is correct
   )
   # if term incorrectly spelled but no suggestions, return original term
   ifelse(is.na(correction), term, correction)
}