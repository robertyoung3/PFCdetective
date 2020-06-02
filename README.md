# PFCdetective
## Utilities for Analyzing Mass Spectrometry Data for Perfluorinated Compounds (PFCs)

Currently, the package contains utilities for interacting with the ChemCalc website ([chemcalc.org](https://www.chemcalc.org/)). These utilities (1) take molecular formulas and return monoisotopic masses, and (2) take monoisotopic masses and return a series of elemental compositions based on input parameters, including the range of expected elemental compositions. The operation of these functions is described in an R Markdown document called "Rfunctions4ChemCalc.Rmd".

Future versions of PFCdetective will include functions to compare detected monoisotopic masses to lists of known perfluorinated compounds (PFCs), and functions to compute and group detected monoisotopic masses by their Kendrick mass defects (repeating unit = CF2).
