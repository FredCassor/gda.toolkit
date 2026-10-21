#' Calibrage des données pour la Bipolar Scale Analysis
#'
#' @param x un \code{data.frame}
#' @param a_Q un \code{vector} numérique
#' @param b_Q un \code{vector} numérique
#' @param params une \code{list} de paramètres
#' @param inverse Logical. Le codage des données devrait-il être inversé ?
#'
#' @returns un \code{data.frame}
#' @export
#' @import utils
#'
#' @details
#' `params` est une liste de paramètres, éventuellement générée par la fonction `creer_parametres()`, contenant au moins une liste nommée `Labels` avec l'ensemble des libellés des individus (un vecteur nommé `Individus`), des variables (un vecteur nommé `Variables`) et des échelles (une liste nommée `Scales`). `a_Q` et `b_Q` sont des vecteurs de même longueur que `ncol(x)` et renvoie la valeur minimale et maximale respectivement pour une question ordinale.
#'
#' @examples
#' library(readr)
#' filename <- system.file("extdata/example.csv", package = "gda.toolkit")
#' example <- read_csv2(filename, col_select = -Annee)
#' a_Q <- rep(1, ncol(example))
#' b_Q <- rep(4, ncol(example))
#' parametres <- creer_parametres(example, a_Q = a_Q, b_Q = b_Q)
#' df <- scaler_bsa(example, a_Q, b_Q, parametres, inverse = TRUE)
#' head(df)
scaler_bsa = function(x, a_Q, b_Q, params, inverse = FALSE) {
   x <- as.data.frame(x)
   cardI <- nrow(x)
   cardQ <- ncol(x)
   stopifnot("'params' must be a list" = inherits(params, "list"))
   stopifnot("No item named 'Labels' found in 'params' list" = "Labels" %in% names(params))
   I_labels <- get("Individus", params[["Labels"]])
   I_labels <- if(length(I_labels)==0 || length(I_labels)!=cardI) rownames(x) else I_labels
   #row_names <- if(length(row_labels)==nrow(x)) row_labels else row.names(x)
   Q_labels <- get("Variables", params[["Labels"]])
   Q_labels <- if(length(Q_labels)==0 || length(Q_labels)!=cardQ) colnames(x) else Q_labels
   input <- test_inputs(x, a_Q, b_Q)
   a_Q <- input$a_Q; b_Q <- input$b_Q
   e_Q = b_Q - a_Q
   m <- t(as.matrix(x))
   s_IQ <- if (inverse) (b_Q - m)/e_Q else (m - a_Q)/e_Q
   s_IQ <- t(s_IQ)
   res = as.data.frame(s_IQ, check.names=FALSE)
   #colnames(res) = paste0(colnames(x),"_01")
   return(res)
}
