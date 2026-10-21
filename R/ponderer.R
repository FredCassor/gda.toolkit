#' Pondérer les colonnes d'un tableau de données ou d'une matrice
#'
#' Le tableau de données est affecté d'une pondération sur les colonnes.
#'
#' @param x un \code{data.frame} ou une \code{matrix}
#' @param p un \code{vector}
#'
#' @returns un \code{data.frame}
#' @export
#' @import utils
#'
#' @examples
#' library(readr)
#' filename <- system.file("extdata/example.csv", package = "gda.toolkit")
#' example <- read_csv2(filename, col_select = -Annee)
#' m_Q <- c(2,2,5,10)
#' df <- ponderer(example, m_Q)
#' head(df)
ponderer <- function(x, p = NULL)
{
   mat <- as.matrix(x)
   cardQ <- dim(x)[2]
   I_labels <- if (inherits(x, "data.frame")) rownames(x) else seq(1, nrow(x))
   Q_labels <- if (inherits(x, "data.frame")) colnames(x) else paste0("V", 1:ncol(x))
   p <- test_poids(cardQ, p)
   y <- mat %*% diag(p)
   dimnames(y) <- list(I_labels, Q_labels)
   if (inherits(x, "data.frame")) {
      y <- data.frame(y, check.names = FALSE)
      return(y)
   }
   else
      return(y)
}
