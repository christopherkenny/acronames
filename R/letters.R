#' Create Letters List
#'
#' @param word list of words
#'
#' @return list
#' @export
#'
#' @examples
#' letters_list('abacus')
letters_list <- function(word) {
  word <- strsplit(tolower(word),character(0))
  lapply(word, letters_vec)
}

letters_vec <- function(lets) {
  vapply(letters, function(x) sum(lets == x), 0)
}
