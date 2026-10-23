#' Transformation d'un tableau par dédoublement des colonnes
#'
#' La fonction effectue un recodage par dédoublement des colonnes d'un tableau.
#'
#' @param x un \code{data.frame}
#' @param params une \code{list} de paramètres
#' @param a_Q un \code{vector} numérique
#' @param b_Q un \code{vector} numérique
#' @param inverse Logical. Le codage des données devrait-il être inversé ?
#'
#' @returns un \code{data.frame} avec les colonnes dédoublées
#' @importFrom stats setNames
#' @import utils
#'
#' @export
#'
#' @details
#' `params` est une liste de paramètres, éventuellement générée par la fonction `creer_parametres()`, contenant au moins une liste nommée `Labels` avec l'ensemble des libellés des individus (un vecteur nommé `Individus`), des variables (un vecteur nommé `Variables`) et des échelles (une liste nommée `Scales`). `a_Q` et `b_Q` sont des vecteurs de même longueur que `ncol(x)` et renvoie la valeur minimale et maximale respectivement pour une question ordinale.
#'
#' @references
#' - J.-P. Benzécri (1980). Pratique de l'analyse des données, Paperback Octavo édition. Paris: Dunod
#' - Greenacre M. (1984). Theory and applications of correspondence analysis. London: Academic Press
#' - Greenacre M. (2014). Data doubling and fuzzy coding, in Blasius, J. and Greenacre, M., *Visualization and Verbalization of Data*. Chapman & Hall/CRC
#'
#' @examples
#' library(readr)
#' filename <- system.file("extdata/example.csv", package = "gda.toolkit")
#' example <- read_csv2(filename, col_select = -Annee)
#' a_Q <- rep(1, ncol(example))
#' b_Q <- rep(4, ncol(example))
#' parametres <- creer_parametres(example, a_Q = a_Q, b_Q = b_Q)
#' df <- creer_double(example, params = parametres, a_Q = a_Q, b_Q = b_Q)
#' head(df)
creer_double <- function(x, params, a_Q = NULL, b_Q = NULL, inverse = FALSE) {
   x <- as.data.frame(x)
   cardI <- nrow(x)
   cardQ <- ncol(x)
   stopifnot("'params' must be a list" = inherits(params, "list"))
   stopifnot("No item named 'Labels' found in 'params' list" = "Labels" %in% names(params))
   I_labels <- get("Individus", params[["Labels"]])
   I_labels <- if(length(I_labels)==0 || length(I_labels)!=cardI) rownames(x) else I_labels
   Q_labels <- get("Variables", params[["Labels"]])
   Q_labels <- if(length(Q_labels)==0 || length(Q_labels)!=cardQ) colnames(x) else Q_labels
   scale_labels <- get("Scales", params[["Labels"]])
   if (length(scale_labels)==0 || length(scale_labels) != cardQ) {
      scale_labels <- lapply(1:cardQ, function(q) c(paste0(Q_labels[q],"+"),
                                                    paste0(Q_labels[q],"-")))
   }
   scale_labels <- setNames(scale_labels, Q_labels)
   input <- test_inputs(x, a_Q, b_Q)
   a_Q <- input$a_Q; b_Q <- input$b_Q
   a_Q <- setNames(a_Q, Q_labels)
   b_Q <- setNames(b_Q, Q_labels)
      e_Q <- b_Q - a_Q
   m <- t(as.matrix(x))
   if (inverse) {
      #x_inv <- lapply(1:ncol(x), function(q) b_Q[q] - x[, q] + 1)
      m_inv <- t(b_Q - m + 1)
      x <- as.data.frame(m_inv, row.names = I_labels, col.names = Q_labels)
   }
   recode_double <- function(q) {
      col1 = (x[, q] - a_Q[q]) / e_Q[q]
      col2 = (b_Q[q] - x[, q]) / e_Q[q]
      new_cols <- cbind(col1, col2)
      dimnames(new_cols) <- list(I_labels, scale_labels[[q]])
      return(new_cols)
   }
   res <- lapply(1:ncol(x), recode_double)
   res <- do.call(cbind, res)
   return(as.data.frame(res, check.names = FALSE))
}
