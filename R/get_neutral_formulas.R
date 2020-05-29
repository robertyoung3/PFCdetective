#' get_neutral_formulas
#'
#' This function takes a neutral monoisotopic mass and returns a series of elemental compositions, up to the maximum number of formulas specified in the num_formulas parameter.
#'
#' @param neutral_mass a numeric containing the neutral monoisotopic mass of a chemical compound
#' @param num_formulas an integer indicating the maximum number of elemental compositions to return (default = 10)
#' @param mfRange a character string defining the range of expected elemental compositions (default = "C3-50 H0-100 O0-10 F2-30" for PFC characterization)
#'
#' @return a tibble of elemental compositions
#' @export
#'
#' @examples
#' neutral_mass <- 413.9735            ## C8HF15O2 (PFOA) with small error
#' get_neutral_formulas(neutral_mass)
get_neutral_formulas <- function(neutral_mass, num_formulas = 10, mfRange = "C3-50 H0-100 O0-10 F2-30") {
  ## returns results of query to ChemCalc website
  query <- paste("http://www.chemcalc.org/chemcalc/em?monoisotopicMass=", neutral_mass,
                 "&mfRange=", mfRange, sep = " ")
  resJSON <- rjson::fromJSON(paste(readLines(query), collapse = ""))
  ## resJSON is a list that includes a count of results and a list of results
  ## the list of results includes the formula, theoretical mass (em), and ppm error

  num_results <- min(num_formulas, resJSON$numberResults)

  ## create df containing designated number of formulas
  for (mf_index in 1:num_results) {                                                         ## gets top 10
    results <- tibble::tibble("formula" = resJSON$results[[mf_index]]$mf,
                              "neutral_mass" = resJSON$results[[mf_index]]$em,
                              "ppm_error" = resJSON$results[[mf_index]]$ppm)
    ifelse(!exists('report'), report <- results, report <- rbind(report,results))
  }
  return(report)
}
