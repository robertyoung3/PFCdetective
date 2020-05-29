#' subtract_proton
#'
#' This function subtracts the mass of a proton from a monoisotopic mass (e.g., from a protonated m/z value to obtain its neutral analogue).
#'
#' @param mass a numeric containing a monoisotopic mass
#'
#' @return a numeric containing the monoisotopic mass after proton subtraction
#' @export
#'
#' @examples
#' mz <- 414.9814                ## protonated PFOA with small error
#' subtract_proton(mz)
subtract_proton <- function(mass) {
  mass_proton <- 1.007277
  mass - mass_proton
}
