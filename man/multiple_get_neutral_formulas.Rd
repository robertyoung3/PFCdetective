% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/multiple_get_neutral_formulas.R
\name{multiple_get_neutral_formulas}
\alias{multiple_get_neutral_formulas}
\title{multiple_get_neutral_formulas}
\usage{
multiple_get_neutral_formulas(
  neutral_masses,
  num_formulas = 10,
  mfRange = "C3-50 H0-100 O0-10 F2-30"
)
}
\arguments{
\item{neutral_masses}{a vector of numerics containing the neutral monoisotopic masses}

\item{num_formulas}{an integer indicating the maximum number of elemental compositions to return (default = 10)}

\item{mfRange}{a character string defining the range of expected elemental compositions (default = "C3-50 H0-100 O0-10 F2-30" for PFC characterization)}
}
\value{
a named list where each list element contains a tibble of elemental compositions
}
\description{
This function applies the get_formulas() function to a group of neutral monoisotopic masses, rather than a single mass.
}
\examples{
neutral_masses <- c(413.9735,          ## C8HF15O2 (PFOA) with small error
                    318.0301,          ## C9H7F9O2 with small error
                    518.0175)          ## C13H7F17O2 with small error
multiple_get_neutral_formulas(neutral_masses)
}
