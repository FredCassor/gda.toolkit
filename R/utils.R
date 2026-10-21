#  Test de validité des bornes de 'x' ----
test_inputs <- function(x, a_Q = NULL, b_Q = NULL) {
   x <- as.data.frame(x)
   cardQ <- ncol(x)
   if (is.null(a_Q) || anyNA(a_Q) || !is.vector(a_Q))
      a_Q <- apply(x, 2, min, na.rm = TRUE)
   if (is.null(b_Q) || anyNA(b_Q) || !is.vector(b_Q))
      b_Q <- apply(x, 2, max, na.rm = TRUE)
   stopifnot ("'a_Q' must have the same length as the number of columns of 'x'" = length(a_Q)==cardQ,
              "'b_Q' must have the same length as the number of columns of 'x'" = length(b_Q)==cardQ,
              "'a_Q' must be lower than 'b_Q' for any column of 'x'" = all(b_Q - a_Q >0))
   x_mat = as.matrix(x)
   stopifnot("Wrong input value entered for 'a_Q'"= all(sweep(x_mat, 2, a_Q, "-") >=0),
             "Wrong input value entered for 'b_Q'"= all(sweep(x_mat, 2, b_Q, "-") <=0))
   return(list(a_Q = a_Q, b_Q = b_Q))
}

# Fonction utilitaire: validation de la pondération
test_poids <- function(card, poids = NULL) {
   stopifnot("*'card'* must be an integer" = inherits(card, "integer"))
   poids <- if (is.null(poids)) rep(1, card) else as.numeric(poids)
   if (length(poids) != card) stop(sprintf("The length of vector 'poids' %d does not match the expected %d", length(poids), card))
   if (any(is.na(poids))) warning("Weights with *NA* are set to be equal zero.")
   poids[is.na(poids)] <- 0
   if (any(poids<0)) stop("All the weights must be strictly positive.")
   return(poids)
}

# Negation de %in%
`%notin%` <- function(x,y) {!(x %in% y)}

# Moyenne pondérée
average <- function(x, w, ...) {
   x <- as.matrix(x)
   stopifnot("Invalid input parameter for 'w'" = length(w)==nrow(x))
   w[is.na(w)] <- 0
   res <- apply(x, 2, function(x) sum(x * w, ...)) / sum(w, ...)
   res
}


#' Calcul des statistiques descriptives élémentaires
#'
#' @param x une \code{matrix} ou un \code{data.frame}
#' @param n_I un \code{vector} numérique
#' @param m_Q un \code{vector} numérique
#'
#' @returns une \code{list}
#' @export
#'
stat_bsa <- function(x, n_I, m_Q) {
   x_mat = as.matrix(x)
   Ubar_Q <- apply(x_mat, 2, average, n_I)
   varU_Q <- apply(x_mat**2, 2, average, n_I) - Ubar_Q**2
   stdU_Q <- sqrt(varU_Q)
   h_Q <- Ubar_Q * (1-Ubar_Q)
   omega_Q <- (m_Q/h_Q) / sum(m_Q)
   ctr_Q <- omega_Q * varU_Q
   ctr_Q <- 100 * ctr_Q / sum(ctr_Q)
   res = list(Ubar_Q = Ubar_Q, std_Q = stdU_Q, var_Q = varU_Q, h_Q = h_Q,
              omega_Q = omega_Q, contrib_Q = ctr_Q)
   return(res)
}
#U_IQ <- scaler_bsa(data.actif, a_Q, b_Q, params = parametres, inverse = TRUE)
#stat_bsa(U_IQ, parametres$n_I, parametres$m_Q)
