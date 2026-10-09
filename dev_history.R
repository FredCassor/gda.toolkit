# Ajout de `dev_history.R` à `.Rbuildignore` ----
usethis::use_build_ignore("dev_history.R")
# Modification du titre et de la description du package
desc::desc_set(Title = "Boîte à outils de l'Analyse Géométrique des Données")
desc::desc_set(Description = "Ce paquet offre des fonctions et des méthodes pour mettre en oeuvre une analyse géométrique des données en R.")
# Gestion de la licence (GPL3)
usethis::use_gpl3_license()
# Gestion de la langue du package
desc::desc_set(Language = "fr")

# Outils de développement de package ----
attachment::att_amend_desc()  # modification de la documentation
devtools::check()             # check du package

# Installation du controle de version du package via Git et GitHub
usethis::use_git()
usethis::use_github(organisation = NULL)
# Modification du README
usethis::use_readme_rmd()
devtools::build_readme()
# Ajout de fonctions dans R/
usethis::use_r("")

# Gestion d'un fichier data dans data-raw/
dir.create("inst/extdata", recursive = TRUE, showWarnings = FALSE)
usethis::use_data_raw("ressources")
