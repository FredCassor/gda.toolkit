#' Transformation d'un tableau par dédoublement des colonnes
#'
#' La fonction effectue un recodage par dédoublement des colonnes d'un tableau.
#'
#' @param x un \code{data.frame}
#' @param params une \code{list} de paramètres d'entrée
#' @param reverse logical. Le codage des données devrait-il être inversé ?
#'
#' @returns un \code{data.frame} avec les colonnes dédoublées
#' @importFrom readr read_csv2
#' @export
#'
#' @examples
#' library(readr)
#' filename <- system.file("extdata/example.csv", package = "gda.toolkit")
#' example <- read_csv2(filename, col_select = -Annee)
#' parametres <- creer_parametres(example, a_Q = rep(1, ncol(example)))
#' df <- transform_double(example, params = parametres)
#' head(df)
transform_double <- function(x, params, reverse = FALSE) {
   x <- as.data.frame(x)
   cardQ <- ncol(x)
   row_names <- get("labels", params)$Individu
   a_Q <- get("min", params)
   b_Q <- get("max", params)
   scale_labels <- get("scale", params)
   if (is.null(a_Q) || !is.vector(a_Q))
      a_Q = apply(x, 2, min, na.rm = TRUE)
   else if (length(a_Q) != cardQ)
      stop("the length of *a_Q* must be equal the number of columns of *x*")
   if (is.null(b_Q) || !is.vector(b_Q))
      b_Q = apply(x, 2, max, na.rm = TRUE)
   else if (length(b_Q) != cardQ)
      stop("the length of *b_Q* must be equal the number of columns of *x*")
   if (any(a_Q > b_Q))
      stop("*a_Q* must be less than *b_Q* for any question")
   e_Q <- b_Q - a_Q
   if (reverse) {
      x_inv <- lapply(1:ncol(x), function(q) b_Q[q] - x[, q] + 1)
      x <- as.data.frame(x_inv, row.names = row_names, col.names = colnames(x))
   }
   recode_double <- function(q) {
      col1 = (x[, q] - a_Q[q]) / e_Q[q]
      col2 = (b_Q[q] - x[, q]) / e_Q[q]
      new_col <- cbind(col1, col2)
      dimnames(new_col) <- list(row_names, scale_labels[[q]])
      return(new_col)
   }
   res <- lapply(1:ncol(x), recode_double)
   res <- do.call(cbind, res)
   return(as.data.frame(res, check.names = FALSE))
}
