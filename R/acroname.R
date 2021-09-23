#' Create Names using Acronyms
#'
#' @param required list of required words. Words that are alternatives for each
#' other should be a character vector entry to the list.
#' @param optional list of optional words. Words that are alternatives for each
#' other should be a character vector entry to the list.
#' @param dict the dictionary of acceptable words. Must contain a column with
#' the name word.
#'
#' @return vector of possibilities
#' @export
#'
#' @examples
#' test <- acroname(required = list('Harvard', c('Automated', 'Algorithmic'),
#' 'Redistricting', c('Team', 'Project', 'Group')), optional = list('Methodology'))
acroname <- function(required = list(), optional = list(),
                     dict = dictionary()){
  # Assume inputs fine ----
  # TODO; don't assume they are

  # Pre process ----
  rw <- lapply(required, function(x){tolower(stringr::str_sub(x, 1, 1))})
  ow <- lapply(optional, function(x){tolower(stringr::str_sub(x, 1, 1))})

  rw <- lapply(rw, unique)
  ow <- lapply(ow, unique)

  rx <- expand.grid(rw, stringsAsFactors = FALSE) %>%
    as.matrix() %>% unname()
  rxmat <- apply(rx, 1, letters_vec) %>% t()

  ox <- expand.grid(ow, stringsAsFactors = FALSE) %>%
    as.matrix() %>% unname()
  oxmat <- apply(ox, 1, letters_vec) %>% t()

  # Search! ----
  if (!'chars' %in% names(dict)) {
    dict <- dict %>%
      dplyr::mutate(chars = letters_list(word))
  }

  poss <- apply(rxmat, 1, function(a){
    sapply(dict$chars, function(x){
      all(x >= a)
    })
  })

  dict <- dict %>%
    dplyr::filter(apply(poss, 1, any))


  if (ncol(oxmat) == 0) {
    oxmat <- vector('integer', 26)
  } else {
    combmat <- apply(rxmat, 1, \(x) x + oxmat) %>% t()
  }

  poss <- apply(combmat, 1, function(a){
    sapply(dict$chars, function(x){
      all(x <= a)
    })
  })

  dict <- dict %>%
    dplyr::filter(apply(poss, 1, any))

  dict %>%
    dplyr::pull(word)
}
