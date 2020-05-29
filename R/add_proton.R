#' add_proton
#'
#' This function adds the mass of a proton to a monoisotopic mass (e.g., to a deprotonated m/z to obtain its neutral analogue).
#'
#' @param mass a numeric containing a monoisotopic mass
#'
#' @return a numeric containing the monoisotopic mass after proton addition
#' @export
#'
#' @examples
#' mz <- 412.9664                ## deprotonated PFOA with small error
#' add_proton(mz)
add_proton <- function(mass) {
  mass_proton <- 1.007277
  mass + mass_proton
}
