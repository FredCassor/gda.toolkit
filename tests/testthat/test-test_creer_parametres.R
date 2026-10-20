df <- data.frame(matrix(sample(1:4, 40, replace = TRUE), nrow = 10))

test_that("creer_parametres fonctionne", {
   p <- creer_parametres(x = df)
   expect_type(p, 'list')
   expect_equal(length(p), 8)
   expect_named(p, c("Dimension", "n_I", "m_Q", "w_Q", "Labels", "Scale", "a_Q", "b_Q"))
})

#test_that("la fonction renvoie une erreur sur les options a_Q ou b_Q", {
#   expect_error(creer_parametres(df, a_Q = as.array(c(1,NA,1,1,1))))
#   expect_error(creer_parametres(df, b_Q = as.array(c(1,NA,1,NA,1))))
#})
