#' Filtre par annee
#'
#' @param x \code{data.frame} avec la colonne nommée Annee
#' @param annee Vague annuelle de l'enquête
#'
#' @importFrom dplyr filter
# @importFrom rlang .data
#'
#' @return un \code{data.frame} filtré
#' @export
#'
#' @examples
#' filename <- system.file("extdata/example.csv", package = "gda.toolkit")
#' example <- read.csv2(filename)
#' filtre_par_annee(example, 2017)
filtre_par_annee <- function(x, annee){
   # Test
   stopifnot("x devrait contenir la colonne 'age'" = "Annee" %in% names(x))
   dplyr::filter(x, Annee == annee)
}
