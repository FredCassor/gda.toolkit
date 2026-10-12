# Ajout de `dev_history.R` à `.Rbuildignore` ----
usethis::use_build_ignore("dev_history.R")
# Modification du titre et de la description du package
desc::desc_set(Title = "Boîte à outils pour l'Analyse Géométrique des Données")
desc::desc_set(Description = "Ce paquet offre des fonctions et des méthodes pour mettre en oeuvre une analyse géométrique des données en R.")
# Gestion de la licence (GPL3)
usethis::use_gpl3_license()
# Gestion de la langue du package
desc::desc_set(Language = "fr")

# Gestion des dépendences et documentation du package
attachment::att_amend_desc()
# Check du package
devtools::check()

# Installation du controle de version du package via Git et GitHub
usethis::use_git()
usethis::use_github(organisation = NULL)

# Modification du README
usethis::use_readme_rmd()
devtools::build_readme()

# Gestion de GlobalVariables
checkhelper::fix_globals()
usethis::use_r("globals")

# Ajout d'une vignette
usethis::use_vignette("aa-exploration")

# Ajout de fonctions dans R/
usethis::use_r("filtre-par-annee")

# Création du répertoire inst/extdata pour les fichiers externes (CSV,...)
dir.create("inst/extdata", recursive = TRUE, showWarnings = FALSE)
# Copie d'un fichier plat CSV vers inst/extdata
occupation <- file.path("~/Data/Metiers","Occupations-dble-table.csv")
file.copy(occupation, file.path("inst","extdata","Occupations-dble-table.csv"), recursive = TRUE)
# Gestion du fichier de données brutes "occupations"
usethis::use_data_raw("occupations")
usethis::use_data_raw("confiance")

# Journal des modifications dans le package
usethis::use_news_md()
# Gestion des versions de développement du package
usethis::use_version()
usethis::use_dev_version()

# Ajout des packages externes dans la documentation
usethis::use_package("dplyr")
# Ajout des tests unitaires des fonctions R
usethis::use_testthat()
usethis::use_test("test_filtres")
devtools::test()
# Chargement des fonctions R et data du package
devtools::load_all()
# Installation du package sur le disque
devtools::install()

# Publier le package en ligne
pkgdown::build_site()
