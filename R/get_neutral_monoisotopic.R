#' get_neutral_monoisotopic
#'
#' This function converts a molecular formula into its neutral monoisotopic mass.
#'
#' @param formula a character string containing a molecular formula
#'
#' @return numeric containing the neutral monoisotopic mass
#' @export
#'
#' @examples
#' formula = "C8 H1 F15 O2"    ## PFOA with spaces
#' get_neutral_monoisotopic(formula)
#'
#' formula = "C8HO2F15"        ## PFOA without spaces and subscript = 1
#' get_neutral_monoisotopic(formula)
#'
#' formula = "H1 O2 F15 C8"    ## PFOA scrambled
#' get_neutral_monoisotopic(formula)
#'
#' formula = "C27H46O"         ## cholesterol
#' get_neutral_monoisotopic(formula)
#'
#' formula = "C27H40OD6"       ## d6-cholesterol; returns D as [2H]
#' get_neutral_monoisotopic(formula)
get_neutral_monoisotopic <- function(formula) {
  formula <- stringr::str_replace_all(formula, stringr::fixed(" "), "")
  query <- paste("http://www.chemcalc.org/chemcalc/mf?mf=", formula, sep = "")
  resJSON <- rjson::fromJSON(paste(readr::read_lines(query), collapse = ""))
  resJSON$em
}
