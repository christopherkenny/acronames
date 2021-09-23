#' Create a Dictionary
#'
#' @param dict tibble with column `word`
#'
#' @return tibble
#' @export
#'
#' @examples
#' dict <- dictionary()
dictionary <- function(dict = words::words) {
  dict %>%
    tibble::as_tibble() %>%
    dplyr::mutate(chars = letters_list(word))
}
