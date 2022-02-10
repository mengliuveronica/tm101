#' Title
#'
#' @param input 
#'
#' @return
#' @export
#'
#' @examples
spell_correct <- function(input) {
   output <- case_when(
      # check and (if required) correct spelling
      !hunspell::hunspell_check(input, dictionary('en_GB')) ~
         hunspell::hunspell_suggest(input, dictionary('en_GB')) %>%
         # get first suggestion, or NA if suggestions list is empty
         purrr::map(1, .default = NA) %>%
         unlist(),
      TRUE ~ input # if word is correct
   )
   # if input incorrectly spelled but no suggestions, return input word
   ifelse(is.na(output), input, output)
}
