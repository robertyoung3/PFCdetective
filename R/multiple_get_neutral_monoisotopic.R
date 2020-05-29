#' multiple_get_neutral_monoisotopic
#'
#' This function applies the get_neutral_monoisotopic() function to a group of molecular formulas, rather than a single molecular formula.
#'
#' @param formulas a vector of character strings containing molecular formulas
#'
#' @return a tibble containing the molecular formulas and their monoisotopic masses
#' @export
#'
#' @examples
#' formulas <- c("C8HF15O2",              ##  413.9735 u (PFOA)
#'               "C9H7F9O2",              ##  413.9735 u
#'               "C13H7F17O2")            ##  413.9735 u
#' multiple_get_neutral_monoisotopic(formulas)
multiple_get_neutral_monoisotopic <- function(formulas) {
  multiple_masses <- formulas %>%
    purrr::map_dbl(get_neutral_monoisotopic)
  rlang::set_names(multiple_masses, formulas)
}
