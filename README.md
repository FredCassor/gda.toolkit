
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gda.toolkit

<!-- badges: start -->

<!-- badges: end -->

Le but du package `{gda.toolkit}` est de proposer un ensemble d’outils
et une méthodologie d’Analyse Géométrique des Données en R.

## Installation

La version en développement de gda.tool `{gda.toolkit}` peut s’installer
depuis [GitHub](https://github.com/) avec :

``` r
# install.packages("pak")
pak::pak("FredCassor/gda.toolkit")
```

Au cas où quelque chose ne va pas, vous pouvez installer les packages
suivants avant en utilisant :

``` r
a_installer <- c("dplyr")
for (i in a_installer) {
   if (!requireNamespace(i)) {
      message(paste(" - installation de", i))
      install.packages(i, dependencies = TRUE)
   }
}
```

## Comment utiliser les fonctions du package

Voici un example de comment utiliser les fonctionnalités du package :

``` r
library(gda.toolkit)
library(dplyr)
#> Warning: le package 'dplyr' a été compilé avec la version R 4.5.3
```

On importe le tableau de données de l’exemple dans la session R :

``` r
datapath <- system.file("extdata/example.csv", package = "gda.toolkit")
example <- read.csv2(datapath)
glimpse(example)
#> Rows: 43
#> Columns: 5
#> $ Annee           <int> 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, …
#> $ CMunicipal      <int> 3, 2, 3, 3, 2, 4, 2, 3, 2, 2, 2, 1, 4, 2, 2, 3, 2, 2, …
#> $ Gouvernement    <int> 3, 2, 4, 2, 3, 4, 4, 3, 2, 3, 4, 3, 4, 4, 2, 2, 2, 2, …
#> $ InstitPresident <int> 3, 2, 3, 3, 3, 2, 4, 2, 2, 3, 4, 2, 4, 4, 2, 3, 2, 2, …
#> $ UE              <int> 3, 3, 3, 3, 3, 4, 4, 3, 2, 3, 4, 2, 4, 4, 2, 2, 2, 2, …
```
