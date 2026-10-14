## code to prepare `confiance` dataset goes here

# Fichiers CSV de données brutes
vague9 <- system.file("extdata/Confiance2017.csv", package = "gda.toolkit")
vague14 <- system.file("extdata/Confiance2022.csv", package = "gda.toolkit")
vague16 <- system.file("extdata/Confiance2025.csv", package = "gda.toolkit")

# Import des CSV dans un data.frame
datav9 <- read.csv2(vague9, row.names = 1, stringsAsFactors = TRUE, fileEncoding = "Latin1")
datav14 <- read.csv2(vague14, row.names = 1, stringsAsFactors = TRUE, fileEncoding = "Latin1")
datav16 <- read.csv2(vague16, row.names = 1, stringsAsFactors = TRUE, fileEncoding = "Latin1")

# Préparation des data.frames
datav9$Annee <- 2017
df1 <- dplyr::select(datav9, c(Annee,CMunicipal:GensReligion))
df1 <- dplyr::select(df1, -FranceUE)
df1 <- tibble::remove_rownames(df1)

datav14$Annee <- 2022
df2 <- dplyr::select(datav14, c(Annee,CMunicipal:GensReligion))
df2 <- dplyr::select(df2, -FranceUE)
df2 <- tibble::remove_rownames(df2)

datav16$Annee <- 2025
df3 <- dplyr::select(datav16, c(Annee,CMunicipal:GensReligion))
df3 <- tibble::remove_rownames(df3)

# Concaténation des 3 data.frames selon les colonnes
confiance <- dplyr::bind_rows(list(df1, df2, df3))

# Export du dataset dans data/
usethis::use_data(confiance, overwrite = TRUE)

# Documentation des data
checkhelper::fix_dataset_doc("confiance")

# Construction d'un tableau d'example pour le développement et les tests
a <- dplyr::slice_sample(df1, n = 10)
b <- dplyr::slice_sample(df2, n = 15)
example <- dplyr::bind_rows(list(a, b))
example <- example[, c("Annee", "CMunicipal", "Gouvernement","InstitPresident", "Medias")]
readr::write_csv2(example, file = "inst/extdata/example.csv", na = "")
