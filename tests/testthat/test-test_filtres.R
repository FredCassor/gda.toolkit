# Example utilisé pour les tests -----------------------------------------------
filename <- system.file("extdata/example.csv", package = "gda.toolkit")
example <- read.csv2(filename)

# Tests ------------------------------------------------------------------------
test_that("la fonction renvoie un data.frame", {
   df_filtre <- filtre_par_annee(example, 2017)
   testthat::expect_s3_class(df_filtre, "data.frame")
})
test_that("la fonction retourne les dimensions exactes du data.frame", {
   df_filtre <- filtre_par_annee(example, 2017)
   testthat::expect_equal(nrow(df_filtre), 10)
   testthat::expect_equal(ncol(df_filtre), 5)
})
test_that("la fonction renvoie une erreur en l'absence d'une colonne 'Annee'", {
   df_error = data.frame(CMunicipal = c(3, 2, 3, 1, 4),
                         Gouvernement = c(3, 2, 2, 2, 3))
   expect_error(filtre_par_annee(x = df_error, annee = 2017))
})
