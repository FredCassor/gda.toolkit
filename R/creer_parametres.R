#' Création des paramètres d'un tableau à analyser
#'
#' La fonction retourne une liste de paramètres d'un tableau de données.
#'
#' @param x un \code{data.frame}
#' @param poids_I un \code{vector} numérique
#' @param Ilabels un \code{vector} string
#' @param poids_Q un \code{vector} numérique
#' @param Qlabels un \code{vector} string
#' @param a_Q un \code{vector} numérique
#' @param b_Q un \code{vector} numérique
#'
#' @returns une liste de paramètres de `x` nécessaires à l'analyse
#'
#' @importFrom readr read_csv2
#' @importFrom stats setNames
#' @export
#'
#' @note
#' `poids_I` et `Ilabels` sont des vecteurs de même longueur que `nrow(x)`. `poids_Q` et `Qlabels` sont des vecteurs de même longueur que `ncol(x)`. `a_Q` et `b_Q` sont des vecteurs de même longueur que `ncol(x)` et renvoie la valeur minimale et maximale respectivement pour une question ordinale.
#'
#' @examples
#' filename <- system.file("extdata/example.csv", package = "gda.toolkit")
#' example <- readr::read_csv2(filename, col_select = -Annee)
#' parametres <- creer_parametres(example)
creer_parametres <- function(x, poids_I = NULL, Ilabels = NULL, poids_Q = NULL, Qlabels = NULL, a_Q = NULL, b_Q = NULL){
   x <- as.data.frame(x)
   cardI <- nrow(x)
   cardQ <- ncol(x)
   if (is.null(poids_I) || !is.vector(poids_I) || length(poids_I)!=cardI) {
      n_I <- rep(1, cardI)
   }
   if (is.null(poids_Q) || !is.vector(poids_Q) || length(poids_Q)!=cardQ) {
      m_Q <- as.numeric(rep(1, cardQ))
      w_Q <- rep(m_Q, each=2)
   }
   if (is.null(Ilabels) || !is.vector(Ilabels) || length(Ilabels)!=cardI) {
      I_labels = rownames(x)
   }
   if (is.null(Qlabels) || !is.vector(Qlabels) || length(Qlabels)!=cardQ) {
      Q_labels = colnames(x)
   }
   labels_ <- setNames(Q_labels, Q_labels)
   scale_labels <- lapply(labels_, function(q) c(paste0(q,"+"), paste0(q,"-")))
   if (is.null(a_Q) || !is.vector(a_Q))
      a_Q = apply(x, 2, min, na.rm = TRUE)
   else if (length(a_Q) != cardQ)
      stop("the length of *a_Q* must be equal the number of columns of *x*")
   a_Q <- setNames(a_Q, Q_labels)
   if (is.null(b_Q) || !is.vector(b_Q))
      b_Q = apply(x, 2, max, na.rm = TRUE)
   else if (length(b_Q)!=cardQ)
      stop("the length of *b_Q* must be equal the number of columns of *x*")
   b_Q <- setNames(b_Q, Q_labels)
   stopifnot("*a_Q* must be less than *b_Q* for any question" = {is.vector(a_Q) & is.vector(b_Q) & all(a_Q < b_Q)})
   params <- list(Dimension = c(cardI, cardQ),
                  n_I = n_I, m_Q = m_Q, w_Q = w_Q,
                  Labels = list(Individu = I_labels, Variable = Q_labels),
                  Scale = scale_labels,
                  a_Q = a_Q, b_Q = b_Q)
   return(params)
}
