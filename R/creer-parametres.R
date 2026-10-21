#' Création des paramètres d'un tableau à analyser
#'
#' La fonction retourne une liste de paramètres d'un tableau de données.
#'
#' @param x un \code{data.frame}
#' @param poids_I un \code{vector} numérique
#' @param Ilabels un \code{vector} string
#' @param poids_Q un \code{vector} numérique
#' @param Qlabels un \code{vector} string
#' @param scale_labels une \code{list} de libellés des échelles
#' @param a_Q un \code{vector} numérique
#' @param b_Q un \code{vector} numérique
#'
#' @returns une liste de paramètres de `x` nécessaires à l'analyse
#'
#' @importFrom readr read_csv2
#' @importFrom stats setNames
#' @import utils
#'
#' @export
#'
#' @details
#' `poids_I` et `Ilabels` sont des vecteurs de même longueur que `nrow(x)`. `poids_Q` et `Qlabels` sont des vecteurs de même longueur que `ncol(x)`. `scale_labels` est une liste de libellés des échelles des variables, de même longueur que `ncol(x)`. `a_Q` et `b_Q` sont des vecteurs de même longueur que `ncol(x)` et renvoie la valeur minimale et maximale respectivement pour une question ordinale.
#'
#' @examples
#' filename <- system.file("extdata/example.csv", package = "gda.toolkit")
#' example <- readr::read_csv2(filename, col_select = -Annee)
#' parametres <- creer_parametres(example)
creer_parametres <- function(x, poids_I = NULL, Ilabels = NULL, poids_Q = NULL, Qlabels = NULL, scale_labels = NULL, a_Q = NULL, b_Q = NULL){
   x <- as.data.frame(x)
   cardI <- nrow(x)
   cardQ <- ncol(x)
   if (is.null(poids_I) || !is.vector(poids_I) || length(poids_I)!=cardI) {
      n_I <- rep(1, cardI)
   }
   else n_I = poids_I
   if (is.null(poids_Q) || !is.vector(poids_Q) || length(poids_Q)!=cardQ) {
      m_Q <- as.numeric(rep(1, cardQ))
   }
   else m_Q <- poids_Q
   I_labels <- if(length(Ilabels)==nrow(x)) Ilabels else rownames(x)
   Q_labels <- if(length(Qlabels)==ncol(x)) Qlabels else colnames(x)
   scale_labels <- if (length(scale_labels)==ncol(x) & inherits(scale_labels, "list")) scale_labels
   else lapply(1:length(Q_labels), function(q) c(paste0(Q_labels[q],"+"), paste0(Q_labels[q],"-")))
   scale_labels <- setNames(scale_labels, Q_labels)
   input <- test_inputs(x, a_Q, b_Q)
   a_Q <- input$a_Q; b_Q <- input$b_Q
   a_Q <- setNames(a_Q, Q_labels)
   b_Q <- setNames(b_Q, Q_labels)
   params <- list(Dimension = c(cardI, cardQ),
                  n_I = n_I, m_Q = m_Q,
                  Labels = list(Individus = I_labels, Variables = Q_labels,
                  Scales = scale_labels),
                  a_Q = a_Q, b_Q = b_Q)
   return(params)
}
