
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

## Example

Voici un example de comment utiliser les fonctionnalités du package :

``` r
library(gda.toolkit)
## basic example code
```

On a un résumé du tableau de données de la confiance :

``` r
summary(confiance)
#>      Annee        CMunicipal       CGeneral       CRegional    
#>  Min.   :2017   Min.   :1.000   Min.   :1.000   Min.   :1.000  
#>  1st Qu.:2022   1st Qu.:2.000   1st Qu.:2.000   1st Qu.:2.000  
#>  Median :2022   Median :2.000   Median :2.000   Median :3.000  
#>  Mean   :2022   Mean   :2.489   Mean   :2.612   Mean   :2.643  
#>  3rd Qu.:2025   3rd Qu.:3.000   3rd Qu.:3.000   3rd Qu.:3.000  
#>  Max.   :2025   Max.   :4.000   Max.   :4.000   Max.   :4.000  
#>                                                                
#>  AssembleeNationale     Senat        Gouvernement  InstitPresident
#>  Min.   :1.000      Min.   :1.000   Min.   :1.00   Min.   :1.000  
#>  1st Qu.:2.000      1st Qu.:2.000   1st Qu.:2.00   1st Qu.:2.000  
#>  Median :3.000      Median :3.000   Median :3.00   Median :3.000  
#>  Mean   :2.994      Mean   :2.923   Mean   :3.09   Mean   :3.021  
#>  3rd Qu.:4.000      3rd Qu.:4.000   3rd Qu.:4.00   3rd Qu.:4.000  
#>  Max.   :4.000      Max.   :4.000   Max.   :4.00   Max.   :4.000  
#>                                                                   
#>     PartiPol           UE           Hopitaux      SecuSociale   
#>  Min.   :1.000   Min.   :1.000   Min.   :1.000   Min.   :1.000  
#>  1st Qu.:3.000   1st Qu.:2.000   1st Qu.:2.000   1st Qu.:2.000  
#>  Median :3.000   Median :3.000   Median :2.000   Median :2.000  
#>  Mean   :3.226   Mean   :2.921   Mean   :2.067   Mean   :2.291  
#>  3rd Qu.:4.000   3rd Qu.:4.000   3rd Qu.:2.000   3rd Qu.:3.000  
#>  Max.   :4.000   Max.   :4.000   Max.   :4.000   Max.   :4.000  
#>                  NA's   :51                                     
#>      Ecole           Police         Justice          Armee      
#>  Min.   :1.000   Min.   :1.000   Min.   :1.000   Min.   :1.000  
#>  1st Qu.:2.000   1st Qu.:2.000   1st Qu.:2.000   1st Qu.:2.000  
#>  Median :2.000   Median :2.000   Median :3.000   Median :2.000  
#>  Mean   :2.272   Mean   :2.165   Mean   :2.678   Mean   :2.095  
#>  3rd Qu.:3.000   3rd Qu.:3.000   3rd Qu.:3.000   3rd Qu.:2.000  
#>  Max.   :4.000   Max.   :4.000   Max.   :4.000   Max.   :4.000  
#>                                                                 
#>    Syndicats      Associations       Medias         Banques    
#>  Min.   :1.000   Min.   :1.000   Min.   :1.000   Min.   :1.00  
#>  1st Qu.:2.000   1st Qu.:2.000   1st Qu.:2.000   1st Qu.:2.00  
#>  Median :3.000   Median :2.000   Median :3.000   Median :3.00  
#>  Mean   :2.875   Mean   :2.354   Mean   :2.968   Mean   :2.79  
#>  3rd Qu.:4.000   3rd Qu.:3.000   3rd Qu.:4.000   3rd Qu.:3.00  
#>  Max.   :4.000   Max.   :4.000   Max.   :4.000   Max.   :4.00  
#>                                                                
#>  GdesEntreprisesPub GdesEntreprisesPriv      PME          Voisins     
#>  Min.   :1.000      Min.   :1.000       Min.   :1.00   Min.   :1.000  
#>  1st Qu.:2.000      1st Qu.:2.000       1st Qu.:2.00   1st Qu.:2.000  
#>  Median :2.000      Median :3.000       Median :2.00   Median :2.000  
#>  Mean   :2.584      Mean   :2.643       Mean   :2.12   Mean   :2.139  
#>  3rd Qu.:3.000      3rd Qu.:3.000       3rd Qu.:2.00   3rd Qu.:3.000  
#>  Max.   :4.000      Max.   :4.000       Max.   :4.00   Max.   :4.000  
#>                                                                       
#>   Gens1erefois    GensAutrNat     GensReligion  
#>  Min.   :1.000   Min.   :1.000   Min.   :1.000  
#>  1st Qu.:2.000   1st Qu.:2.000   1st Qu.:2.000  
#>  Median :3.000   Median :2.000   Median :2.000  
#>  Mean   :2.676   Mean   :2.277   Mean   :2.243  
#>  3rd Qu.:3.000   3rd Qu.:3.000   3rd Qu.:3.000  
#>  Max.   :4.000   Max.   :4.000   Max.   :4.000  
#> 
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

``` r
plot(pressure)
```

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
