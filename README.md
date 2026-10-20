
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gda.toolkit

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

Le but du package `{gda.toolkit}` est de fournir un ensemble d’outils et
une méthodologie d’Analyse Géométrique des Données en R.

## Installation

La version en développement de `{gda.toolkit}` peut s’installer depuis
[GitHub](https://github.com/) avec :

``` r
# install.packages("pak")
pak::pak("FredCassor/gda.toolkit")
```

Au cas où quelque chose ne va pas, vous pouvez installer les packages
suivants avant :

``` r
a_installer <- c("dplyr","readr")
for (i in a_installer) {
   if (!requireNamespace(i)) {
      message(paste(" - installation de", i))
      install.packages(i, dependencies = TRUE)
   }
}
```

## Utilisation

Voici un example de comment utiliser les fonctionnalités du package :

``` r
library(gda.toolkit)
library(dplyr)
```

On importe le tableau de données de l’exemple dans la session R :

``` r
datapath <- system.file("extdata/example.csv", package = "gda.toolkit")
example <- read.csv2(datapath)
# Aperçu
glimpse(example)
#> Rows: 25
#> Columns: 5
#> $ Annee           <int> 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, …
#> $ CMunicipal      <int> 2, 2, 4, 4, 3, 3, 1, 3, 2, 3, 1, 2, 2, 3, 3, 2, 2, 3, …
#> $ Gouvernement    <int> 2, 2, 4, 3, 3, 3, 3, 4, 3, 3, 1, 3, 3, 4, 3, 3, 4, 4, …
#> $ InstitPresident <int> 2, 2, 4, 2, 3, 3, 2, 3, 3, 3, 1, 2, 3, 3, 3, 3, 4, 4, …
#> $ Medias          <int> 4, 2, 4, 4, 3, 4, 3, 3, 2, 3, 1, 2, 3, 3, 4, 1, 4, 4, …
```

Voici le tri à plat de l’ensemble des variables du jeu de données.

``` r
apply(example, 2, table)
#> $Annee
#> 
#> 2017 2022 
#>   10   15 
#> 
#> $CMunicipal
#> 
#>  1  2  3  4 
#>  2 12  8  3 
#> 
#> $Gouvernement
#> 
#>  1  2  3  4 
#>  2  4 10  9 
#> 
#> $InstitPresident
#> 
#> 1 2 3 4 
#> 2 7 9 7 
#> 
#> $Medias
#> 
#> 1 2 3 4 
#> 3 6 7 9
```
